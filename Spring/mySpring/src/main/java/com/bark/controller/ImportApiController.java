package com.bark.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
@Controller
public class ImportApiController {
	
	private IamportClient api;

    public ImportApiController() {
        // Ȩ������ ���� �߱޹��� REST API Ű�� REST API secret �Է� 
        this.api = new IamportClient("0263710522420617","OhmtU50q4pN9A7SYTBXD2PInnKNRIfKAr9OJxN3Y3TmmQNmzo4dALKieF6L70thkgRwTpdMuHQxZdqnE");
    }

    @ResponseBody			
    @RequestMapping(value="/verifyIamport/{imp_uid}", method = RequestMethod.POST)
    public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
    {
    	System.out.print(api.paymentByImpUid(imp_uid));
        return api.paymentByImpUid(imp_uid);
        // ��Ʈ���� ��ϵ� imp_uid�� ���� �ڷḦ �޾ƿ� 
    }
}
