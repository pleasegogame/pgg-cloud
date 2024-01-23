package com.pgg.service.system;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

@EnableDiscoveryClient
@ComponentScan(basePackages = "com.pgg")
@MapperScan(basePackages  = {"com.pgg.**.mapper.**"})
@EnableCaching
@SpringBootApplication
public class PggSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(PggSystemApplication.class,args);
    }

}
