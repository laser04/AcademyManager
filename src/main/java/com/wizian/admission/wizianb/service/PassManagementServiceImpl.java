package com.wizian.admission.wizianb.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.wizian.admission.wizianb.domain.PassManagement;
import com.wizian.admission.wizianb.domain.Recruitment;
import com.wizian.admission.wizianb.dto.ToastUiResponseDto;
import com.wizian.admission.wizianb.repository.PassManagementRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
@Component
@RequiredArgsConstructor
public class PassManagementServiceImpl implements PassManagementService {

    private final PassManagementRepository passManagementRepository;

    @Override
    public List<PassManagement> courseSelect(String termDiv, String courseDiv) {
        if(termDiv.equals("0")) termDiv = "%";
        if(courseDiv.equals("0")) courseDiv = "%";

        return passManagementRepository.courseSelect(termDiv, courseDiv);
    }

    @Override
    public ToastUiResponseDto findNthList(String termDiv, String courseDiv, String rcrtNo) {
        if(termDiv.equals("0")) termDiv = "%";
        if(courseDiv.equals("0")) courseDiv = "%";
        if(rcrtNo.equals("0")) rcrtNo = "%";

        List<Recruitment> passManagementList = passManagementRepository.findNthList(termDiv, courseDiv, rcrtNo);

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("contents", passManagementList);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto findPassList(String rcrtNo) {
        List<PassManagement> passManagementList = passManagementRepository.findPassList(rcrtNo);

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("contents", passManagementList);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto findDocPass(String rcrtNo){
        List<PassManagement> passManagementList = passManagementRepository.findDocPass(rcrtNo);

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("contents", passManagementList);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto findFnlPass(String rcrtNo){
        List<PassManagement> passManagementList = passManagementRepository.findFnlPass(rcrtNo);

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("contents", passManagementList);
        resultMap.put("pagination", "");

        return ToastUiResponseDto.builder().result(true).data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto updateDocPass(JsonNode jn) {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("pagination", "");

        JsonNode jnArr = jn.get("updatedRows");

        for (int i=0; i<jnArr.size(); i++) {
            PassManagement data = PassManagement.builder()
                    .aplyNo(jnArr.get(i).get("aplyNo").asText())
                    .rcrtNo(jnArr.get(i).get("rcrtNo").asText())
                    .docPassYn(jnArr.get(i).get("docPassYn").asText()).build();

            passManagementRepository.updateDocPass(data);
        }

        return ToastUiResponseDto.builder().data(resultMap).build();
    }

    @Override
    public ToastUiResponseDto updateFnlPass(JsonNode jn) {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("pagination", "");

        JsonNode jnArr = jn.get("updatedRows");

        for (int i=0; i<jnArr.size(); i++) {
            PassManagement data = PassManagement.builder()
                    .aplyNo(jnArr.get(i).get("aplyNo").asText())
                    .rcrtNo(jnArr.get(i).get("rcrtNo").asText())
                    .FnlPassYn(jnArr.get(i).get("fnlPassYn").asText()).build();

            passManagementRepository.updateFnlPass(data);
        }

        return ToastUiResponseDto.builder().data(resultMap).build();
    }
}
