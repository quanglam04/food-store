package com.example.food_store.service.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

import jakarta.servlet.http.HttpServletRequest;

@ControllerAdvice
public class GlobalExceptionHandler {
    
    @ExceptionHandler(NoHandlerFoundException.class)
    public String handleNotFound(HttpServletRequest request, Exception ex) {
        return "not-match"; 
    }
}