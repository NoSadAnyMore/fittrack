package com.nofantasy;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

/**
 * 启动程序
 * 
 * @author nofantasy
 */
@MapperScan("com.nofantasy.project.**.mapper")
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class Application {
    public static void main(String[] args) {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(Application.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  后台启动成功   ლ(´ڡ`ლ)ﾞ ");
    }


    /**
     * 远程调用  HTTP 请求工具
     */
    @Bean
    public RestTemplate RestTemplate() {
        return new RestTemplate();

    }
}