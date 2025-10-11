package com.example.food_store.service;

import java.io.UnsupportedEncodingException;

import jakarta.servlet.http.HttpServletRequest;

public interface IVNPAYService {
    String generateVNPayURL(double amountDouble, String paymentRef, String ip) throws UnsupportedEncodingException;
    String hmacSHA512(final String key, final String data);
    String getIpAddress(HttpServletRequest request);
}
