package com.kopo.finalproject.PurchasePlanList.service;

import com.kopo.finalproject.PurchasePlanList.model.dto.PurchasePlanJoinResult;
import com.kopo.finalproject.PurchasePlanList.model.dto.PurchasePlanListItem;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PurchasePlanListService {
     void addPurchasePlanListItem(PurchasePlanListItem item);
     List<PurchasePlanJoinResult> getAllPurchasePlanList(String memberID);

}
