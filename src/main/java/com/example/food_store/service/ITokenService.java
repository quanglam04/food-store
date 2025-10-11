package com.example.food_store.service;

import com.example.food_store.domain.Token;

public interface ITokenService {
    String getEmailByToken(String token);
    void saveToken(Token token);
}
