package com.kopo.finalproject.Savings.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class PlanItemRatio {
    private int selectPurchasePlanID;
    private int ratio;
}
