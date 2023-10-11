package com.kopo.finalproject.HWBMember.service;

import com.kopo.finalproject.HWBMember.model.dao.HWBMemberMapper;
import com.kopo.finalproject.HWBMember.model.dto.HWBMember;
import com.kopo.finalproject.HWBMember.model.dto.TransferRecord;
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

    @Override
    public HWBMember getHWBMemberInfoByID(String memberID) {
        return mapper.getHWBMemberInfoByID(memberID);
    }

    @Override
    public int getCountWishListItemByID(String memberID) {
        return mapper.getCountWishListItemByID(memberID);
    }

    @Override
    public int getCountPurchasePlanListItemByID(String memberID) {
        return mapper.getCountPurchasePlanListItemByID(memberID);
    }

    @Override
    public int getCountChallengeSavingsByID(String memberID) {
        return mapper.getCountChallengeSavingsByID(memberID);
    }

    @Override
    public List<TransferRecord> getTransferRecordByID(String memberID){
        return mapper.getTransferRecordByID(memberID);
    }

    @Override
    public int getCountChallengeSavingsByStatus(String memberID) {
        return mapper.getCountChallengeSavingsByStatus(memberID);
    }
}
