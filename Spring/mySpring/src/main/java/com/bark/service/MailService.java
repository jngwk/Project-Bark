package com.bark.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.bark.domain.User;
import com.bark.mapper.UserMapper;

import lombok.Setter;

@Service
@Component
public class MailService {
	@Autowired
	private UserMapper mapper;
	private JavaMailSenderImpl mailSender;
	private int authNumber; //난수코드
	
	public int makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
		return authNumber;
	}
	
	
	public String joinEmail(String email) {	//이메일 보낼 양식(href 추가해도 될듯?)
		authNumber = makeRandomNumber();
		User user = mapper.findUser(email);
		
		String setFrom = "jwlee20541@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력
		String toMail = email;
		String title = "Bark 인증 이메일 입니다."; // 이메일 제목
		String content = "안녕하세요, "+user.getName()+" 님."+
				"<br>" +"Bark를 방문해주셔서 감사합니다." +
				"<br>" +"회원님의 계정정보는 아래와 같습니다."+
				"<br>" +"----------------------"+
				"<br>" +"아이디: "+user.getId()+
				"<br>" +"----------------------"+
				"<br><br>" + "인증 번호는 " + authNumber + "입니다." + "<br>" + "해당 인증번호를 입력해 주세요."; 
		mailSend(setFrom, toMail, title, content);
        return Integer.toString(authNumber);
	}
	
	//이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능(문자 인코딩 설정도 가능)
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			
			// true 전달 > html 형식으로 전송, 작성하지 않으면 단순 텍스트로 전달
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
