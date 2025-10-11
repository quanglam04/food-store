package com.example.food_store.controller.client;

import org.springframework.web.bind.annotation.RestController;

import com.example.food_store.service.impl.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

class CartRequest {
    private long quantity;
    private long productId;

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }
}

@RestController
@RequiredArgsConstructor
public class CartAPI {
    private final ProductService productService;

    @PostMapping("/api/add-product-to-cart")
    public ResponseEntity<Integer> addProductToCart(@RequestBody() CartRequest cartRequest, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, cartRequest.getProductId(), session, cartRequest.getQuantity() == 0?1:cartRequest.getQuantity());
        int sum = (int) session.getAttribute("sum");
        return ResponseEntity.ok().body(sum);
    }

}
