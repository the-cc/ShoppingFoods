package com.cn.service;


import com.cn.model.SmUser;

import java.util.List;

public interface SmUserService {
    /**
     * 分页查询商品信息
     * @param page 指定多少页
     * @param pageSize 指定每页显示多少条数据
     * @rturn
     */
    List<SmUser> list(int page, int pageSize);
    Integer save(SmUser smUser);
    SmUser selectOne(int smUserId);
    int delete(int suUserId);
    //用户登录
    SmUser login(String userName, String passWord);

    //管理员登录
    SmUser selectByStauts(String username, String password);

    List<SmUser> selectSuccess(String suUserName, Integer page, Integer paseSize);

    int selectByfind(SmUser smUser);

    int update(SmUser smUser);
}
