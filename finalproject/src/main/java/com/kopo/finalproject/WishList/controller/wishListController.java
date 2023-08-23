package com.kopo.finalproject.WishList.controller;

import com.kopo.finalproject.WishList.model.dto.WishListItem;
import com.kopo.finalproject.WishList.service.WishListService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class wishListController {

    private final WishListService wishListService;

    @Autowired
    public wishListController(WishListService wishListService) {
        this.wishListService = wishListService;
    }

    @RequestMapping("/checkMyPurchasePlanList")
    public ModelAndView checkMyPurchasePlanList() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("checkMyPurchasePlanList");
        return mav;
    }

    @GetMapping("/wish-list")
    public String getAllWishListItems(Model model) {
        List<WishListItem> itemList = wishListService.getAllWishListItems();
        model.addAttribute("itemList", itemList);
        System.out.println("Fetched items: " + itemList); // 로그 추가
        return "checkMyPurchasePlanList"; // JSP 페이지 이름
    }
}
