package com.kopo.finalproject.WishList.service;

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
}
