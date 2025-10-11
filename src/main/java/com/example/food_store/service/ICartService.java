package com.example.food_store.service;

import com.example.food_store.domain.Cart;
import com.example.food_store.domain.User;

public interface ICartService {
    Cart getCartByID(Long id);
    Cart findByUser(User user);
    Cart saveCart(Cart cart);
}
