package com.example.food_store.controller.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import java.util.List;

import com.example.food_store.controller.BaseController;
import com.example.food_store.domain.Order;
import com.example.food_store.domain.Product;
import com.example.food_store.domain.User;
import com.example.food_store.domain.dto.ChangePasswordDTO;
import com.example.food_store.domain.dto.RegisterDTO;
import com.example.food_store.messaging.message.EmailRequest;
import com.example.food_store.messaging.producer.EmailProducer;
import com.example.food_store.service.OrderService;
import com.example.food_store.service.ProductService;
import com.example.food_store.service.SendEmailService;
import com.example.food_store.service.UploadService;
import com.example.food_store.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomePageController extends BaseController {

    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final OrderService orderService;
    private final UploadService uploadService;
    private final SendEmailService sendEmail;
    private final EmailProducer emailProducer;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder,
            OrderService orderService, UploadService uploadService, SendEmailService sendEmail, EmailProducer emailProducer) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.orderService = orderService;
        this.uploadService = uploadService;
        this.sendEmail = sendEmail;
        this.emailProducer = emailProducer;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        log.info("Request to /");
        List<Product> products = this.productService.fetchAllProductsToHomePage();
        List<Product> productsTypeRauCu = this.productService.fetchProductByType("rau");
        productsTypeRauCu.addAll(this.productService.fetchProductByType("cu"));

        List<Product> productsTypeTraiCay = this.productService.fetchProductByType("trai-cay");
        List<Product> productsTypeThit = this.productService.fetchProductByType("thuc-pham-giau-protein");
        List<Product> productsTypeThucUong = this.productService.fetchProductByType("thuc-uong");
        List<Product> productsTypeTinhBot = this.productService.fetchProductByType("thuc-pham-chua-tinh-bot");
        model.addAttribute("nameProducts", productService.getAllNames());
        model.addAttribute("products", products);
        model.addAttribute("productsTypeThucUongs", productsTypeThucUong);
        model.addAttribute("productsTypeRauCus", productsTypeRauCu);
        model.addAttribute("productsTypeTraiCays", productsTypeTraiCay);
        model.addAttribute("productsTypeThits", productsTypeThit);
        model.addAttribute("productsTypeTinhBots", productsTypeTinhBot);

        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        log.info("Request to /register");
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

        @GetMapping("/login")
    public String getLoginPage() {
        log.info("Request to /login");
        return "client/auth/login";
    }

    @GetMapping("/password")
    public String getForgotPasswordPage() {
        log.info("Request to /password");
        return "client/auth/password";
    }

    @GetMapping("/access-deny")
    public String getDenyPage(Model model) {
        log.info("Request to /access-deny");
        return "client/auth/deny";
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        log.info("Request to /order-history");
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);
        List<Order> orders = this.orderService.fetchOrderByUser(currentUser);
        model.addAttribute("orders", orders);
        return "client/cart/order-history";
    }

    @GetMapping("/view-profile")
    public String getProfileView(HttpServletRequest request, Model model) {
        log.info("Request to /view-profile");
        HttpSession session = request.getSession(false);
        Long id = (Long) session.getAttribute("id");
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "client/homepage/viewProfile";
    }

    @GetMapping("/update-profile/{id}")
    public String getProfileUpdate(HttpSession session, Model model, @PathVariable long id) {
        log.info("Request to /update-profile/{id}");
        Long sessionUserId = (Long) session.getAttribute("id");
        if (sessionUserId == null || sessionUserId != id) {
        return "not-match"; 
     }
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("id", id);
        model.addAttribute("newUser", currentUser);
        return "client/homepage/updateProfile";
    }

    @GetMapping("/change-password")
    public String getChangePasswordPage(HttpServletRequest request, Model model) {
        log.info("Request to /change-password");
        HttpSession session = request.getSession();
        Long id = (long) session.getAttribute("id");
        User user = this.userService.getUserById(id);

        ChangePasswordDTO changePasswordDTO = 
                                            ChangePasswordDTO.builder().
                                            userId(user.getId()).
                                            build();

        model.addAttribute("changePasswordDTO", changePasswordDTO);
        return "client/homepage/changePassword";
    }

    @GetMapping("success-page")
    public String getSuccessPage() {
        log.info("Request to /success-page");
        return "client/homepage/changePasswordSuccess";
    }

    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("userDTO") @Valid RegisterDTO userDTO,
            BindingResult bindingResult,
            @RequestParam("OTP_check") String OTP,
            Model model) {
        log.info("Request to /register");
        String OTP_real = userDTO.getOTP();
        if (!OTP.equals(OTP_real)) {
            model.addAttribute("errorVerifyEmail", "Mã OTP không chính xác. Vui lòng nhập lại.");
            return "client/auth/verifyEmail";
        }

        User user = this.userService.registerDTOtoUser(userDTO);
        String hashPassword = this.passwordEncoder.encode(userDTO.getPassword());
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("USER"));
        this.userService.handleSaveUser(user);
        return "client/homepage/registerSuccess";
    }

    @PostMapping("/verify")
    public String getVerifyPage(@ModelAttribute("registerUser") @Valid RegisterDTO userDTO, BindingResult bindingResult,
            Model model) {
        log.info("Request to /verify");
        String email = userDTO.getEmail();
        if (bindingResult.hasErrors()) {
            String password = userDTO.getPassword();
            String confirmPassword = userDTO.getConfirmPassword();
            String regexp = "^[a-zA-Z0-9!#$%&*/=?`{|}]+@[a-zA-Z0-9.-]+$";
            String name = userDTO.getFullName();
            if (name.length() < 3)
                model.addAttribute("errorFullname", "Họ tên phải có tối thiểu 3 ký tự");
            if (this.userService.checkEmailExist(email))
                model.addAttribute("errorEmail", "Email đã tồn tại. Vui lòng sử dụng Email khác");
            if (!email.matches(regexp))
                model.addAttribute("errorEmail_2", "Email không hợp lệ");
            if (password.length() < 6)
                model.addAttribute("errorPassword", "Mật khẩu phải có tối thiểu 6 ký tự");
            else if (!confirmPassword.equals(password))
                model.addAttribute("errorConfirmPassword", "Mật khẩu nhập không chính xác");
            return "client/auth/register";
        }

        String OTP = this.sendEmail.getRandom();
        EmailRequest emailRequest = new EmailRequest(email,"Xác nhận đăng ký","Mã xác nhận đăng ký của bạn là: " + OTP);
        emailProducer.sendEmailToQueue(emailRequest);
        userDTO.setOTP(OTP);
        model.addAttribute("userDTO", userDTO);
        return "client/auth/verifyEmail";
    }



    @PostMapping("/update-profile")
    public String postMethodName(Model model, @ModelAttribute("newUser") User trinhlam,
            BindingResult newBindingResult,
            @RequestParam("avatarFile") MultipartFile file,
            HttpServletRequest request) {
        log.info("Request to /update-profile");
        HttpSession session = request.getSession(false);
        User currentUser = this.userService.getUserById(trinhlam.getId());
        if (newBindingResult.hasErrors())
            return "not-match";

        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        currentUser.setAvatar(avatar);
        currentUser.setPhone(trinhlam.getPhone());
        currentUser.setAddress(trinhlam.getAddress());
        this.userService.handleSaveUser(currentUser);
        session.setAttribute("avatar", avatar);
        return "redirect:/view-profile";
    }

    

    @PostMapping("/change-password")
    public String changePassword(@ModelAttribute("changePasswordDTO") @Valid ChangePasswordDTO changePasswordDTO,
            BindingResult bindingResult,
            Model model) {
        log.info("Request to /change-password");
        if (bindingResult.hasErrors()) {
            String error = bindingResult.getFieldError().getDefaultMessage();
            model.addAttribute("errorNewpassword", error);
            return "client/homepage/changePassword";
        }
        Long userId = changePasswordDTO.getUserId();
        String lastPassword = changePasswordDTO.getLastPassword();
        String newPassword = changePasswordDTO.getNewPassword();

        User user = this.userService.getUserById(userId);
        if (passwordEncoder.matches(lastPassword, user.getPassword())) {
            user.setPassword(passwordEncoder.encode(newPassword));
            this.userService.handleSaveUser(user);
            model.addAttribute("message", "Đổi mật khẩu thành công");
            return "redirect:/success-page";
        } else {
            model.addAttribute("error", "Mật khẩu không chính xác");
            return "client/homepage/changePassword";
        }
    }



}
