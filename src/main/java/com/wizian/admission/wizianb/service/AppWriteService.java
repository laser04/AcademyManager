package com.wizian.admission.wizianb.service;


import com.wizian.admission.wizianb.domain.AppWriteInfo;
import com.wizian.admission.wizianb.domain.ApplicationInfo;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;

public interface AppWriteService {

    void fileUpload(MultipartFile fileUpload, AppWriteInfo member, AppWriteInfo appInfo) throws IOException;
    AppWriteInfo memInfo(String memberId);
    HashMap<String,String> fileInfo(AppWriteInfo member);

    ResponseEntity<Object> fileDownload(String fileNo) throws IOException;


}
