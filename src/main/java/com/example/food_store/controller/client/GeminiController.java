package com.example.food_store.controller.client;

import org.springframework.web.bind.annotation.*;
import org.springframework.http.*;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;

@RestController
@RequestMapping("/gemini-proxy")
public class GeminiController {
    
    @PostMapping
    public ResponseEntity<String> proxyToGemini(@RequestBody String requestBody) throws IOException {
        String apiUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyAqegyPvRERJaG3SZiBsC46ZXQ0jDYcdTQ";

        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        try (OutputStream os = conn.getOutputStream()) {
            os.write(requestBody.getBytes(StandardCharsets.UTF_8));
        }

        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
        StringBuilder responseStr = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            responseStr.append(line);
        }
        reader.close();

        return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(responseStr.toString());
    }
}
