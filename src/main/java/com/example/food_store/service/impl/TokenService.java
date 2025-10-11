package com.example.food_store.service.impl;

import org.springframework.stereotype.Service;

import com.example.food_store.domain.Token;
import com.example.food_store.repository.TokenRepository;
import com.example.food_store.service.ITokenService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TokenService implements ITokenService {
    private final TokenRepository tokenRepository;

    @Override
    public String getEmailByToken(String token) {
        return this.tokenRepository.findEmailByToken(token);
    }

    @Override
    public void saveToken(Token token) {
        this.tokenRepository.save(token);
    }

}
