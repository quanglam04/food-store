package com.example.food_store.service.impl;

import java.io.File;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.food_store.constant.AppConstant;
import com.example.food_store.service.IUploadService;

import jakarta.servlet.ServletContext;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UploadService implements IUploadService {
    private final ServletContext servletContext;

    String finalName = "";

    @Override
    public String handleSaveUploadFile(MultipartFile file, String targetFolder) {

        if (file.isEmpty())
            return "";
        try {
            byte[] bytes = file.getBytes();
            String rootPath = this.servletContext.getRealPath(AppConstant.LOCAL_PATH);
            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists())
                dir.mkdirs();

            // Create the file on server
            finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);

            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
        return finalName;
    }
}
