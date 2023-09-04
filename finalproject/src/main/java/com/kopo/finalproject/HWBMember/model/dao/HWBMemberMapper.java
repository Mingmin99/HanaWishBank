package com.kopo.finalproject.HWBMember.model.dao;

import com.kopo.finalproject.HWBMember.model.dto.HWBMember;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface HWBMemberMapper {

    List<HWBMember> getAllMember();

    HWBMember selectNameOfMember(String memberID);

    HWBMember loginMember(HashMap<String, String> loginData);


}



