package com.kopo.finalproject.PurchasePlanList.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PurchasePlanListController {


    @RequestMapping("/checkMyPurchasePlanList")
    public ModelAndView checkMyPurchasePlanList() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("checkMyPurchasePlanList");
        return mav;
    }

}