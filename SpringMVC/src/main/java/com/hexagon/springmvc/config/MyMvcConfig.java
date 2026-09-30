package com.hexagon.springmvc.config;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"com.hexagon.springmvc.controller"})
public class MyMvcConfig implements WebMvcConfigurer{
	
	@Override
	public void addCorsMappings(CorsRegistry registry) {
	
		registry
			.addMapping("/**")
			.allowedOrigins(
					"http://localhost:5173",
					"http://localhost:3000"
			)
			.allowedMethods(
					"GET","POST","PUT","DELETE","PATCH","OPTIONS"
			)
			.allowedHeaders("*")
			.allowCredentials(true);
	}	
}
