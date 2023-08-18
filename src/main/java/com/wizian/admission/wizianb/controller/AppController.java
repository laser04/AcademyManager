package com.wizian.admission.wizianb.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AppController {

    //메인 페이지
    @GetMapping("/app")
    public String application(Model model){
        model.addAttribute("title","모집전형선택");
        return "/application/applicationWrite";
    }
    @GetMapping("/selectInfo")
    public String SelecInfo(Model model){
        model.addAttribute("title","전형 정보");
        return "/application/applicationSelectInfo";
    }

    //원서작성페이지 임시데이터로 불러와봄
    @GetMapping("/getTestData")
    public ResponseEntity<List<Map<String, String>>> getTestData( ) throws Exception { // 데이터베이스에서 저장된 이벤트 정보 가져오기 로직을 여기에 구현하세요.

        List<Map<String, String>> dataList = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            Map<String, String> dataMap = new HashMap<>();
            dataMap.put("status", "준비중");
            dataMap.put("title", "2023년 야간과정");
            dataMap.put("subtitle", "2023/2023년 야간과정");
            dataMap.put("progressNum", "2023년 정규과정 16기");
            dataMap.put("submitPeriod", "2023-03-30 09:00 ~ 2023-08-30 00:00" );
            dataMap.put("passDocumentPre", "2023-01-10 06:01:20" );
            dataMap.put("writeDocumentPre", "2023-02-28 11:02:30" );
            dataMap.put("finalDocumentPre", "2023-03-30 18:03:59" );

            dataList.add(dataMap);
        }
        return new ResponseEntity<>(dataList, HttpStatus.OK);
    }

    @GetMapping("/checked")
    public String checked(Model model){
        model.addAttribute("title","마이페이지");
        return "/application/applicationChecked";
    }

    @GetMapping("/pass")
    public String pass(Model model){
        model.addAttribute("title", "합격자발표");
        return "/application/applicationPass";
    }
    @GetMapping("/pledge")
    public String pledge(Model model){
        model.addAttribute("title","등록서약/포기");
        return "/application/applicationPledge";
    }

    @GetMapping("userInfo")
    public String userInfo(Model model){
        model.addAttribute("title","기본정보");
        return "/application/applicationInfo";
    }
    @GetMapping("userEdu")
    public String userEdu(Model model){
        model.addAttribute("title","학력사항");
        return "/application/applicationEdu";
    }
    @GetMapping("userExp")
    public String userExp(Model model){
        model.addAttribute("title","경력사항");
        return "/application/applicationExp";
    }
    @GetMapping("userIntroduce")
    public String userIntroduce(Model model){
        model.addAttribute("title","자기소개서");
        return "/application/applicationIntroduce";
    }



    @GetMapping("test")
    public String test(){
        return "/user/header";
    }
}