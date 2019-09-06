package com.buba;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.buba.mapper")
@SpringBootApplication
public class JiuhuiApplication {

    public static void main(String[] args) {
        SpringApplication.run(JiuhuiApplication.class, args);
    }

}
