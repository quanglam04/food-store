package com.example.food_store.service.userInfo;

import java.util.Collections;
import java.util.Map;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.example.food_store.domain.Role;
import com.example.food_store.domain.User;
import com.example.food_store.service.UserService;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {
    private final UserService userService;

    public CustomOAuth2UserService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = super.loadUser(userRequest);
        Map<String, Object> attributes = oAuth2User.getAttributes();

        // get provider
        String registrationeId = userRequest.getClientRegistration().getRegistrationId();
        // Process oAuth2User or map it to your local user database
        String email = (String) attributes.get("email");
        String fullName = (String) attributes.get("name");
        Role userRole = this.userService.getRoleByName("USER");
        if (email != null) {
            User user = this.userService.getUserByEmail(email);
            if (user == null) {
                // craete new user
                User oldUser = new User();
                oldUser.setEmail(email);
                oldUser.setAvatar(
                        registrationeId.equalsIgnoreCase("github") ? "default-github.png" : "default-google.png");
                oldUser.setFullName(fullName);
                oldUser.setProvider(registrationeId.equalsIgnoreCase("github") ? "GITHUB" : "GOOGLE");
                oldUser.setPassword("trinhlam");
                oldUser.setRole(userRole);
                this.userService.saveUser(oldUser);
            } else if (!user.getProvider().equalsIgnoreCase(registrationeId)) {
                System.out.println("????????User với email: " + email + " đã tồn tại");
                return null;
            }
        }
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>User email: " + email);
        return new DefaultOAuth2User(Collections.singleton(new SimpleGrantedAuthority("ROLE_" + userRole.getName())),
                oAuth2User.getAttributes(), "email");

    }
}
