package com.kopo.finalproject.HWBMember.service;

import com.kopo.finalproject.HWBMember.model.dao.HWBMemberMapper;
import com.kopo.finalproject.HWBMember.model.dto.HWBMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class HWBMemberServiceImpl implements HWBMemberService {
    HWBMemberMapper mapper;

    @Autowired
    public HWBMemberServiceImpl(HWBMemberMapper hwbMemberMapper) {
        this.mapper = hwbMemberMapper;
    }

    @Override
    public List<HWBMember> getAllMember() {
        return null;
    }

    @Override
    public HWBMember selectNameOfMember(String memberID) {
        return null;
    }

    @Override
    public HWBMember loginMember(HashMap<String, String> loginData) {
        return mapper.loginMember(loginData);
    }
}
