package com.kopo.finalproject.PurchasePlanList.service;

import com.kopo.finalproject.PurchasePlanList.model.dao.PurchasePlanListMapper;
import com.kopo.finalproject.PurchasePlanList.model.dto.PurchasePlanJoinResult;
import com.kopo.finalproject.PurchasePlanList.model.dto.PurchasePlanListItem;
import com.kopo.finalproject.WishList.model.dao.WishListMapper;
import com.kopo.finalproject.WishList.model.dto.WishListItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class PurchasePlanListServiceImpl implements PurchasePlanListService {

    @Autowired
    private PurchasePlanListMapper purchasePlanListMapper;

    @Autowired
    private WishListMapper wishListMapper;

    @Override
    @Transactional
    public void addPurchasePlanListItem(PurchasePlanListItem item) {
        purchasePlanListMapper.addPurchasePlanListItem(item);
        WishListItem wishListItem = new WishListItem();
        wishListItem.setMemberID(item.getMemberID());
        wishListItem.setWishListID(item.getWishListID());
        System.out.println("확인" + wishListItem);
        wishListMapper.updateWishListItemPurchaseStatus(wishListItem);
    }

    @Override
    public List<PurchasePlanJoinResult> getAllPurchasePlanList(String memberID) {
        List<PurchasePlanJoinResult> purchasePlanJoinResult = purchasePlanListMapper.getAllPurchasePlanList(memberID);
        return purchasePlanJoinResult;
    }

    @Override
    public void updatePurchasePlanListInfo(PurchasePlanListItem updatedPlan) {
        purchasePlanListMapper.updatePurchasePlanListInfo(updatedPlan);

    }

    @Override
    public void deletePurchasePlanList(List<String> selectedIds) {
        purchasePlanListMapper.deletePurchasePlanList(selectedIds);
    }

    @Override
    public List<PurchasePlanListItem> getPurchasePlansByIds(List<String> selectedIds) {
        List<PurchasePlanListItem> resultList = new ArrayList<>(); // 리스트를 초기화

        for(String selectedId : selectedIds){
            System.out.println(selectedId+ ": 서비스의 selectedIds");

            resultList.add(purchasePlanListMapper.getPurchasePlansById(selectedId));
        }

        for (PurchasePlanListItem i : resultList) {
            System.out.println("1 " + i);
        }

        return resultList;
    }
}