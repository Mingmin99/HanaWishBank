package com.kopo.finalproject.WishList.model.dao;

import com.kopo.finalproject.WishList.model.dto.WishListItem;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface WishListMapper {
    List<WishListItem> getAllWishListItems();

    void insertWishlistItem(WishListItem item);
}