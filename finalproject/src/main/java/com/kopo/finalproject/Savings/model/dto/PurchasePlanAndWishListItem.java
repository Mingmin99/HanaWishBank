package com.kopo.finalproject.Savings.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Setter
@Getter
public class PurchasePlanAndWishListItem {
    private int purchasePlanID;
    private String planName;
    private int planAmount;
    private int allocationRatio;
    private int wishListID;
    private String title;
    private int price;
    private String image;

}
