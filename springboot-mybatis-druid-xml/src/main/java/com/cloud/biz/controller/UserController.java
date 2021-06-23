package com.cloud.biz.controller;

import com.cloud.biz.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Description： 测试db1
 * @Author: hmm
 * @Date: 2021-05-21
 */
@RequestMapping("biz/test")
@RestController
public class UserController {

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserService userService;


    @GetMapping("/getTime")
    public String getTime(@RequestParam int id) {
        log.debug("请求参数：id={}", id);
        String result = userService.test();
        return result;
    }

}
