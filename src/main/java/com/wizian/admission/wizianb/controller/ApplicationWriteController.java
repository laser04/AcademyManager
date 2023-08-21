package com.wizian.admission.wizianb.controller;

import com.wizian.admission.wizianb.service.ApplicationWriteService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
public class ApplicationWriteController {

    private final ApplicationWriteService applicationWriteService;

    //모집 전형
    @GetMapping("/app")
    public String entryWrite(Model model){
        model.addAttribute("title","모집전형선택");
        model.addAttribute("entrySelMaster",applicationWriteService.entrySelMaster());
        model.addAttribute("entrySelSchdl",applicationWriteService.entrySelSchdl());
        return "/application/applicationWrite";
    }

    //전형 정보
    @PostMapping("/selectInfo")
    public String SelectInfo(HttpServletRequest request, Model model){
        model.addAttribute("title","전형 정보");
        String entryRcrtNo = request.getParameter("entryRcrtNo");
        model.addAttribute("rcrtNo", entryRcrtNo);
        model.addAttribute("courseName",applicationWriteService.selectInfoHead(entryRcrtNo));

        //msg_div(전형안내문 등록 테이블 >> 안내문 종류 코드) 변경 시 수정
        //모집전형 안내문
        String msgDiv = "10";
        model.addAttribute("content",applicationWriteService.selectInfoContent(entryRcrtNo, msgDiv));
        return "/application/applicationSelectInfo";
    }

    //로그인
    @GetMapping("/login")
    public String getLogin(HttpServletRequest request){
        return "/application/applicationLogin";
    }

    @PostMapping("/login")
    public String postLogin(HttpServletRequest request, Model model){
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        if(email.isEmpty()){
            model.addAttribute("text","아이디를 입력해주세요.");
            return "/application/applicationLogin";
        }else if(password.isEmpty()){
            model.addAttribute("text","비밀번호를 입력해주세요.");
            return "/application/applicationLogin";
        }

        String emailCheck = applicationWriteService.emailCheck(email);
        String passwordCheck = applicationWriteService.passwordCheck(email, password);
        if(emailCheck == null || passwordCheck == null){
            model.addAttribute("text","아이디 또는 비밀번호가 틀렸습니다.");
            return "/application/applicationLogin";
        }else{
            return "/application/applicationInfo";
        }

    }
}