package com.example.food_store.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.food_store.domain.Cart;
import com.example.food_store.domain.User;
import com.example.food_store.repository.CartRepository;

@Service
public class CartService {
    private final CartRepository cartRepository;
    public CartService(CartRepository cartRepository){
        this.cartRepository = cartRepository;
    }

    public Cart getCartByID(Long id) {
        Optional<Cart> cart = this.cartRepository.findById(id);
        if (cart.isPresent())
            return cart.get();
        return null;
    }
    public Cart findByUser(User user){
        return cartRepository.findByUser(user);
    }

    public Cart saveCart(Cart cart){
        return this.cartRepository.save(cart);
    }
}
