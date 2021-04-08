package org.example;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @Value("${suffix.num:1}")
    private Integer suffixNum;

    @RequestMapping("/hello")
    public String hello(){
        return "server " + suffixNum;
    }

}
