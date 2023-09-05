package com.kopo.finalproject.Expense.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
@AllArgsConstructor
public class SubCategory {
    private String SubCategoryDescription;
    private int RepresentativePrice;
    private String ParentCategoryCode;
    private String TagImage;
    private int SubCategoryCount;



}
