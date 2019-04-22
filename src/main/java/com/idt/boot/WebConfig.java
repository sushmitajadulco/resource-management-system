package com.idt.boot;

import com.idt.boot.entity.Allocation;
import com.idt.boot.mixin.AllocationMixin;
import org.springframework.boot.autoconfigure.jackson.Jackson2ObjectMapperBuilderCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Bean
    public Jackson2ObjectMapperBuilderCustomizer Jackson2ObjectMapperBuilderCustomizer() {
        return builder -> builder
                .mixIn(Allocation.class, AllocationMixin.class)
                .indentOutput(true);
    }

}
