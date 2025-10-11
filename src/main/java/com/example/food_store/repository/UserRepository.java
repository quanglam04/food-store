package com.example.food_store.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.food_store.domain.User;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    void deleteById(long id);
    long count();
    boolean existsByEmail(String email);
    User save(User people);
    User findByEmail(String email);
    User findById(long id);
    List<User> findAll();

}