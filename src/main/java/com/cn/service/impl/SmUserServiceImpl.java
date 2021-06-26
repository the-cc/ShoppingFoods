package com.cn.service.impl;

import com.cn.dao.SmUserMapper;
import com.cn.model.SmUser;
import com.cn.model.SmUserExample;
import com.cn.service.SmUserService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SmUserServiceImpl implements SmUserService {

    @Autowired
    SmUserMapper smUserMapper;

    @Override
    public SmUser selectByStauts(String username, String password) {
        return smUserMapper.selectByStauts(username,password);
    }

    @Override
    public List<SmUser> selectSuccess(String suUserName, Integer page, Integer paseSize) {
        PageHelper.startPage(page,paseSize);
        SmUserExample smOrderExample = new SmUserExample();
        SmUserExample.Criteria criteria = smOrderExample.createCriteria();
        criteria.andSuUserNameEqualTo(suUserName);
        return smUserMapper.selectByExample(smOrderExample);
    }


    @Override
    public int delete(int suUserId){
        return  smUserMapper.deleteByPrimaryKey(suUserId);

    }

    @Override
    public int selectByfind(SmUser smUser) {
        List<SmUser> smUsers = smUserMapper.selectByExample(null);
        for (SmUser s:smUsers){
            if(s.getSuUserName().equals(smUser.getSuUserName())){
                return 1;
            }else if(s.getSuEmail().equals(smUser.getSuEmail())){
                return 2;
            }else if(s.getSuMobile().equals(smUser.getSuMobile())){
                return 3;
            }
        }
        return 0;
    }

    @Override
    public int update(SmUser smUser) {
        return smUserMapper.updateByPrimaryKeySelective(smUser);
    }

    @Override
    public List<SmUser> list(int page, int pageSize) {
        PageHelper.startPage(page,pageSize);
        List<SmUser> ebUsers = smUserMapper.selectByExample(null);
        return ebUsers;
    }

    @Override
    public Integer save(SmUser ebUser) {
        return smUserMapper.insert(ebUser);
    }

    @Override
    public SmUser selectOne(int euUserId) {
        return  smUserMapper.selectOne(euUserId);
    }

    //前台用户登录功能
    @Override
    public SmUser login(String userName, String passWord) {
        SmUserExample example = new SmUserExample();
        //拼接查询条件
        SmUserExample.Criteria criteria = example.createCriteria();
        criteria.andSuUserNameEqualTo(userName);
        criteria.andSuPasswordEqualTo(passWord);//相当于在数据库中select * from user where username=? and password=?
        List<SmUser>list = smUserMapper.selectByExample(example);
        if(list != null && list.size() > 0){
            return list.get(0);
        }
        return null;
    }


}
