package com.cn.service.impl;

import com.cn.dao.SmOrderMapper;
import com.cn.model.SmOrder;
import com.cn.model.SmOrderExample;
import com.cn.service.SmOrderService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class SmOrderServiceImpl implements SmOrderService {

    @Autowired
    SmOrderMapper smOrderMapper;

    /**
     * 添加
     */
    public int insertTest(SmOrder smOrder){
        return smOrderMapper.insertSelective(smOrder);
    }

    /**
     * 查询
     */
    public List<SmOrder> selectSuccess(int soId, String soUserName, int page, int pageSize){
        PageHelper.startPage(page,pageSize);
        SmOrderExample smOrderExample = new SmOrderExample();
        SmOrderExample.Criteria criteria = smOrderExample.createCriteria();
        if(soId == 0 && soUserName != null){
            criteria.andSoUserNameEqualTo(soUserName);
        }else if(soId != 0 || soUserName == null){
            criteria.andSoIdEqualTo(soId);
        }else {
            criteria.andSoIdEqualTo(soId).andSoUserNameEqualTo(soUserName);
        }
        return smOrderMapper.selectByExample(smOrderExample);
    }

    /**
     * 修改
     */
    public int updateTest(SmOrder smOrder){
        return smOrderMapper.updateByPrimaryKeySelective(smOrder);
    }

    /**
     * 删除
     */
    public int deleteTest(int soid){
        return smOrderMapper.deleteByPrimaryKey(soid);
    }

    /**
     * 分页查询
     */
    public List<SmOrder> pageTest(int page, int pageSize){
        PageHelper.startPage(page,pageSize);
        return smOrderMapper.selectByExample(null);
    }

    @Override
    public SmOrder selectByOrder(Integer soId) {
        return smOrderMapper.selectByPrimaryKey(soId);
    }

    @Override
    public List<SmOrder> selectByName(String suUserName,int page,int pageSize) {
        PageHelper.startPage(page,pageSize);
        SmOrderExample smOrderExample = new SmOrderExample();
        SmOrderExample.Criteria criteria = smOrderExample.createCriteria();
        criteria.andSoUserNameEqualTo(suUserName);
        return smOrderMapper.selectByExample(smOrderExample);
    }

    @Override
    public SmOrder selectName(String spName,String UserName) {
        return smOrderMapper.selectByName(spName,UserName);
    }

}
