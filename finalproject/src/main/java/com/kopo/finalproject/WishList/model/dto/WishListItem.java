package com.kopo.finalproject.WishList.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public  class WishListItem {
    private int WishListID;
    private String ItemName;
    private int Price;
    private String Image;
}
