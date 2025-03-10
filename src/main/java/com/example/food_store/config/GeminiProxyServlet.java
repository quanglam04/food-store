package com.example.food_store.config;

import java.io.*;
import java.net.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/gemini-proxy")
public class GeminiProxyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Đọc JSON từ request body của client
        StringBuilder requestBody = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                requestBody.append(line);
            }
        }
        
        String apiUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyAqegyPvRERJaG3SZiBsC46ZXQ0jDYcdTQ";

        // Kết nối đến API
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        // Gửi dữ liệu JSON từ client đến API Gemini
        try (OutputStream os = conn.getOutputStream()) {
            byte[] input = requestBody.toString().getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        // Đọc phản hồi từ Gemini API
        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
        StringBuilder responseStr = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            responseStr.append(line);
        }
        reader.close();

        // Trả kết quả về frontend
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(responseStr.toString());
    }
}
