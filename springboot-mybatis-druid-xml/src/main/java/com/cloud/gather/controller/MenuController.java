package com.cloud.gather.controller;

import com.cloud.gather.service.MenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Description： 测试db2
 * @Author: hmm
 * @Date: 2021-05-21
 */
@RequestMapping("gather/test")
@RestController
public class MenuController {

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private MenuService menuService;


    @GetMapping("/getTime")
    public String getTime(@RequestParam int id) {
        log.debug("请求参数：id={}", id);
        String result = menuService.test();
        return result;
    }

}
