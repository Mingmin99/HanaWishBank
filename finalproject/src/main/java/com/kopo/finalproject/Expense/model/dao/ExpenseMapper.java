package com.kopo.finalproject.Expense.model.dao;


import com.kopo.finalproject.Expense.model.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ExpenseMapper {
    List<ExpenseAnalysisResult> getExpenseCategoryTotalAmount();

    List<ExpenseChartData> getExpenseChartData(String cardID, String memberID);

    ExpenseMaxCountCategory getTopCategory(String cardID);

    ExpenseMaxSumCategory getTopAmount(String cardID);

    TotalExpenseAmount getTotalExpenseAmount(String cardID);

    SubCategory getTopCategoryDetailedExpenseCategory(String cardID);
    SubCategory getTopAmountDetailedExpenseCategory(String cardID);

}
