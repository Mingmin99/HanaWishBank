package com.kopo.finalproject.HWBMember.service;

import com.kopo.finalproject.HWBMember.model.dto.HWBMember;

import java.util.HashMap;
import java.util.List;

public interface HWBMemberService {

    List<HWBMember> getAllMember();

    HWBMember selectNameOfMember(String memberID);

    HWBMember loginMember(HashMap<String, String> loginData);
}
