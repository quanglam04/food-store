package com.example.food_store.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.example.food_store.domain.Cart;
import com.example.food_store.domain.CartDetail;
import com.example.food_store.domain.Order;
import com.example.food_store.domain.OrderDetail;
import com.example.food_store.domain.Product;
import com.example.food_store.domain.User;
import com.example.food_store.domain.dto.ProductCriteriaDTO;
import com.example.food_store.repository.CartDetailRepository;
import com.example.food_store.repository.CartRepository;
import com.example.food_store.repository.OrderDetailRepository;
import com.example.food_store.repository.OrderRepository;
import com.example.food_store.repository.ProductRepository;
import com.example.food_store.service.specification.ProductSpecification;

import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final ProductRepository productRepository;
    private final UserService userService;
    private final OrderDetailRepository orderDetailRepository;
    private final OrderRepository orderRepository;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService,

            OrderDetailRepository orderDetailRepository, OrderRepository orderRepository)

    {
        this.productRepository = productRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.cartRepository = cartRepository;
        this.userService = userService;
        this.orderDetailRepository = orderDetailRepository;
        this.orderRepository = orderRepository;
    }

    public long getQuantitybyType(String type) {
        return this.productRepository.countByType(type);
    }

    public Product createProduct(Product prd) {
        return this.productRepository.save(prd);
    }

    public void updatePaymentStatus(String paymentRef, String paymentStatus) {
        Order order = this.orderRepository.findByPaymentRef(paymentRef);
        order.setPaymentStatus(paymentStatus);
    }

    public Page<Product> fetchProducts(Pageable pageable) {
        return this.productRepository.findAll(pageable);
    }

    public List<Product> fetchProductByType(String type) {
        return this.productRepository.findByType(type);
    }

    public Page<Product> fetchProductsWithSpec(Pageable page, ProductCriteriaDTO productCriteriaDTO) {
        if (productCriteriaDTO.getTarget() == null

                && productCriteriaDTO.getPrice() == null
                && productCriteriaDTO.getType() == null
                && productCriteriaDTO.getCustomertarget() == null
                && productCriteriaDTO.getText() == null) {
            return this.productRepository.findAll(page);
        }

        Specification<Product> combinedSpec = Specification.where(null);
        if (productCriteriaDTO.getText() != null && productCriteriaDTO.getText().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecification
                    .nameLike(productCriteriaDTO.getText().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (productCriteriaDTO.getTarget() != null && productCriteriaDTO.getTarget().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecification
                    .matchListTarget(productCriteriaDTO.getTarget().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }

        if (productCriteriaDTO.getType() != null && productCriteriaDTO.getType().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecification
                    .matchListType(productCriteriaDTO.getType().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }

        if (productCriteriaDTO.getCustomertarget() != null && productCriteriaDTO.getCustomertarget().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecification
                    .matchListcustomerTarget(productCriteriaDTO.getCustomertarget().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }

        if (productCriteriaDTO.getPrice() != null && productCriteriaDTO.getPrice().isPresent()) {
            Specification<Product> currentSpecs = this.buildPriceSpecification(productCriteriaDTO.getPrice().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }

        return this.productRepository.findAll(combinedSpec, page);
    }

    public Specification<Product> buildPriceSpecification(List<String> price) {
        Specification<Product> combinedSpec = Specification.where(null);
        for (String p : price) {
            int min = 0;
            int max = 0;

            switch (p) {
                case "duoi-100-nghin":
                    min = 0;
                    max = 100000;
                    break;
                case "100-150-nghin":
                    min = 100000;
                    max = 150000;
                    break;
                case "150-200-nghin":
                    min = 150000;
                    max = 200000;
                    break;
                case "tren-200-nghin":
                    min = 200000;
                    max = 99999999;
                    break;
            }

            if (max != 0) {
                Specification<Product> rangeSpec = ProductSpecification.matchMultiplePrice(min, max);
                combinedSpec = combinedSpec.or(rangeSpec);
            }
        }

        return combinedSpec;
    }

    public List<Product> fetchAllProductsToHomePage() {
        return this.productRepository.findAll();
    }

    public void deleteProductById(long id) {
        this.productRepository.deleteById(id);
    }

    public Optional<Product> fetchProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session, long quantity) {

        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            // check user đã có Cart chưa ? nếu chưa -> tạo mới
            Cart cart = this.cartRepository.findByUser(user);

            if (cart == null) {
                // tạo mới cart
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);

                cart = this.cartRepository.save(otherCart);
            }

            // save cart_detail
            // tìm product by id

            Optional<Product> productOptional = this.productRepository.findById(productId);
            if (productOptional.isPresent()) {
                Product realProduct = productOptional.get();

                // check sản phẩm đã từng được thêm vào giỏ hàng trước đây chưa ?
                CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);
                //
                if (oldDetail == null) {
                    CartDetail cd = new CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(realProduct);
                    cd.setPrice(realProduct.getPrice());
                    cd.setQuantity(quantity);
                    this.cartDetailRepository.save(cd);

                    // update cart (sum);
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    oldDetail.setQuantity(oldDetail.getQuantity() + quantity);
                    this.cartDetailRepository.save(oldDetail);
                }

            }

        }
    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetaiOptional = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetaiOptional.isPresent()) {
            CartDetail cartDetail = cartDetaiOptional.get();
            Cart currentCart = cartDetail.getCart();
            this.cartDetailRepository.deleteById(cartDetailId);
            if (currentCart.getSum() > 1) {
                int s = currentCart.getSum() - 1;
                currentCart.setSum(s);
                session.setAttribute("sum", s);
                this.cartRepository.save(currentCart);
            } else {
                this.cartRepository.deleteById(currentCart.getId());
                session.setAttribute("sum", 0);

            }
        }
    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }

    public void handlePlaceOrder(
            User user, HttpSession session,
            String receiverName, String receiverAddress, String receiverPhone, String paymentMethod, String uuid) {

        // step 1: get cart by user
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();

            if (cartDetails != null) {

                // create order
                Order order = new Order();
                order.setUser(user);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setStatus("Chưa xử lý");

                order.setPaymentMethod(paymentMethod);
                order.setPaymentStatus("Chưa thanh toán");
                order.setPaymentRef(paymentMethod.equals("COD") ? "UNKNOWN" : uuid);
                double sum = 0;
                for (CartDetail cd : cartDetails) {
                    sum += cd.getPrice() * cd.getQuantity();
                    System.out.println(cd.getPrice());
                }

                order.setTotalPrice(sum);
                order = this.orderRepository.save(order);

                // create orderDetail

                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());

                    this.orderDetailRepository.save(orderDetail);
                }

                // step 2: delete cart_detail and cart
                for (CartDetail cd : cartDetails) {
                    this.cartDetailRepository.deleteById(cd.getId());
                }

                this.cartRepository.deleteById(cart.getId());

                // step 3 : update session
                session.setAttribute("sum", 0);
            }
        }

    }

    public List<Order> fetchOrders() {
        return this.orderRepository.findAll();
    }

    public long countProduct() {
        return this.productRepository.count();
    }

    public List<String> getAllNames() {
        List<Product> products = this.productRepository.findAll();
        List<String> names = new ArrayList<String>();
        for (Product product : products) {
            names.add("\"" + product.getName() + "\"");
        }
        return names;
    }
}
