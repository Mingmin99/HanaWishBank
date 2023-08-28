package com.kopo.finalproject.WishList.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kopo.finalproject.WishList.model.dto.NaverResult;
import com.kopo.finalproject.WishList.model.dto.WishListItem;
import com.kopo.finalproject.WishList.service.WishListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
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

    @RequestMapping("/registerMyWishList")
    public ModelAndView registerMyWishList() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("registerMyWishList");
        return mav;
    }


    @GetMapping("/wish-list")
    public ResponseEntity<List<WishListItem>> getAllWishListItems() {
        List<WishListItem> itemList = wishListService.getAllWishListItems();
        System.out.println(itemList + " 테스트");
        return ResponseEntity.ok(itemList);
    }

    @GetMapping("/search")
    public String list(String text, Model model) {

        // 네이버 검색 API 요청
        String clientId = "5yKMnO6CXlXzBlfUFymV";
        String clientSecret = "r4rSp2dzQr";

        //String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text;    // JSON 결과
        URI uri = UriComponentsBuilder.fromUriString("https://openapi.naver.com").path("/v1/search/shop.json").queryParam("query", text).queryParam("display", 20).queryParam("start", 1).queryParam("sort", "sim").encode().build().toUri();

        // Spring 요청 제공 클래스
        RequestEntity<Void> req = RequestEntity.get(uri).header("X-Naver-Client-Id", "5yKMnO6CXlXzBlfUFymV").header("X-Naver-Client-Secret", "r4rSp2dzQr").build();
        // Spring 제공 restTemplate
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> resp = restTemplate.exchange(req, String.class);

        // JSON 파싱 (Json 문자열을 객체로 만듦, 문서화)
        ObjectMapper om = new ObjectMapper();
        NaverResult result = null;

        try {
            result = om.readValue(resp.getBody(), NaverResult.class);
            System.out.println("NaverResult object: " + result); // 로그 출력
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        List<WishListItem> items = result.getItems();
        model.addAttribute("items", items);
        System.out.println("Items in model: " + items);
        return "/registerMyWishList";
    }

}


