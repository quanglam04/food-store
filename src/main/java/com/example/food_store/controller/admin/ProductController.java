package com.example.food_store.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.food_store.controller.BaseController;
import com.example.food_store.domain.Product;
import com.example.food_store.service.impl.ProductService;
import com.example.food_store.service.impl.UploadService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequiredArgsConstructor
public class ProductController extends BaseController {
    private final UploadService uploadService;
    private final ProductService productService;

    @GetMapping("/admin/product")
    public String getProduct(Model model, @RequestParam("page") Optional<String> pageOptional) {
        log.info("Request to /admin/product");
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                // convert from String to int
                page = Integer.parseInt(pageOptional.get());
            } else {
                // page = 1
            }
            Pageable pageable = PageRequest.of(page - 1, 5);
            Page<Product> prs = this.productService.fetchProducts(pageable);
            List<Product> listProducts = prs.getContent();
            model.addAttribute("products", listProducts);
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", prs.getTotalPages());
            return "admin/product/show";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Không tìm thấy trang .");
            return "not-match";
        }
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        log.info("Request to /admin/product/create");
        model.addAttribute("newPrd", new Product());
        return "admin/product/create";
    }
    
    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        log.info("Request to /admin/product/delete/{id}");
        model.addAttribute("id", id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/delete";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        log.info("Request to /admin/product/{id}");
        Product pr = this.productService.fetchProductById(id).get();
        model.addAttribute("product", pr);
        model.addAttribute("id", id);
        return "admin/product/detail";

    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        log.info("Request to /admin/product/update/{id}");
        Optional<Product> currentProduct = this.productService.fetchProductById(id);
        model.addAttribute("newProduct", currentProduct.get());
        return "admin/product/update";
    }
    
    @PostMapping("/admin/product/create")
    public String createProduct(@ModelAttribute("newPrd") @Valid Product prd, BindingResult newBindingResult, @RequestParam("productFile") MultipartFile file) {
        log.info("Request to /admin/product/create");
        if (newBindingResult.hasErrors()) {
            return "admin/product/create";
        }
        String img = this.uploadService.handleSaveUploadFile(file, "product");
        prd.setImage(img);
        this.productService.createProduct(prd);
        return "redirect:/admin/product";

    }


    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("newProduct") Product prd) {
        log.info("Request to /admin/product/delete");
        this.productService.deleteProductById(prd.getId());
        return "redirect:/admin/product";
    }

    @PostMapping("/admin/product/update")
    public String handleUpdateProduct(@ModelAttribute("newProduct") @Valid Product prd, BindingResult newProducBindingResult, @RequestParam("productFile") MultipartFile file) {
        log.info("Request to /admin/product/update");
        if (newProducBindingResult.hasErrors()) {
            return "admin/product/update";
        }
        Product currentProduct = this.productService.fetchProductById(prd.getId()).get();
        if (currentProduct != null) {
            if (!file.isEmpty()) {
                String img = this.uploadService.handleSaveUploadFile(file, "product");
                currentProduct.setImage(img);
            }
            currentProduct.setDetailDesc(prd.getDetailDesc());
            currentProduct.setName(prd.getName());
            currentProduct.setPrice(prd.getPrice());
            currentProduct.setQuantity(prd.getQuantity());
            currentProduct.setType(prd.getType());
            currentProduct.setSource(prd.getSource());
            currentProduct.setUnit(prd.getUnit());
            currentProduct.setCustomerTarget(prd.getCustomerTarget());
            currentProduct.setShortDesc(prd.getShortDesc());
            currentProduct.setTarget(prd.getTarget());
            this.productService.createProduct(currentProduct);
        }
        return "redirect:/admin/product";

    }

}
