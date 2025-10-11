package com.example.food_store.service.impl;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.food_store.domain.Cart;
import com.example.food_store.domain.User;
import com.example.food_store.repository.CartRepository;
import com.example.food_store.service.ICartService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartService implements ICartService {
    private final CartRepository cartRepository;

    @Override
    public Cart getCartByID(Long id) {
        Optional<Cart> cart = this.cartRepository.findById(id);
        if (cart.isPresent())
            return cart.get();
        return null;
    }
    
    @Override
    public Cart findByUser(User user){
        return cartRepository.findByUser(user);
    }

    @Override
    public Cart saveCart(Cart cart){
        return this.cartRepository.save(cart);
    }
}
