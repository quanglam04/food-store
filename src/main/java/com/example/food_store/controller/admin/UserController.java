package com.example.food_store.controller.admin;

import java.util.List;

import java.util.Optional;

import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.food_store.domain.Token;
import com.example.food_store.domain.User;
import com.example.food_store.domain.dto.ResetPasswordDTO;
import com.example.food_store.service.TokenService;
import com.example.food_store.service.UploadService;
import com.example.food_store.service.UserService;
import com.example.food_store.service.sendEmail.SendEmail;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;
    private final SendEmail sendEmail;
    private final TokenService tokenService;

    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder,
            SendEmail sendEmail, TokenService tokenService) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
        this.sendEmail = sendEmail;
        this.tokenService = tokenService;

    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model,
            @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                // convert from String to int
                page = Integer.parseInt(pageOptional.get());
            } else {
                // page = 1
            }
            Pageable pageable = PageRequest.of(page - 1, 4);
            Page<User> usersPage = this.userService.getAllUsers(pageable);
            List<User> users = usersPage.getContent();
            model.addAttribute("listUser", users);
    
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", usersPage.getTotalPages());
            return "admin/user/show";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Không tìm thấy trang .");
            return "not-match";
        }

    }

    @RequestMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUser(Model model, @ModelAttribute("newUser") @Valid User trinhlam,
            BindingResult newBindingResult,
            @RequestParam("avatarFile") MultipartFile file) {

        List<FieldError> errors = newBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (newBindingResult.hasErrors() || this.userService.checkEmailExist(trinhlam.getEmail())) {

            if (this.userService.checkEmailExist(trinhlam.getEmail()))
                model.addAttribute("errorEmail", "Email đã tồn tại.");
            return "admin/user/create";
        }

        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(trinhlam.getPassword());
        trinhlam.setAvatar(avatar);
        trinhlam.setPassword(hashPassword);
        trinhlam.setRole(this.userService.getRoleByName(trinhlam.getRole().getName()));

        this.userService.handleSaveUser(trinhlam);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("id", id);
        model.addAttribute("user", user);

        return "admin/user/detail";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("id", id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User trinhlam) {
        User currentUser = this.userService.getUserById(trinhlam.getId());
        if (currentUser != null) {
            currentUser.setAddress(trinhlam.getAddress());
            currentUser.setFullName(trinhlam.getFullName());
            currentUser.setPhone(trinhlam.getPhone());

            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newUser", new User());

        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User trinhlam) {
        this.userService.deleteUserById(trinhlam.getId());

        return "redirect:/admin/user";
    }

    @GetMapping("/reset-password")
    public String getResetPasswordPage(@RequestParam("token") String token, Model model) {
        String email = tokenService.getEmailByToken(token);
        User user = this.userService.getUserByEmail(email);
        Long id = user.getId();
        ResetPasswordDTO resetPasswordDTO = new ResetPasswordDTO();
        resetPasswordDTO.setUserID(id);
        model.addAttribute("ResetPasswordDTO", resetPasswordDTO);
        return "client/homepage/resetPassword";
    }

    @PostMapping("/send-request-to-mail")
    public String sendRequestToMail(@RequestParam("email") String email) {
        String tokenEmail = UUID.randomUUID().toString();
        Token token = new Token();
        token.setEmail(email);
        token.setToken(tokenEmail);
        tokenService.saveToken(token);
        String resetLink = "http://localhost:8080/reset-password?token=" + tokenEmail;
        sendEmail.sendEmail(email, "Xác nhận khôi phục mật khẩu", "Nhấn vào đây để lấy lại mật khẩu: " + resetLink);
        return "redirect:/login";
    }

    @PostMapping("/process-reset-password")
    public String getProcessResetPassword(@ModelAttribute("ResetPasswordDTO") @Valid ResetPasswordDTO ResetPasswordDTO,
            BindingResult bindingResult,
            Model model) {
        if (bindingResult.hasErrors()) {

            String error = bindingResult.getFieldError().getDefaultMessage();
            model.addAttribute("errorNewpassword", error);
            return "client/homepage/resetPassword";
        }
        String currentPassword = ResetPasswordDTO.getNewPassword();
        String confirmPassword = ResetPasswordDTO.getConfirmPassword();
        User user = this.userService.getUserById(ResetPasswordDTO.getUserID());

        if (!currentPassword.equals(confirmPassword)) {
            model.addAttribute("errorConfirmPassword", "Mật khẩu không khớp");
            return "client/homepage/resetPassword";
        } else {
            user.setPassword(passwordEncoder.encode(currentPassword));
            this.userService.handleSaveUser(user);
            return "client/homepage/resetPasswordSuccess";
        }

    }

}
