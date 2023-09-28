package com.kopo.finalproject.Savings.model.dao;

import com.kopo.finalproject.PurchasePlanList.model.dto.SavingPurchasePlan;
import com.kopo.finalproject.Savings.model.dto.Account;
import com.kopo.finalproject.Savings.model.dto.ChallengeSavings;
import com.kopo.finalproject.Savings.model.dto.PlanItemRatio;
import com.kopo.finalproject.Savings.model.dto.SavingInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SavingsMapper {
    List<Account> getAllAccounts();

    void insertPaymentPlan(ChallengeSavings challengeSavings);

    List<ChallengeSavings> getAllChallengeSavings(String memberID);

    void updatePlanItemRatio(PlanItemRatio planData);

    void updatePlanListItemSavingsAccountNumber(String memberID, int purchasePlanID, long challengeSavingsAccountNumber);

    void updatePlanItemSavingStatus(String memberID, int purchasePlanID);

    List<SavingInfo> getAllSavingsInfo(String memberID);

    List<SavingPurchasePlan> getPurchasePlanByAccountNumber(String challengeSavingsAccountNumber, String memberID);
}
