package com.kopo.finalproject.Savings.service;

import com.kopo.finalproject.Savings.model.dao.SavingsMapper;
import com.kopo.finalproject.Savings.model.dto.Account;
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
}
