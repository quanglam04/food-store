package com.example.food_store.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import com.example.food_store.domain.Cart;
import com.example.food_store.domain.CartDetail;
import com.example.food_store.domain.Order;
import com.example.food_store.domain.Product;
import com.example.food_store.domain.User;
import com.example.food_store.domain.dto.ProductCriteriaDTO;

import jakarta.servlet.http.HttpSession;

public interface IProductService {
    void updatePaymentStatus(String paymentRef, String paymentStatus);
    void deleteProductById(long id);
    void handleAddProductToCart(String email, long productId, HttpSession session, long quantity);
    void handleRemoveCartDetail(long cartDetailId, HttpSession session);
    void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails);
    void handlePlaceOrder(User user, HttpSession session,String receiverName, String receiverAddress, String receiverPhone, String paymentMethod, String uuid,double totalPrice);
    long getQuantitybyType(String type);
    long countProduct();
    Cart fetchByUser(User user);
    Product createProduct(Product prd);
    Page<Product> fetchProducts(Pageable pageable);
    Page<Product> fetchProductsWithSpec(Pageable page, ProductCriteriaDTO productCriteriaDTO);
    Specification<Product> buildPriceSpecification(List<String> price);
    Optional<Product> fetchProductById(long id);
    List<Product> fetchAllProductsToHomePage();
    List<Product> fetchProductByType(String type);
    List<Order> fetchOrders(); 
    List<String> getAllNames();
}
