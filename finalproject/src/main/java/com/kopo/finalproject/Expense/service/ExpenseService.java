package com.kopo.finalproject.Expense.service;

import com.kopo.finalproject.Expense.model.dto.*;

import java.util.List;


public interface ExpenseService {

    List<ExpenseAnalysisResult> getExpenseCategoryTotalAmount(String cardID);


    ExpenseMaxCountCategory getTopCategory(String cardID);

   ExpenseMaxSumCategory getTopAmount(String cardID);

   TotalExpenseAmount getTotalExpenseAmount(String cardID);
    SubCategory getTopCategoryDetailedExpenseCategory(String cardID);
    SubCategory getTopAmountDetailedExpenseCategory(String cardID);

}
