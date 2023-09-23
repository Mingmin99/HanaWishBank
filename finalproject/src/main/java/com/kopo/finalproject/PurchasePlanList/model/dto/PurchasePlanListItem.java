package com.kopo.finalproject.PurchasePlanList.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
@AllArgsConstructor
public class PurchasePlanListItem {
    private int wishListID;
    private String memberID;
    private int purchasePlanID; // 수정: 카멜 표기법
    private String planName; // 수정: 카멜 표기법
    private int planAmount;
    private int planPeriod;
    private int allocationRatio;
}

