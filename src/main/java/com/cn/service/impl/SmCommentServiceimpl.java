package com.cn.service.impl;


import com.cn.dao.SmCommentMapper;
import com.cn.model.SmComment;
import com.cn.model.SmCommentExample;
import com.cn.service.SmCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SmCommentServiceimpl implements SmCommentService {

    @Autowired
    SmCommentMapper smCommentMapper;

    /**
     * 添加
     */
    public int insertTest(SmComment smComment){
        return smCommentMapper.insertSelective(smComment);
    }

    @Override
    public SmComment selectById(int scId) {
        return smCommentMapper.selectByPrimaryKey(scId);
    }

    @Override
    public int selectByScspId(Integer spId) {
        return smCommentMapper.selectScspIdAll(spId);
    }

    @Override
    public List<SmComment> findAll(int spId) {
        SmCommentExample smCommentExample = new SmCommentExample();
        SmCommentExample.Criteria criteria = smCommentExample.createCriteria();
        criteria.andScSpIdEqualTo(spId);
        return smCommentMapper.selectByExample(smCommentExample);
    }
}
