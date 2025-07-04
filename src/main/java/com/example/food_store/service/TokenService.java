package com.example.food_store.service;

import org.springframework.stereotype.Service;

import com.example.food_store.domain.Token;
import com.example.food_store.repository.TokenRepository;

@Service
public class TokenService {
    private final TokenRepository tokenRepository;
    public TokenService(TokenRepository tokenRepository) {
        this.tokenRepository = tokenRepository;
    }
    public String getEmailByToken(String token) {
        return this.tokenRepository.findEmailByToken(token);
    }
    public void saveToken(Token token) {
        this.tokenRepository.save(token);
    }

}
