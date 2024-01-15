package com.pgg.service.system;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@MapperScan("com.pgg.*.*.mapper")
//@SpringBootApplication
@SpringBootApplication(exclude= {DataSourceAutoConfiguration.class})
public class PggSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(PggSystemApplication.class,args);
    }

}
