package com.pgg.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class PggGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(PggGatewayApplication.class, args);
    }
}
