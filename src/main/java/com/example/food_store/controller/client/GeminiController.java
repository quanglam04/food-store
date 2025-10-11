package com.example.food_store.controller.client;

import org.springframework.web.bind.annotation.*;

import com.example.food_store.controller.BaseController;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;

@RestController
@RequestMapping("/gemini-proxy")
public class GeminiController extends BaseController {
    @Value("${api-gemini}")
    private static String apiUrl; 
    
    @PostMapping
    public ResponseEntity<String> proxyToGemini(@RequestBody String requestBody) throws IOException {
        log.info("Request to /gemini-proxy");
        String line;
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);
        try (OutputStream os = conn.getOutputStream()) {
            os.write(requestBody.toString().getBytes(StandardCharsets.UTF_8));
        }
        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
        StringBuilder responseStr = new StringBuilder();
        while ((line = reader.readLine()) != null) {
            responseStr.append(line);
        }
        reader.close();
        return ResponseEntity.ok()
        .contentType(new MediaType("text", "plain", StandardCharsets.UTF_8))
        .body(extractTextFromResponse(responseStr.toString()));
    }

    private String extractTextFromResponse(String jsonResponse) {
    try {
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode rootNode = objectMapper.readTree(jsonResponse);
        // Trích xuất phần "text" từ JSON
        return rootNode.path("candidates")
                       .path(0)
                       .path("content")
                       .path("parts")
                       .path(0)
                       .path("text")
                       .asText();
    } catch (Exception e) {
        return "Lỗi xử lý JSON: " + e.getMessage();
    }
}
}
