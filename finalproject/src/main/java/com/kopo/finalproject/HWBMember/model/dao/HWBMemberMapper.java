package com.kopo.finalproject.HWBMember.model.dao;

import com.kopo.finalproject.HWBMember.model.dto.HWBMember;
import com.kopo.finalproject.HWBMember.model.dto.TransferRecord;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface HWBMemberMapper {

    List<HWBMember> getAllMember();

    HWBMember selectNameOfMember(String memberID);

    HWBMember loginMember(HashMap<String, String> loginData);

    HWBMember getHWBMemberInfoByID(String memberID);

    int getCountWishListItemByID(String memberID);

    int getCountPurchasePlanListItemByID(String memberID);

    int getCountChallengeSavingsByID(String memberID);

    List<TransferRecord> getTransferRecordByID(String memberID);

    int getCountChallengeSavingsByStatus(String memberID);
}



