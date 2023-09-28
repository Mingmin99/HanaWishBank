package com.kopo.finalproject.Expense.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Setter
@Getter
public class ExpenseChartData {
    private String description; // 열 이름에 맞게 필드명을 수정
    private long TotalExpenseCategoryExpenseAmount;
}

