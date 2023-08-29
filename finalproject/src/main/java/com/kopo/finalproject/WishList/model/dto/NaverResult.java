package com.kopo.finalproject.WishList.model.dto;

import lombok.*;

import java.util.List;

@Getter
@Setter
@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor
public class NaverResult {
    private String lastBuildDate;
    private int total;
    private int start;
    private int display;
    private List<SearchListItem> items;

    @Override
    public String toString() {
        return "NaverResult{" +
                "lastBuildDate='" + lastBuildDate + '\'' +
                ", total=" + total +
                ", start=" + start +
                ", display=" + display +
                ", items=" + items +
                '}';
    }
}
