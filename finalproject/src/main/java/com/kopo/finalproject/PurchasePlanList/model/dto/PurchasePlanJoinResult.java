package com.kopo.finalproject.PurchasePlanList.model.dto;

import lombok.Data;

@Data
public class PurchasePlanJoinResult {
    private int wishListID;
    private String memberID;
    private int purchasePlanID; // 수정: 카멜 표기법
    private String planName; // 수정: 카멜 표기법
    private int planAmount;
    private int planPeriod;
    private int allocationRatio;
    private String title;   // 대문자 T를 소문자 t로 변경
    private String image;   // 대문자 I를 소문자 i로 변경
    private int price;
}
