package com.cn.service;

import com.cn.model.SmProductCategory;

import java.util.List;
import java.util.Map;

public interface SmProductCategoryService {
    Map<String, List<SmProductCategory>> findBigAndSmallCategory();
    SmProductCategory findByBigAndSmallCategory(int spcId);
    List<SmProductCategory> findBig();
    List<SmProductCategory> findSmall();
    int update(SmProductCategory smProductCategory);
    int insert(SmProductCategory smProductCategory);
    int deletefindByBig(int spcId);

    List<SmProductCategory> selectAndsmall(Integer spcId);

    SmProductCategory findById(Integer spcChildId);

}
