package com.kopo.finalproject.PurchasePlanList.model.dao;

import com.kopo.finalproject.PurchasePlanList.model.dto.PurchasePlanJoinResult;
import com.kopo.finalproject.PurchasePlanList.model.dto.PurchasePlanListItem;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PurchasePlanListMapper {
    void addPurchasePlanListItem(PurchasePlanListItem item);

    List<PurchasePlanJoinResult> getAllPurchasePlanList(String memberID);

}
