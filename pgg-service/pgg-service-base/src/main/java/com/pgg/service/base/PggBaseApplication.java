package com.pgg.service.base;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

@EnableDiscoveryClient
@EnableFeignClients(basePackages = "com.pgg")
@ComponentScan(basePackages = "com.pgg")
@MapperScan("com.pgg.*.*.mapper")
@SpringBootApplication(scanBasePackages = {"com.pgg"})
public class PggBaseApplication {

    public static void main(String[] args) {
        SpringApplication.run(PggBaseApplication.class,args);
    }

}
