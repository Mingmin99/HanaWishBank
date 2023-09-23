package com.kopo.finalproject.Savings.service;

import com.kopo.finalproject.Savings.model.dao.SavingsMapper;
import com.kopo.finalproject.Savings.model.dto.Account;
import com.kopo.finalproject.Savings.model.dto.ChallengeSavings;
import com.kopo.finalproject.Savings.model.dto.PlanItemRatio;
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

}
