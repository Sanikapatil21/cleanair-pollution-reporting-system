package com.cleanair.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.nio.file.Paths;

@Configuration
public class WebConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Absolute path of your uploads directory
        String uploadPath = Paths.get(System.getProperty("user.dir"), "uploads")
                                 .toAbsolutePath()
                                 .toUri()
                                 .toString();

        // Make sure to prefix with "file:" for filesystem resources
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations("file:" + uploadPath);
    }
}
