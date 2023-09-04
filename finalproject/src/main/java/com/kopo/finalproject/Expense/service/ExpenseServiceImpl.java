package com.kopo.finalproject.Expense.service;

import com.kopo.finalproject.Expense.model.dao.ExpenseMapper;
import com.kopo.finalproject.Expense.model.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExpenseServiceImpl implements ExpenseService {

    ExpenseMapper expenseMapper;

    @Autowired
    public ExpenseServiceImpl(ExpenseMapper expenseMapper) {
        this.expenseMapper = expenseMapper;
    }

    @Override
    public List<ExpenseAnalysisResult> getExpenseCategoryTotalAmount(String cardID) {
        return null;
    }

    @Override
    public ExpenseMaxCountCategory getTopCategory(String cardID) {
        return expenseMapper.getTopCategory(cardID);
    }

    @Override
    public ExpenseMaxSumCategory getTopAmount(String cardID) {
        return expenseMapper.getTopAmount(cardID);
    }

    @Override
    public TotalExpenseAmount getTotalExpenseAmount(String cardID) {
        return expenseMapper.getTotalExpenseAmount(cardID);
    }

    @Override
    public SubCategory getTopCategoryDetailedExpenseCategory(String cardID) {
        return expenseMapper.getTopCategoryDetailedExpenseCategory(cardID);
    }

    @Override
    public SubCategory getTopAmountDetailedExpenseCategory(String cardID) {
        return expenseMapper.getTopAmountDetailedExpenseCategory(cardID);
    }
}