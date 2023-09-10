package com.kopo.finalproject.WishList.model.dto;

import lombok.*;

@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class WishListItem {
    private String title;   // 대문자 T를 소문자 t로 변경
    private String image;   // 대문자 I를 소문자 i로 변경
    private int price;
    private String memberID; // 대문자 M을 소문자 m으로 변경

}
