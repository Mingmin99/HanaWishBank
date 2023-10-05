package com.kopo.finalproject.HWBMember.service;

import com.kopo.finalproject.HWBMember.model.dto.HWBMember;
import com.kopo.finalproject.HWBMember.model.dto.TransferRecord;

import java.util.HashMap;
import java.util.List;

public interface HWBMemberService {

    List<HWBMember> getAllMember();

    HWBMember selectNameOfMember(String memberID);

    HWBMember loginMember(HashMap<String, String> loginData);
    HWBMember  getHWBMemberInfoByID (String memberID);

    int getCountWishListItemByID(String memberID);

    int getCountPurchasePlanListItemByID(String memberID);

    int getCountChallengeSavingsByID(String memberID);

    List<TransferRecord> getTransferRecordByID(String memberID);
}
