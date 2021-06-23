package com.cloud.biz.service.impl;

import com.alibaba.fastjson.JSON;
import com.cloud.biz.dao.UserDAO;
import com.cloud.biz.entity.UserDO;
import com.cloud.biz.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    UserDAO userDAO;

    @Override
    public String test() {
        List<UserDO> userList= userDAO.listUser();
        return JSON.toJSONString(userList);
    }
}
