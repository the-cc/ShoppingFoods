package com.cn.service;


import com.cn.model.SmComment;

import java.util.List;

public interface SmCommentService {
    int insertTest(SmComment smComment);
    SmComment selectById(int scId);

    int selectByScspId(Integer spId);

    List<SmComment> findAll(int spId);
}
