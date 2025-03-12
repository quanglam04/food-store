package com.example.food_store;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.example.food_store.domain.Role;
import com.example.food_store.repository.RoleRepository;

@SpringBootApplication
public class FoodStoreApplication {
	public static void main(String[] args) {
		SpringApplication.run(FoodStoreApplication.class, args);
	}

	@Bean
    CommandLineRunner initDatabase(RoleRepository roleRepository) {
        return args -> {
            if (roleRepository.count() == 0) {
                Role adminRole = new Role();
                adminRole.setName("ADMIN");
                adminRole.setDescription("ADMIN thì có mọi quyền hạn trong hệ thống");

                Role userRole = new Role();
                userRole.setName("USER");
                userRole.setDescription("USER có thể thao tác bất cứ thứ gì ngoại trừ ở phía ADMIN");

                roleRepository.save(adminRole);
                roleRepository.save(userRole);

                System.out.println("Imported default roles: ADMIN, USER");
            }
        };
    }
}