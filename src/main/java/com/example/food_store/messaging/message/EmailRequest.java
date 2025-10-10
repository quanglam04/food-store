package com.example.food_store.messaging.message;

import java.io.Serializable;

import lombok.Data;

@Data
public class EmailRequest implements Serializable {

    private String toEmail;
    private String subject;
    private String body;

    public EmailRequest() {}

    public EmailRequest(String toEmail, String subject, String body) {
        this.toEmail = toEmail;
        this.subject = subject;
        this.body = body;
    }

    @Override
    public String toString() {
        return "EmailRequest{to='" + toEmail + "', subject='" + subject + "'}";
    }
}