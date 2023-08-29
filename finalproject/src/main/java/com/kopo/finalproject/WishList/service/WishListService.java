package com.kopo.finalproject.WishList.service;

import com.kopo.finalproject.WishList.model.dto.WishListItem;

import java.util.List;

public interface WishListService {
    public List<WishListItem> getAllWishListItems();

    void addToWishList(WishListItem item);
}



