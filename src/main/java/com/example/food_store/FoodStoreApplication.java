package com.example.food_store;

import java.util.logging.LogManager;
import java.util.logging.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.example.food_store.domain.Role;
import com.example.food_store.repository.RoleRepository;

import lombok.extern.log4j.Log4j2;

@SpringBootApplication
@Log4j2
public class FoodStoreApplication {
	public static void main(String[] args) {
		SpringApplication.run(FoodStoreApplication.class, args);
	}

	@Bean
	public CommandLineRunner initRoles(RoleRepository roleRepository) {
		return args -> {
			// Check if roles exist
			long count = roleRepository.count();

			// If no roles exist, add default roles
			if (count == 0) {
				Role adminRole = new Role();
				adminRole.setId(1L);
				adminRole.setName("ADMIN");
				adminRole.setDescription("ADMIN full quyền");
				roleRepository.save(adminRole);

				Role userRole = new Role();
				userRole.setId(2L);
				userRole.setName("USER");
				userRole.setDescription("USER hạn chế một số quyền");
				roleRepository.save(userRole);
				System.out.println(">>>>>>>>>>> Tạo bảng Role thành công");
			} else {
				System.out.println("Role đã tồn tại trong database");
			}
		};
	}
}