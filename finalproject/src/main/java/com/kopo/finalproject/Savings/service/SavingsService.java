package com.kopo.finalproject.Savings.service;

import com.kopo.finalproject.Savings.model.dto.Account;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface SavingsService {
    List<Account> getAllAccounts();
}
