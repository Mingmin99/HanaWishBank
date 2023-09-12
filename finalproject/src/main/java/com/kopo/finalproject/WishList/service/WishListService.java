package com.kopo.finalproject.WishList.service;

import com.kopo.finalproject.WishList.model.dto.WishListItem;

import java.util.List;

public interface WishListService {
    List<WishListItem> getAllWishListItems();

    void addWishlistItem(WishListItem item);

    boolean deleteWishListItem(String title);

    List<WishListItem> getWishListItemsByMemberID(String memberID);
    void updateWishListItemPurchaseStatus(WishListItem item);
}



