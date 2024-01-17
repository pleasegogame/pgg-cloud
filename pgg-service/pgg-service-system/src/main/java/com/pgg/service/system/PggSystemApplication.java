package com.pgg.service.system;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan(basePackages = "com.pgg")
@MapperScan("com.pgg.*.*.mapper")
@SpringBootApplication(scanBasePackages = {"com.pgg"})
public class PggSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(PggSystemApplication.class,args);
    }

}
