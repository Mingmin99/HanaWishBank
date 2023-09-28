package com.kopo.finalproject.PurchasePlanList.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class SavingPurchasePlan {
    private int wishListID;
    private String memberID;
    private int purchasePlanID; // 수정: 카멜 표기법
    private String planName; // 수정: 카멜 표기법
    private int planAmount;
    private int planPeriod;
    private int allocationRatio;
    private long challengeSavingsAccountNumber;
    private String SavingStatus;
}
