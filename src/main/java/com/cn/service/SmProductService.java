package com.cn.service;


import com.cn.model.SmProduct;

import java.util.List;

public interface SmProductService {
    int save(SmProduct smProduct);
    //分页查询
    List<SmProduct> list(int page, int pageSize);
    SmProduct selectOne(Integer spId);
    int update(SmProduct smProduct);
    int delect(int spId);
    int insert(SmProduct smProduct);
    SmProduct selectbyId(int spId);
    List<SmProduct> selectSuccess(int spcId, String spName, int page, int pageSize);

    List<SmProduct> findAll();

    List<SmProduct> productlist(int spcChildId, Integer page, Integer pageSize);
}
