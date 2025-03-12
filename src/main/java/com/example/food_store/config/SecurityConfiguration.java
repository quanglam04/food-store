package com.example.food_store.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.session.security.web.authentication.SpringSessionRememberMeServices;

import com.example.food_store.service.CustomUserDetailsService;
import com.example.food_store.service.UserService;
import com.example.food_store.service.userInfo.CustomOAuth2UserService;

import jakarta.servlet.DispatcherType;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfiguration {

        @Autowired
        private CustomOAuth2AuthenticationFailureHandler customFailureHandler;

        @Bean
        public PasswordEncoder passwordEncoder() {
                return new BCryptPasswordEncoder();
        }

        @Bean
        public UserDetailsService userDetailsService(UserService userService) {
                return new CustomUserDetailsService(userService);
        }

        @Bean
        public DaoAuthenticationProvider authProvider(
                        PasswordEncoder passwordEncoder,
                        UserDetailsService userDetailsService) {

                DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
                authProvider.setUserDetailsService(userDetailsService);
                authProvider.setPasswordEncoder(passwordEncoder);
                authProvider.setHideUserNotFoundExceptions(false);

                return authProvider;
        }

        @Bean
        public AuthenticationSuccessHandler customSuccessHandler() {
                return new CustomSuccessHandler();
        }

        @Bean
        public SpringSessionRememberMeServices rememberMeServices() {
                SpringSessionRememberMeServices rememberMeServices = new SpringSessionRememberMeServices();
                // optionally customize
                rememberMeServices.setAlwaysRemember(true);
                return rememberMeServices;
        }

        @Bean
        SecurityFilterChain filterChain(HttpSecurity http, UserService userService) throws Exception {

                http
                                .csrf(csrf -> csrf
                                                // Cho phép các request tới Gemini API mà không cần CSRF token
                                                .ignoringRequestMatchers("/gemini-proxy/**")
                                                // Các endpoint khác vẫn yêu cầu CSRF protection
                                                .csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse()))
                                .authorizeHttpRequests(authorize -> authorize
                                                .dispatcherTypeMatchers(DispatcherType.FORWARD,
                                                                DispatcherType.INCLUDE)
                                                .permitAll()

                                                .requestMatchers("/product/**", "/", "/password/**", "/login/**",
                                                                "/client/**", "/css/**",
                                                                "/js/**",
                                                                "/register/**",
                                                                "/products/**",
                                                                "/images/**", "/send-request-to-mail",
                                                                "reset-password/**",
                                                                "/process-reset-password/**", "/verify/**",
                                                                "/gemini-proxy", "/test-Gemini")
                                                .permitAll()

                                                .requestMatchers("/admin/**").hasRole("ADMIN")
                                                .anyRequest().authenticated())

                                .oauth2Login(oauth2 -> oauth2.loginPage("/login")
                                                .successHandler(customSuccessHandler())
                                                .failureHandler(customFailureHandler)
                                                .userInfoEndpoint(user -> user
                                                                .userService(new CustomOAuth2UserService(userService)))

                                )

                                .sessionManagement((sessionManagement) -> sessionManagement
                                                .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)
                                                .invalidSessionUrl("/logout?expired")
                                                .maximumSessions(1)
                                                .maxSessionsPreventsLogin(false))

                                .logout(logout -> logout.deleteCookies("JSESSIONID").invalidateHttpSession(true))

                                .rememberMe(r -> r.rememberMeServices(rememberMeServices()))
                                .formLogin(formLogin -> formLogin
                                                .loginPage("/login")
                                                .failureUrl("/login?error")
                                                .successHandler(customSuccessHandler())
                                                .permitAll())
                                .exceptionHandling(ex -> ex.accessDeniedPage("/access-deny"));

                return http.build();
        }

}
