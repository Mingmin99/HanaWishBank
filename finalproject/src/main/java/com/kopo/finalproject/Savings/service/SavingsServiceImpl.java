package com.kopo.finalproject.Savings.service;

import com.kopo.finalproject.PurchasePlanList.model.dto.SavingPurchasePlan;
import com.kopo.finalproject.Savings.model.dao.SavingsMapper;
import com.kopo.finalproject.Savings.model.dto.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SavingsServiceImpl implements SavingsService {
    private final SavingsMapper savingsMapper;

    public SavingsServiceImpl(SavingsMapper savingsMapper) {
        this.savingsMapper = savingsMapper;
    }

    @Override
    public List<Account> getAllAccounts() {
        return savingsMapper.getAllAccounts();
    }

    @Override
    public void insertPaymentPlan(ChallengeSavings challengeSavings) {
        savingsMapper.insertPaymentPlan(challengeSavings);
    }

    @Override
    public List<ChallengeSavings> getAllChallengeSavings(String memberID) {
        return savingsMapper.getAllChallengeSavings(memberID);
    }

    @Override
    public void updatePlanItemRatio(PlanItemRatio planData) {
        savingsMapper.updatePlanItemRatio(planData);
    }

    @Override
    public void updatePlanListItemSavingsAccountNumber(String memberID, int purchasePlanID, long challengeSavingsAccountNumber) {
        savingsMapper.updatePlanListItemSavingsAccountNumber(memberID, purchasePlanID, challengeSavingsAccountNumber);
    }

    @Override
    public void updatePlanItemSavingStatus(String memberID, int purchasePlanID) {
        savingsMapper.updatePlanItemSavingStatus(memberID, purchasePlanID);
    }

    @Override
    public List<SavingInfo> getAllSavingsInfo(String memberID) {
        return savingsMapper.getAllSavingsInfo(memberID);
    }

    @Override
    public List<SavingPurchasePlan> getPurchasePlanByAccountNumber(String challengeSavingsAccountNumber, String memberID) {
        return savingsMapper.getPurchasePlanByAccountNumber(challengeSavingsAccountNumber, memberID);
    }

    @Override
    public void firstDepositWithdrawal(ChallengeSavings challengeSavings) {
        savingsMapper.firstWithdrawal(challengeSavings);
        savingsMapper.firstDeposit(challengeSavings);
    }

    @Override
    public void insertTransferRecord(ChallengeSavings challengeSavings) {
        savingsMapper.insertTransferRecord(challengeSavings);
    }

    @Override
    public List<PurchasePlanAndWishListItem> getPurchasePlanAndWishListItemByAccountNumber(String challengeSavingsAccountNumber, String memberID) {
        return savingsMapper.getPurchasePlanAndWishListItemByAccountNumber(challengeSavingsAccountNumber,memberID);
    }

}
