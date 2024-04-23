<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<style>
input[type='radio'] {
  display: none;
}
input[type='radio']:checked + label {
    background: rgb(226, 220, 205);
}
</style>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>후원하기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/donationForm.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/root.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/transition.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp" flush="false"></jsp:include>
	<div class="donate-container">
		<div class="donate-page slide-animation">
			<div class="paymentForm">
				<img src="${images }/logo-brown.png" />
				<div class="donate-title">강아지들에게 힘이 되어 주세요</div>
				<div class="shelter-info">
					<div class="donate-subtitle">보호소 정보</div>
					<table class="donate-table">
						<tr>
							<th>보호소명</th>
							<td>
							<select name = "shelter">
								<option value="1" selected>1보호소</option>
								<option value="2">2보호소</option>
								<option value="3">3보호소</option>
								<option value="4">4보호소</option>
							</select>
							</td>
						</tr>
					</table>			
				</div>
				
				<form class="userinfo">
				<div class="user-info">
					<div class="donate-subtitle">기본 정보</div>
					<table class="donate-table">					
						<tr>
							<th>이름</th>
							<td><input type="text" name="userName" value="<%=(String) session.getAttribute("userName")%>" readonly /></td>
						</tr>
						<tr>
							<th>휴대전화</th>
							<td><input type="text" name="userPhone" value="<%=(String) session.getAttribute("userPhone")%>" readonly /></td>
						</tr>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="userId" value="<%=(String) session.getAttribute("userId")%>" readonly /></td>
						</tr>
					</table>
				</div>
				</form>
				<div class="bank-info">
					<div class="donate-subtitle">후원 정보</div>
					<table class="donate-table">
						<form  class="paymentAmount">
							<tr>
								<th>후원금액</th>
								<td><input type="text" name="amount" id="price"
									maxlength="20" /></td>
							</tr>
						</form>
						<form class="paymentForm1">
						<tr>
							<th>후원방법</th>
							<td>	
								<input type="radio" id="kakaopay" name="pg" value="kakaopay">
								<label for="kakaopay">KakaoPay</label> 
						
								<input type="radio" id="uplus" name="pg" value="uplus">
								<label for="uplus">토스페이</label>
								
								<input type="radio" id="html5_inicis" name="pg" value="html5_inicis">
								<label for="html5_inicis">KG이니시스</label>
							</td>
						</tr>
						</form>
					</table>
				</div>
				<div class="donate-button">
					<input class="large-btn green-btn" type="button"
						onclick="history.back()" value="취소">
					<input
						class="large-btn green-btn" type="button" id="do" value="후원하기">
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="${views }/include/footer.jsp" flush="false"></jsp:include>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</body>
</html>

<script>
IMP.init("imp60737432");

const button = document.querySelector("#do");
const form = document.querySelector(".paymentForm1");
const Amount = document.querySelector(".paymentAmount");
const Info = document.querySelector(".userinfo");
const Shelter = document.querySelector("select[name='shelter']");


const onClickPay = async() => {
	
	var today = new Date();
	var year = today.getFullYear();
	var month = ("0" + (today.getMonth() + 1)).slice(-2);  // 월은 0부터 시작하므로 1을 더하고, 두 자리수로 만듭니다.
	var day = ("0" + today.getDate()).slice(-2);  // 일도 두 자리수로 만듭니다.
	var formattedToday = year + month + day;
	
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes();  // 분
	var seconds = today.getSeconds();  // 초
	var milliseconds = today.getMilliseconds();
	var makeMerchantUid = formattedToday + hours + minutes + seconds + milliseconds;
	
	const selectedValue = form.pg.value;
 	const selectAmount = Amount.amount.value;
	const userName = Info.userName.value;
	const userPhone = Info.userPhone.value;
	const userId = Info.userId.value;
	const shelterno = Shelter.value;
	
	IMP.request_pay({
		pg:selectedValue,
		pay_method: "card", 
		amount: selectAmount, 
		name: "보호소후원",
		merchant_uid: "IMP"+ makeMerchantUid,
		buyer_tel: userPhone,
		buyer_name: userName,
		buyer_id: userId

	}, function (rsp) { // callback
	      console.log(rsp);
			var t = 0;
			if(rsp.status == "paid"){
				t = 1;
			}else{
				t = 2;
			}
	      if ( rsp.success ) { //결제 성공시
	        var msg = '결제가 완료되었습니다.';
	        var result = {
	          "id" : userId, //회원아이디
	          "shelterno" :shelterno, //보호소번호
	          "state":t, //결제수단
	          "amount":selectAmount // 결제금액  
	        }
	        console.log(result);//완

	        $.ajax({
	          url:'/donate/new',
	          type:'POST',
	          contentType: 'application/json',
	          data:JSON.stringify(result),
	          success: function (res) {
	            console.log(res);
	            location.href=res;
	          },
	          error: function (err) {
	            console.log(err);
	          }
	        }); //ajax
	        location.href ="${contextPath}/user/userDonationList?id=${userId}"; 
	      } else {
	          var msg = '결제 실패';
	          msg += '\n에러내용 : ' + rsp.error_msg;
	        }
	      alert(msg);
	    });
};

button.addEventListener("click",onClickPay);


</script>
</html>