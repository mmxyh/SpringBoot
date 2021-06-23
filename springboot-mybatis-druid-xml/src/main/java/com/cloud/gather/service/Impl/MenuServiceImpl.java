package com.cloud.gather.service.Impl;

import com.alibaba.fastjson.JSON;
import com.cloud.gather.dao.MenuDAO;
import com.cloud.gather.entity.MenuDO;
import com.cloud.gather.service.MenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {

    @Resource
    MenuDAO menuDAO;

    @Override
    public String test() {
        List<MenuDO> menuList = menuDAO.listMenu();
        return JSON.toJSONString(menuList);
    }
}
