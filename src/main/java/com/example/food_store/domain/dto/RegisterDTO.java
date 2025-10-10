package com.example.food_store.domain.dto;

import com.example.food_store.annotation.RegisterChecked;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;
import lombok.Data;

@RegisterChecked
@Data
public class RegisterDTO {
    @Size(min = 3, message = "Fullname phải có tối thiểu 3 ký tự")
    private String fullName;
    @Email(message = "Email không hợp lệ", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    private String email;

    @Size(min = 6, message = "Mật khẩu phải có tối thiểu 6 ký tự")
    private String password;

    private String confirmPassword;
    private String OTP;

}
