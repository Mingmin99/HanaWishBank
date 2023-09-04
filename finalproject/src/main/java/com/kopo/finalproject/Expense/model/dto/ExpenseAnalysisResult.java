package com.kopo.finalproject.Expense.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
@AllArgsConstructor
public class ExpenseAnalysisResult {
    private String expenseCategoryCode;
    private String totalExpenseCategoryExpenseAmount;

}
