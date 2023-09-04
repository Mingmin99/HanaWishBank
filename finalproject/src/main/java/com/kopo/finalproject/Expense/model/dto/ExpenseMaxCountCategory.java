package com.kopo.finalproject.Expense.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
@AllArgsConstructor
public class ExpenseMaxCountCategory {
    private String expenseCategoryCode;
    private int categoryCount;
}
