package com.cn.service.impl;

import com.cn.dao.SmProductCategoryMapper;
import com.cn.dao.SmProductMapper;
import com.cn.model.SmProduct;
import com.cn.model.SmProductCategory;
import com.cn.model.SmProductExample;
import com.cn.service.SmProductService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SmProductServiceImpl implements SmProductService {
    @Autowired
    private SmProductMapper smProductMapper;  //调用mapper层的方法与属性

    @Autowired
    private SmProductCategoryMapper smProductCategoryMapper;

    @Override
    public int save(SmProduct smProduct){
        //1.小类
        int smallId = smProduct.getSpcChildId();
        //2.根据小类获取小类信息
        SmProductCategory smProduct1 = smProductCategoryMapper.selectByPrimaryKey(smallId);
        //3.获取其小类的父类
        Integer spcParentId = smProduct1.getSpcParentId();
        //4.父类ID绑定到添加商品
        smProduct.setSpId(spcParentId);

        return smProductMapper.insertSelective(smProduct);
    }

    public List<SmProduct> list(int page,int pageSize){

        PageHelper.startPage(page,pageSize);
        List<SmProduct>smProducts = smProductMapper.selectByExample(null);
        return smProducts;

    }

    @Override
    public SmProduct selectOne(Integer spId) {
        return smProductMapper.selectByPrimaryKey(spId);
    }

    @Override
    public int delect(int spId) {
        return smProductMapper.deleteByPrimaryKey(spId);
    }

    @Override
    public int update(SmProduct smProduct) {
        return smProductMapper.updateByPrimaryKeySelective(smProduct);
    }

    @Override
    public int insert(SmProduct smProduct) {
        return smProductMapper.insertSelective(smProduct);
    }

    @Override
    public SmProduct selectbyId(int spId) {
        return  smProductMapper.selectByPrimaryKey(spId);
    }

    @Override
    public List<SmProduct> selectSuccess(int spcId, String spName, int page, int pageSize) {
        PageHelper.startPage(page,pageSize);
        SmProductExample smProductExample = new SmProductExample();
        SmProductExample.Criteria criteria = smProductExample.createCriteria();

        if(spcId == 0 && spName != null){
            criteria.andSpNameEqualTo(spName);
        }else if(spcId != 0  ||  spName == null){
            criteria.andSpcChildIdEqualTo(spcId);
        }
        return smProductMapper.selectByExample(smProductExample);
    }

    @Override
    public List<SmProduct> findAll() {
        return smProductMapper.selectByExample(null);
    }

    @Override
    public List<SmProduct> productlist(int spcChildId, Integer page, Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        SmProductExample smProductExample = new SmProductExample();
        SmProductExample.Criteria criteria = smProductExample.createCriteria();
        criteria.andSpcChildIdEqualTo(spcChildId);
        return smProductMapper.selectByExample(smProductExample);
    }
}

