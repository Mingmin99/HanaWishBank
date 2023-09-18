package com.kopo.finalproject.PurchasePlanList.model.dao;

import com.kopo.finalproject.PurchasePlanList.model.dto.PurchasePlanJoinResult;
import com.kopo.finalproject.PurchasePlanList.model.dto.PurchasePlanListItem;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PurchasePlanListMapper {
    void addPurchasePlanListItem(PurchasePlanListItem item);

    List<PurchasePlanJoinResult> getAllPurchasePlanList(String memberID);

    void updatePurchasePlanListInfo(PurchasePlanListItem updatedPlan);

    void deletePurchasePlanList(List<String> selectedIds);

    PurchasePlanListItem getPurchasePlansById(@Param("selectedId") String selectedId);

}
