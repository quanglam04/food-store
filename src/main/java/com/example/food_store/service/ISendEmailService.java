package com.example.food_store.service;

public interface ISendEmailService {
    void sendEmail(String toEmail, String subject, String body);
}
