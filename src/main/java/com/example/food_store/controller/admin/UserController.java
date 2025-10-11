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

import com.example.food_store.constant.AppConstant;
import com.example.food_store.controller.BaseController;
import com.example.food_store.domain.Token;
import com.example.food_store.domain.User;
import com.example.food_store.domain.dto.ResetPasswordDTO;
import com.example.food_store.messaging.message.EmailRequest;
import com.example.food_store.messaging.producer.EmailProducer;
import com.example.food_store.service.impl.TokenService;
import com.example.food_store.service.impl.UploadService;
import com.example.food_store.service.impl.UserService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequiredArgsConstructor
public class UserController extends BaseController {
    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;
    private final TokenService tokenService;
    private final EmailProducer emailProducer;

    @GetMapping("/admin/user")
    public String getUserPage(Model model, @RequestParam("page") Optional<String> pageOptional) {
        log.info("Request to /admin/user");
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

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        log.info("Request to /admin/user/create");
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        log.info("Request to /admin/user/{id}");
        User user = this.userService.getUserById(id);
        model.addAttribute("id", id);
        model.addAttribute("user", user);

        return "admin/user/detail";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        log.info("Request to /admin/user/update/{id}");
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("id", id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping(value = "/admin/user/create")
    public String createUser(Model model, @ModelAttribute("newUser") @Valid User trinhlam, BindingResult newBindingResult, @RequestParam("avatarFile") MultipartFile file) {
        log.info("Request to /admin/user/create");
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

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        log.info("Request to /admin/user/delete/{id}");
        model.addAttribute("id", id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @GetMapping("/reset-password")
    public String getResetPasswordPage(@RequestParam("token") String token, Model model) {
        log.info("Request to /reset-password");
        String email = tokenService.getEmailByToken(token);
        User user = this.userService.getUserByEmail(email);
        Long id = user.getId();
        ResetPasswordDTO resetPasswordDTO = new ResetPasswordDTO();
        resetPasswordDTO.setUserID(id);
        model.addAttribute("ResetPasswordDTO", resetPasswordDTO);
        return "client/homepage/resetPassword";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User trinhlam) {
        log.info("Request to /admin/user/update");
        User currentUser = this.userService.getUserById(trinhlam.getId());
        if (currentUser != null) {
            currentUser.setAddress(trinhlam.getAddress());
            currentUser.setFullName(trinhlam.getFullName());
            currentUser.setPhone(trinhlam.getPhone());
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }


    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User trinhlam) {
        log.info("Request to /admin/user/delete");
        this.userService.deleteUserById(trinhlam.getId());
        return "redirect:/admin/user";
    }

    @PostMapping("/send-request-to-mail")
    public String sendRequestToMail(@RequestParam("email") String email) {
        log.info("Request to /send-request-to-mail");
        String tokenEmail = UUID.randomUUID().toString();
        Token token = new Token();
        token.setEmail(email);
        token.setToken(tokenEmail);
        tokenService.saveToken(token);
        String resetLink = AppConstant.RESET_LINK + tokenEmail;
        EmailRequest emailRequest = new EmailRequest(email,"Xác nhận khôi phục mật khẩu","Nhấn vào đây để lấy lại mật khẩu: " + resetLink);
        emailProducer.sendEmailToQueue(emailRequest);
        return "redirect:/login";
    }

    @PostMapping("/process-reset-password")
    public String getProcessResetPassword(@ModelAttribute("ResetPasswordDTO") @Valid ResetPasswordDTO ResetPasswordDTO, BindingResult bindingResult, Model model) {
        log.info("Request to /process-reset-password");
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
