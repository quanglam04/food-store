package com.example.food_store.service;

import org.springframework.security.core.userdetails.UserDetails;

public interface ICustomUserDetailsService {
    UserDetails loadUserByUsername(String username);
}
