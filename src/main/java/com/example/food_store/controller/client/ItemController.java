package com.example.food_store.controller.client;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.food_store.domain.Cart;
import com.example.food_store.domain.CartDetail;
import com.example.food_store.domain.Product;
import com.example.food_store.domain.Product_;
import com.example.food_store.domain.User;
import com.example.food_store.domain.dto.ProductCriteriaDTO;
import com.example.food_store.service.CartService;
import com.example.food_store.service.ProductService;
import com.example.food_store.service.UserService;
import com.example.food_store.service.VNPAYService;
import com.example.food_store.service.sendEmail.SendEmail;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ItemController {
    private final ProductService productService;
    private final UserService userService;
    private final SendEmail sendEmail;
    private final VNPAYService vnpayService;
    private final CartService cartService;

    public ItemController(ProductService productService, UserService userService,
            SendEmail sendEmail, VNPAYService vnpayService, CartService cartService) {
        this.productService = productService;
        this.userService = userService;
        this.sendEmail = sendEmail;
        this.vnpayService = vnpayService;
        this.cartService = cartService;
    }

    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {
        Product prd = this.productService.fetchProductById(id).get();
        long number_1 = this.productService.getQuantitybyType("rau");
        long number_2 = this.productService.getQuantitybyType("cu");
        long number_3 = this.productService.getQuantitybyType("trai-cay");
        long number_4 = this.productService.getQuantitybyType("thuc-pham-giau-protein");
        long number_5 = this.productService.getQuantitybyType("thuc-uong");
        Long number_6 = this.productService.getQuantitybyType("thuc-pham-chua-tinh-bot");

        model.addAttribute("number_1", number_1);
        model.addAttribute("number_2", number_2);
        model.addAttribute("number_3", number_3);
        model.addAttribute("number_4", number_4);
        model.addAttribute("number_5", number_5);
        model.addAttribute("number_6", number_6);
        model.addAttribute("prd", prd);

        return "client/product/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long productId = id;
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, productId, session, 1);
        return "redirect:/products";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);
        Cart cart = this.productService.fetchByUser(currentUser);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cartDetail : cartDetails)
            totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        model.addAttribute("cart", cart);
        return "client/cart/show";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        this.productService.handleRemoveCartDetail(cartDetailId, session);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String getCheckOutPage(Model model, HttpServletRequest request,@RequestParam("cost") int cost, @RequestParam("detailAddress") String detailAddress) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);
        currentUser = userService.getUserById(id);

        Cart cart = this.productService.fetchByUser(currentUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }
        totalPrice += cost;

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cost", cost);
        model.addAttribute("detailAddress",detailAddress);
        model.addAttribute("fullName",currentUser.getFullName());

        return "client/cart/checkout";
    }

    @GetMapping("/user/order/calculate-fee")
    public String calculateFee(@ModelAttribute("cart") Cart cart, HttpServletRequest request){
        // lưu cart detail theo thông tin hiện có của cart
        // tìm thông tin của  cart có ID = id của cart được gửi lên
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        User currentUser = new User();
        currentUser.setId(id);
        Cart currentCart = this.cartService.findByUser(currentUser);
        List<CartDetail> currentListCartDetail = currentCart.getCartDetails();
        List<CartDetail> listCartDetailFromView = cart.getCartDetails();
        for(CartDetail cartDetail : currentListCartDetail){
            // với mỗi cartDetail này số lượng phải bằng với cartDetail trong cart gửi từ view lên
            for(CartDetail cartDetail2 : listCartDetailFromView)
                if(Long.compare(cartDetail.getId(),cartDetail2.getId()) == 0)
                    // cập nhật số lượng của cartDetail = số lượng cartDetail2
                        cartDetail.setQuantity(cartDetail2.getQuantity());
                
        }
        this.cartService.saveCart(currentCart);
        // lặp qua tất cả cartDetail của cart này và cập nhật số lượng trong cartDetail bằng với số lượng cart gửi lên từ view
        return "client/cart/calculate-fee";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(
            HttpServletRequest request,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone,
            @RequestParam("paymentMethod") String paymentMethod,
            @RequestParam("totalPrice") String totalPrice) throws UnsupportedEncodingException {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        final String uuid = UUID.randomUUID().toString().replace("-", "");

        this.productService.handlePlaceOrder(currentUser, session, receiverName, receiverAddress, receiverPhone,
                paymentMethod, uuid,Double.parseDouble(totalPrice));
        if (!paymentMethod.equals("COD")) {
            String ip = this.vnpayService.getIpAddress(request);
            String vnpUrl = this.vnpayService.generateVNPayURL(Double.parseDouble(totalPrice), uuid, ip);

            return "redirect:" + vnpUrl;
        }
        return "redirect:/afterOrder";
    }

    @GetMapping("/afterOrder")
    public String getAfterOrderPage(HttpServletRequest request,
            @RequestParam("vnp_ResponseCode") Optional<String> vnpayResponseOptional,
            @RequestParam("vnp_TxnRef") Optional<String> paymentRef) {
        HttpSession session = request.getSession(false);
        Long id = (long) session.getAttribute("id");

        User user = this.userService.getUserById(id);
        String email = user.getEmail();

        sendEmail.sendEmail(email, "Xác nhận đơn hàng",
                "FoodStore chân thành cảm ơn bạn vì đã sử dụng sản phẩm của chúng tôi!");

        if (vnpayResponseOptional.isPresent() && paymentRef.isPresent()) {
            // cap nhat trang thai order
            String paymentStatus = vnpayResponseOptional.get().equals("00") ? "Thanh toán thành công"
                    : "Thanh toán thất bại";
            this.productService.updatePaymentStatus(paymentRef.get(), paymentStatus);
        }

        return "client/cart/after-order";
    }

    @PostMapping("/add-product-from-view-detail")
    public String handleAddProductFromViewDetail(
            @RequestParam("id") long id,
            @RequestParam(value = "quantity", defaultValue = "1") long quantity,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, id, session, quantity);

        return "redirect:/product/" + id;
    }

    @GetMapping("/products")
    public String getProductPage(Model model, ProductCriteriaDTO productCriteriaDTO,
            HttpServletRequest request) {
        int page = 1;
        try {
            if (productCriteriaDTO.getPage().isPresent()) {
                // convert from String to int
                page = Integer.parseInt(productCriteriaDTO.getPage().get());
            } else {
                // page = 1
            }

            Pageable pageable = PageRequest.of(page - 1, 6);
        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            String sort = productCriteriaDTO.getSort().get();
            if (sort.equals("gia-tang-dan")) {
                pageable = PageRequest.of(page - 1, 6, Sort.by(Product_.PRICE).ascending());
            } else if (sort.equals("gia-giam-dan")) {
                pageable = PageRequest.of(page - 1, 6, Sort.by(Product_.PRICE).descending());
            } else {
                pageable = PageRequest.of(page - 1, 6);
            }
        }

        Page<Product> prs = this.productService.fetchProductsWithSpec(pageable, productCriteriaDTO);

        List<Product> products = prs.getContent().size() > 0 ? prs.getContent() : new ArrayList<Product>();
        String qs = request.getQueryString();

        if (qs != null && !qs.isBlank()) {
            qs = qs.replace("page=" + page, "");
        }
        model.addAttribute("nameProducts", productService.getAllNames());
        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("queryString", qs);
        return "client/product/show";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Không tìm thấy trang .");
            return "not-match";
        }
         
    }

     

}
