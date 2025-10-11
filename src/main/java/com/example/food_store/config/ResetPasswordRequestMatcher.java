package com.example.food_store.config;

import org.springframework.security.web.util.matcher.RequestMatcher;

import jakarta.servlet.http.HttpServletRequest;

public class ResetPasswordRequestMatcher implements RequestMatcher {
    @Override
      public boolean matches(HttpServletRequest request) {
        String requestURI = request.getRequestURI();
        return requestURI.contains("/reset-password");
    }
}
