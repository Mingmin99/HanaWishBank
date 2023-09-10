package com.kopo.finalproject.PurchasePlanList.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class purchasePlanListController {


    @RequestMapping("/registerMyPurchasePlanList")
    public ModelAndView checkMyPurchasePlanList() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/registerMyPurchasePlanList");
        return mav;
    }

}
