package com.kopo.finalproject.HWBMember.model.dto;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class HWBMember {
    private String memberID;
    private String name;
    private String memberPW;
    private String easyPW;
    private String email;
    private String phone;
    private String personalIDNumber;
    private String gender;
    private String birth;
    private String zipCode;
    private String address;
    private String detailAddress;
    private String registerDate;
    private int memberStatus;
    private String withdrawalDate;


}
