<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="${css }/loginPopup.css" />
</head>
<body>
	<div class="popup_layer " id="popup_layer">
		<div class="popup_box">
			<div class="popup_btn close-pop">
				<img src="${icons }/x-regular-36.png" alt="x" />
			</div>
			<!--팝업 컨텐츠 영역-->
			<div class="popup_content">
				<div class="cont">
					<div class="form sign-in">
						<h2 class="login-popup-h2">
							<img src="${images }/bark_logo-removebg-trimmed.png" alt="logo" />
						</h2>
						<div class="form-slider">
							<div class="form-slides cont-slides">
								<!-- 공통 -->
								<div class="form-slide login-form">
									<label class="popup-label"> <span>아이디</span> <input
										type="text" name="id" class="login-popup-input" />
									</label> <label class="popup-label"> <span>비밀번호</span> <input
										type="password" name="pwd" class="login-popup-input" />
									</label>
									<p class="forgot-id-pwd">아이디 | 비밀번호 찾기</p>
									<button type="button"
										class="submit-btn login-btn login-popup-btn">로그인</button>
									<button type="button" class="fb-btn login-popup-btn">
										<span>간편</span> 로그인
									</button>
								</div>
								<!-- 계정찾기 -->
								<div class="form-slide find-acc-form">
									<label class="popup-label"> <span>이름</span> <input
										type="text" name="name" class="login-popup-input" />
									</label> <label class="popup-label"> <span>이메일</span> <input
										type="email" name="email" class="login-popup-input" />
									</label>
									<button type="button"
										class="submit-btn find-acc-btn login-popup-btn">계정 찾기</button>
									<button type="button" class="login-prev-btn login-popup-btn">
										돌아가기</button>
								</div>
							</div>
						</div>
					</div>
					<div class="sub-cont">
						<div class="img">
							<div class="img__text m--up">
								<h2 class="login-popup-h2">새로 오셨나요?</h2>
								<p>
									저희와 함께 집을 잃은 <br />아이들을 도와주세요
								</p>
							</div>
							<div class="img__text m--in">
								<h2 class="login-popup-h2">계정이 있으신가요?</h2>
								<p>바크를 다시 찾아주셔서 감사합니다!</p>
							</div>
							<div class="img__btn">
								<span class="m--up">회원가입</span> <span class="m--in">로그인</span>
							</div>
						</div>
						<!-- 회원 가입 -->
						<div class="form sign-up">
							<h2 class="login-popup-h2">
								<img src="${images }/bark_logo-removebg-trimmed.png" alt="logo" />
							</h2>
							<!-- 1단계 -->
							<div class="form-slider">
								<!-- 공통 -->
								<div class="form-slides sub-cont-slides">
									<div class="form-slide button-slide">
										<button type="button" class="general-btn login-popup-btn">
											개인 회원</button>
										<button type="button" class="shelter-btn login-popup-btn">
											보호소 회원</button>
									</div>
									<form class="general-form" action="${contextPath }/user/join"
										method="post" display="none">
										<div class="form-slide first-slide">
											<input type="hidden" name="type" value="1" /> <label
												class="popup-label"> <span>아이디</span> <input
												type="text" name="id" class="login-popup-input id-input" />
											</label> <label class="popup-label"> <span>비밀번호</span> <input
												type="password" name="pwd" class="login-popup-input"
												id="pwd-gen" />
											</label> <label class="popup-label pwd-input"> <span>비밀번호
													확인</span> <input type="password" class="login-popup-input"
												id="confirm-pwd-gen" />
											</label>
											<button type="button" class="next-btn login-popup-btn">
												다음</button>
											<button type="button" class="prev-btn login-popup-btn">
												이전</button>
										</div>
										<div class="form-slide">
											<label class="popup-label"> <span>이름</span> <input
												type="text" name="name" class="login-popup-input" />
											</label> <label class="popup-label"> <span>전화번호</span> <input
												type="tel" name="phone" class="login-popup-input" />
											</label>
											<button type="button" class="next-btn login-popup-btn">
												다음</button>
											<button type="button" class="prev-btn login-popup-btn">
												이전</button>
										</div>
										<div class="form-slide">
											<label class="popup-label"> <span>이메일</span> <input
												type="email" name="email" class="login-popup-input" />
											</label> <label class="popup-label verify-label pending hide">
												<span>인증번호</span> <input type="text" name="code"
												class="login-popup-input code-input" />
											</label>
											<button type="button"
												class="submit-btn login-popup-btn email-verify-btn"
												data-stage="get-code">이메일 인증</button>
											<button type="button" class="prev-btn login-popup-btn">
												이전</button>
										</div>
									</form>
									<form class="shelter-form" action="${contextPath }/user/join"
										method="post" display="none">
										<div class="form-slide first-slide">
											<input type="hidden" name="type" value="2" /> <label
												class="popup-label"> <span>아이디</span> <input
												type="text" name="id" class="login-popup-input id-input" />
											</label> <label class="popup-label"> <span>비밀번호</span> <input
												type="password" name="pwd" class="login-popup-input"
												id="pwd-shelter" />
											</label> <label class="popup-label pwd-input"> <span>비밀번호
													확인</span> <input type="password" class="login-popup-input"
												id="confirm-pwd-shelter" />
											</label>
											<button type="button" class="next-btn login-popup-btn">
												다음</button>
											<button type="button" class="prev-btn login-popup-btn">
												이전</button>
										</div>
										<div class="form-slide">
											<input type="hidden" name="type" value="2" /> <label
												class="popup-label"> <span>보호소명</span> <input
												type="text" name="name" class="login-popup-input" />
											</label> <label class="popup-label"> <span>전화번호</span> <input
												type="tel" name="phone" class="login-popup-input" />
											</label>
											<button type="button" class="next-btn login-popup-btn">
												다음</button>
											<button type="button" class="prev-btn login-popup-btn">
												이전</button>
										</div>
										<div class="form-slide">
											<label class="popup-label"> <span>예금주</span> <input
												type="text" name="accHolder" class="login-popup-input" />
											</label> <label class="popup-label"> <span>은행명</span> <input
												type="text" name="bank" class="login-popup-input" />
											</label> <label class="popup-label"> <span>계좌번호</span> <input
												type="text" name="bankAcc" class="login-popup-input" />
											</label>
											<button type="button" class="next-btn login-popup-btn">
												다음</button>
											<button type="button" class="prev-btn login-popup-btn">
												이전</button>
										</div>
										<div class="form-slide">
											<label class="popup-label"> <span>주소</span> <input
												type="text" name="addr" class="login-popup-input" />
											</label> <label class="popup-label"> <span>세부 주소</span> <input
												type="text" name="addrDetail" class="login-popup-input" />
											</label> <label class="popup-label"> <span>우편번호</span> <input
												type="text" name="postcode" class="login-popup-input" />
											</label>
											<button type="button" class="next-btn login-popup-btn">
												다음</button>
											<button type="button" class="prev-btn login-popup-btn">
												이전</button>
										</div>
										<div class="form-slide">
											<label class="popup-label"> <span>이메일</span> <input
												type="email" name="email" class="login-popup-input" />
											</label> <label class="popup-label verify-label pending hide">
												<span>인증번호</span> <input type="text" name="code"
												class="login-popup-input code-input" />
											</label>
											<button type="button"
												class="submit-btn login-popup-btn email-verify-btn"
												data-stage="get-code">이메일 인증</button>
											<button type="button" onclick="authCheck()" class="prev-btn login-popup-btn">
												이전</button>
										</div>
									</form>
									<div class="form-slide final-slide">
										<p>회원가입이 완료 되었습니다!</p>
										<p>로그인 후 이용해주세요</p>
									</div>
								</div>
							</div>
						</div>
						<!-- end of sign up -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${js }/loginPopup.js"></script>
	<script>
	const authCheck = () => {
        $.ajax({
            // 요청방식: get
            // 요청주소: /ex01
            type: "get",
            url: "/authCheck",
            // 요청이 성공했을 때 실행되는 부분
            success: function (res) {
                console.log("성공", res)
            },
            // 요청이 실패했을 때 실행되는 부분
            error: function (err) {
                console.log("실패", err);
            },
        })
    }
	</script>
</body>
</html>
