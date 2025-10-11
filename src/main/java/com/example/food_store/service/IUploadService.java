package com.example.food_store.service;

import org.springframework.web.multipart.MultipartFile;

public interface IUploadService {
    String handleSaveUploadFile(MultipartFile file, String targetFolder);
}
