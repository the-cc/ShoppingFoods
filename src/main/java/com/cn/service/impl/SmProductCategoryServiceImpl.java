package com.cn.service.impl;

import com.cn.dao.SmProductCategoryMapper;
import com.cn.model.SmProductCategory;
import com.cn.service.SmProductCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SmProductCategoryServiceImpl implements SmProductCategoryService {
    @Autowired
    private SmProductCategoryMapper smProductCategoryMapper;

    @Override
    public Map<String, List<SmProductCategory>> findBigAndSmallCategory() {
        //1.查询所有大类
        List<SmProductCategory> bigs = smProductCategoryMapper.selectBigCategory();
        //System.out.println("所有大类："+bigs);
        //2.查询所有小类
        List<SmProductCategory> smalls = smProductCategoryMapper.selectSmallCategory();
        //System.out.println("所有小类："+smalls);
        //3.封装到map集合
        Map<String,List<SmProductCategory>> categoryMap= new HashMap<>();
        categoryMap.put("bigs",bigs);
        categoryMap.put("smalls",smalls);

        return categoryMap;
    }


    //根据Id查询大类或小类信息
    @Override
    public SmProductCategory findByBigAndSmallCategory(int spcId) {
        List<SmProductCategory> smalls = smProductCategoryMapper.selectSmallCategory();
        for (SmProductCategory small : smalls) {
            if(small.getSpcId().equals(spcId)){
                return small;
            }
        }

        List<SmProductCategory> bigs = smProductCategoryMapper.selectBigCategory();
        for (SmProductCategory big : bigs) {
            if(big.getSpcId().equals(spcId)){
                return big;
            }
        }
        return null;
    }

    //查询所有大类信息
    @Override
    public List<SmProductCategory> findBig() {
        return smProductCategoryMapper.selectBigCategory();
    }

    //查询所有小类信息
    @Override
    public List<SmProductCategory> findSmall() {
        return smProductCategoryMapper.selectSmallCategory();
    }

    @Override
    public int update(SmProductCategory smProductCategory) {
        return smProductCategoryMapper.updateByPrimaryKeySelective(smProductCategory);
    }


    public int insert(SmProductCategory smProductCategory) {
        return smProductCategoryMapper.insertSelective(smProductCategory);
    }

    //根据Id查询判断大类或小类进行删除
    @Override
    public int deletefindByBig(int spcId) {
        List<SmProductCategory> bigs = smProductCategoryMapper.selectBigCategory();
        for (SmProductCategory big : bigs) {
            if (big.getSpcId().equals(spcId)) {
                List<SmProductCategory> smalls = smProductCategoryMapper.selectSmallCategory();
                for (SmProductCategory samll : smalls) {
                    if (samll.getSpcParentId().equals(spcId)) {
                        return smProductCategoryMapper.deleteByPrimaryKey(spcId);
                    }
                }
            }
        }
        return smProductCategoryMapper.deleteByPrimaryKey(spcId);
    }

    @Override
    public List<SmProductCategory> selectAndsmall(Integer spcId) {
        return smProductCategoryMapper.selectBigandsmall(spcId);
    }

    @Override
    public SmProductCategory findById(Integer spcChildId) {
        return smProductCategoryMapper.selectByPrimaryKey(spcChildId);
    }
}
