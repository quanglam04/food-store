package com.example.food_store.exception;

import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.OAuth2Error;

public class CustomOAuth2Exception extends OAuth2AuthenticationException {
    public CustomOAuth2Exception(String msg) {
        super(new OAuth2Error("custom_error"), msg);
    }
}