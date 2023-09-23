package com.kopo.finalproject.Savings.service;

import com.kopo.finalproject.Savings.model.dto.Account;
import com.kopo.finalproject.Savings.model.dto.ChallengeSavings;
import com.kopo.finalproject.Savings.model.dto.PlanItemRatio;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface SavingsService {
    List<Account> getAllAccounts();

    void insertPaymentPlan(ChallengeSavings challengeSavings);

    List<ChallengeSavings> getAllChallengeSavings(String memberID);

    void updatePlanItemRatio(PlanItemRatio planData);
}
