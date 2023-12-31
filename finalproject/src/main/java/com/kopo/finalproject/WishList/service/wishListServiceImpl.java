package com.kopo.finalproject.WishList.service;

import com.kopo.finalproject.PurchasePlanList.model.dto.PurchasePlanListItem;
import com.kopo.finalproject.WishList.model.dao.WishListMapper;
import com.kopo.finalproject.WishList.model.dto.WishListItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

//mapper 연결해줘야함
@Service
public class wishListServiceImpl implements WishListService {

    private final WishListMapper wishListMapper;

    @Autowired
    public wishListServiceImpl(WishListMapper wishListMapper) {
        this.wishListMapper = wishListMapper;
    }

    @Override
    public List<WishListItem> getAllWishListItems() {
        List<WishListItem> wishListItems = wishListMapper.getAllWishListItems();
        return wishListItems;
    }

    public void addWishlistItem(WishListItem item) {
        wishListMapper.insertWishlistItem(item);
    }

    @Override
    public boolean deleteWishListItem(String title) {
        int rowsAffected = wishListMapper.deleteWishListItem(title);
        return rowsAffected > 0; // rowsAffected가 1 이상이면 true를 반환, 그렇지 않으면 false 반환
    }

    @Override
    public List<WishListItem> getWishListItemsByMemberID(String memberID) {
        List<WishListItem> wishListItems = wishListMapper.getWishListItemsByMemberID(memberID);
        return wishListItems;
    }

    @Override
    public void updateWishListItemPurchaseStatus(WishListItem item) {
        wishListMapper.updateWishListItemPurchaseStatus(item);
    }

}
