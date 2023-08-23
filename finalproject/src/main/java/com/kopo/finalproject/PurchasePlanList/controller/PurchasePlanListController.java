package com.kopo.finalproject.PurchasePlanList.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PurchasePlanListController {
    

    @RequestMapping("/checkMyWishList")
    public ModelAndView checkMyWishList() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("checkMyWishList");
        return mav;
    }
}
