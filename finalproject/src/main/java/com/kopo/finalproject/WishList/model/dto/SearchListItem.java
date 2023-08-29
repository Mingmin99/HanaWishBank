package com.kopo.finalproject.WishList.model.dto;

import lombok.*;

@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor

public class SearchListItem {
    private String Title;
    private String Link;
    private String Image;
    private int Lprice;
    private int Hprice;
    private String MallName;
    private String ProductId;
    private int ProductType;
    private String Maker;
    private String Brand;
    private String Category1;
    private String Category2;
    private String Category3;
    private String Category4;

}
