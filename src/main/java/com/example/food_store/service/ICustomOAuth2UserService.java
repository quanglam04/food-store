package com.example.food_store.service;

import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.user.OAuth2User;

public interface ICustomOAuth2UserService {
    OAuth2User loadUser(OAuth2UserRequest userRequest);
    
}
