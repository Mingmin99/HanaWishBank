package com.kopo.finalproject.Savings.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Setter
@Getter
public class SavingInfo {
    private String savingTitle;                // 적금 계좌 제목
    private double GoalAchievementRate;        // 목표 달성률
    private int ChallengeSavingsAccountNumber; // 적금 계좌 번호
    private double AccountBalance;             // 계좌 잔액
    private String planName;                   // 구매 계획명
    private double AllocationRatio;            // 할당 비율
    private double PlanAmount;                 // 계획 금액
    private double ProgressRate;               // 진행률
}

