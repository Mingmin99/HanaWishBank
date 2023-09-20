package com.kopo.finalproject.Savings.model.dao;

import com.kopo.finalproject.Savings.model.dto.Account;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SavingsMapper {
    List<Account> getAllAccounts();
}
