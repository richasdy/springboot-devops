package com.richasdy.springboot.devops;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
	
	@RequestMapping("/")
    public String index() {
        return "hello devops with spring boot, travis and heroku";
    }
	
	@RequestMapping("/hello")
    public String forEdit() {
        return "this request mapping is for experiments docker trials";
    }

}
