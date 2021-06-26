package com.cn.service;


import com.cn.model.SmOrder;

import java.util.List;

public interface SmOrderService {
    int insertTest(SmOrder sbOrder);
    List<SmOrder> selectSuccess(int soId, String soUserName, int page, int pageSize);
    int updateTest(SmOrder smOrder);
    int deleteTest(int soid);
    List<SmOrder> pageTest(int page, int pageSize);

    SmOrder selectByOrder(Integer soId);

    List<SmOrder> selectByName(String suUserName,int page,int pageSize);

    SmOrder selectName(String spName,String UserName);

}
