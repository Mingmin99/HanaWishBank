package com.kopo.finalproject.WishList.controller;

import com.kopo.finalproject.WishList.model.dto.WishListItem;
import com.kopo.finalproject.WishList.service.WishListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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

    @RequestMapping("/checkMyWishList")
    public ModelAndView checkMyWishList() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("checkMyWishList");
        return mav;
    }
/*
    @GetMapping("/wish-list")
    public ModelAndView getAllWishListItems(Model model) {
        List<WishListItem> itemList = wishListService.getAllWishListItems();
        ModelAndView mav = new ModelAndView();
        mav.addObject("itemList", itemList);

//        model.addAttribute("itemList", itemList);

        System.out.println("Fetched items: " + itemList); // 로그 추가
        return mav; // JSP 페이지 이름
    }*/
    @GetMapping("/wish-list")
    public ResponseEntity<List<WishListItem>> getAllWishListItems() {
        List<WishListItem> itemList = wishListService.getAllWishListItems();
        System.out.println(itemList + " 테스트");
        return ResponseEntity.ok(itemList);
    }
}
