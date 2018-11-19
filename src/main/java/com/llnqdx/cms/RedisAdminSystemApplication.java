package com.llnqdx.cms;

import com.llnqdx.cms.base.modules.sys.service.SystemService;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.AdviceMode;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * 启动类
 *
 * @author: llnqdx
 * @Date: 2018/10/14 下午5:30
 */
@EnableCaching
@SpringBootApplication
@ServletComponentScan("com.llnqdx.cms")
@ComponentScan(value = "com.llnqdx.cms", lazyInit = true)
@EnableTransactionManagement(mode = AdviceMode.ASPECTJ)
public class RedisAdminSystemApplication {
    public static void main(String[] args) {
        new SpringApplicationBuilder(RedisAdminSystemApplication.class).web(true).run(args);
        SystemService.printKeyLoadMessage();
    }
}
