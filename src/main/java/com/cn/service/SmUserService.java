package com.cn.service;


import com.cn.model.SmUser;

import java.util.List;

public interface SmUserService {
    /**
     * ��ҳ��ѯ��Ʒ��Ϣ
     * @param page ָ������ҳ
     * @param pageSize ָ��ÿҳ��ʾ����������
     * @rturn
     */
    List<SmUser> list(int page, int pageSize);
    Integer save(SmUser smUser);
    SmUser selectOne(int smUserId);
    int delete(int suUserId);
    //�û���¼
    SmUser login(String userName, String passWord);

    //����Ա��¼
    SmUser selectByStauts(String username, String password);

    List<SmUser> selectSuccess(String suUserName, Integer page, Integer paseSize);

    int selectByfind(SmUser smUser);

    int update(SmUser smUser);
}
