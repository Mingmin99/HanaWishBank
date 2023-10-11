package com.kopo.finalproject.Savings.service;

import com.kopo.finalproject.PurchasePlanList.model.dto.SavingPurchasePlan;
import com.kopo.finalproject.Savings.model.dto.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface SavingsService {
    List<Account> getAllAccounts();

    void insertPaymentPlan(ChallengeSavings challengeSavings);

    List<ChallengeSavings> getAllChallengeSavings(String memberID);

    void updatePlanItemRatio(PlanItemRatio planData);

    void updatePlanListItemSavingsAccountNumber(String memberID, int purchasePlanID, long challengeSavingsAccountNumber);

    void updatePlanItemSavingStatus(String memberID, int purchasePlanID);

    List<SavingInfo> getAllSavingsInfo( String memberID);

    List<SavingPurchasePlan> getPurchasePlanByAccountNumber(String challengeSavingsAccountNumber, String  memberID);

    void firstDepositWithdrawal(ChallengeSavings challengeSavings);

    void insertTransferRecord(ChallengeSavings challengeSavings);

    List<PurchasePlanAndWishListItem> getPurchasePlanAndWishListItemByAccountNumber(String challengeSavingsAccountNumber, String memberID);

    void completedSavingsDepositWithdrawal(String memberID, String withdrawalAccount, String selectedAccount, int withdrawalAccountBalance);

    void insertCompletedSavingsTransferRecord(String memberID, String withdrawalAccount, String selectedAccount, int withdrawalAccountBalance, String transferMethod);

    void updateCompletedSavingsExpirationStatus(String memberID, String withdrawalAccount);
}
