package com.example.food_store.service;

import com.example.food_store.domain.Token;

public interface ITokenService {
    void saveToken(Token token);
    String getEmailByToken(String token);
}
