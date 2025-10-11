package com.example.food_store.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.food_store.domain.Role;
import com.example.food_store.domain.User;
import com.example.food_store.domain.dto.RegisterDTO;

public interface IUserService {
    User handleSaveUser(User user);
    Page<User> getAllUsers(Pageable pageable);
    User getUserById(long id);
    void saveUser(User user);
    void deleteUserById(long id);
    Role getRoleByName(String name);
    User registerDTOtoUser(RegisterDTO registerDTO);
    boolean checkEmailExist(String email);
    User getUserByEmail(String email);
    long countUser();
    long countOrder();

}
