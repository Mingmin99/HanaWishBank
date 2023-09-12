package com.kopo.finalproject.WishList.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kopo.finalproject.WishList.model.dto.NaverResult;
import com.kopo.finalproject.WishList.model.dto.SearchListItem;
import com.kopo.finalproject.WishList.model.dto.WishListItem;
import com.kopo.finalproject.WishList.service.WishListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

    @RequestMapping("/myWishListDetail")
    public ModelAndView myWishListDetail() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("myWishListDetail");
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

    @GetMapping("/getWishListItemsByMemberID")
    public ResponseEntity<List<WishListItem>> getAllWishListItems(HttpSession session) {
        // HttpSession을 사용하여 세션에서 memberID 가져오기
        String memberID = (String) session.getAttribute("memberID");

        // memberID를 사용하여 위시리스트 아이템을 가져옵니다.
        List<WishListItem> itemList = wishListService.getWishListItemsByMemberID(memberID);
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
        List<SearchListItem> items = result.getItems();
        model.addAttribute("items", items);
        System.out.println("Items in model: " + items);
        return "/registerMyWishList";
    }


    @PostMapping("/addToWishList")
    @ResponseBody
    public String addToWishList(@RequestBody WishListItem item, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String memberID = (String) session.getAttribute("memberID");

        if (memberID != null) {
            item.setMemberID(memberID);
            wishListService.addWishlistItem(item);
            return "success";
        } else {
            return "로그인 정보를 찾을 수 없습니다."; // 로그인이 필요한 상태임을 알려줌
        }
    }

    @RequestMapping("/deleteWishList")
    public String deleteWishList(
            @RequestParam("title") String title,
            RedirectAttributes redirectAttributes) {

        // 삭제가 성공하면 "success" 속성을 설정
        boolean deletionSuccessful = wishListService.deleteWishListItem(title);
        if (deletionSuccessful) {
            redirectAttributes.addFlashAttribute("successMessage", "삭제가 완료되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "삭제에 실패했습니다.");
        }

        // 삭제 후 리다이렉트
        return "redirect:/checkMyWishList";
    }

}

