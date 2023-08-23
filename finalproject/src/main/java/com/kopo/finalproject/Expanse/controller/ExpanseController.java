package com.kopo.finalproject.Expanse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExpanseController {
    @RequestMapping("/checkMyExpansePattern")
    public ModelAndView checkMyExpansePattern() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("checkMyExpansePattern");
        return mav;
    }
}
