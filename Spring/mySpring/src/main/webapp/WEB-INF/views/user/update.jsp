<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/updateUser.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/root.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/findAddr.css" />
</head>
<body>
	<div class="update-popup-layer" id="update-popup-layer"
		data-feat="update">
		<div class="update-popupbox">
			<!--팝업 컨텐츠 영역-->
			<div class="update-popup-content">
				<div class="update-title">
					<c:choose>
						<c:when test="${userType == 1 }">
							<p class="large-font">개인 정보 수정</p>
						</c:when>
						<c:otherwise>
							<p class="large-font">보호소 정보 수정</p>
						</c:otherwise>
					</c:choose>
					<hr />
				</div>
				<form name="update-user-form" action="#" method="post">
					<div class="update-content">
						<div class="sub-title">
							<p>기본정보</p>
							<label> <span>이름</span>

								<p id="update-name"></p>
							</label> <label> <span>아이디</span> <input type="hidden" name="id"
								id="update-id-hidden" value="">
								<p id="update-id"></p> <span
								class="pwd-btn brown-btn medium-btn">비밀번호 변경</span>
							</label>
							<div class="pwd-mainmenu">
								<ul class="pwd-sub">
									<li><label class="pwd-menu"> <span>현재 비밀번호</span>
											<input type="password" id="before-pwd" class="input-text" />
											<button type="button" class="reset-btn">
												<img src="${icons}/reset.png" />
											</button>
									</label></li>
									<li><label class="pwd-menu"> <span>변경 비밀번호</span>
											<input type="password" id="after-pwd" class="input-text"
											name="pwd" />
											<button type="button" class="reset-btn">
												<img src="${icons}/reset.png" />
											</button>
									</label></li>
									<li><label class="pwd-menu"> <span>비밀번호 확인</span>
											<input type="password" class="input-text"
											id="after-pwd-confirm" />
											<button type="button" class="reset-btn">
												<img src="${icons}/reset.png" />
											</button>
									</label></li>
								</ul>
							</div>
							<label> <span>이메일</span> <input type="hidden"
								name="email" id="update-email-hidden" value="">
								<p id="update-email"></p>
							</label> <label> <span>전화번호</span> <input type="text"
								id="update-phone" oninput="hyphenTel(this)" maxlength="13"
								class="input-text " name="phone" />
								<button type="button" class="reset-btn">
									<img src="${icons}/reset.png" />
								</button>
							</label>
							<%-- <label> <span>이메일</span> <input type="email"
								class="input-text" id="update-email" name="email" oninput="checkDuplicateEmailOnUpdate($(this))"/>
								<button type="button" class="reset-btn">
									<img src="${icons}/reset.png" />
								</button><a href="javascript:sendCode(this)" class="send-code">인증번호 전송</a>
							</label>  
							<label class="verify-label"> <span>인증번호</span> <input type="text"
								class="input-text" id="verify-email"/>
								<span
								class="verify-btn brown-btn medium-btn">인증하기</span>
							</label> --%>
						</div>
						<!-- 주소정보 -->
						<div class="sub-title">
							<p>주소</p>
							<label> <span>주소</span> <input type="text"
								id="update-addr" class="input-text" name="addr" />
								<button type="button" class="addr-search-btn"
									onclick="findAddr()">
									<img src="${icons}/light-brown-search-btn.png" />
								</button>
							</label> <label> <span>세부 주소</span> <input type="text"
								id="update-addrDetail" class="input-text" name="addrDetail" />
								<button type="button" class="reset-btn">
									<img src="${icons}/reset.png" />
								</button>
							</label>
						</div>
						<div style="height: 80px"></div>
					</div>
					<div class="update-completeBtn">
						<button type="button"
							onclick="location.href='javascript:closeUpdatePop()'"
							class="secondary-btn medium-btn update-cancel-btn">취소</button>
						<button type="button" onclick="updateUser()"
							class="brown-btn medium-btn update-save-btn">저장</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="find-addr-layer" id="update-layer">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
			id="btnCloseLayer" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
	<script>
		var userEmail = "";
		var userPwd = "";
		function getUser(){
			$.ajax({
				type: 'GET',
				url : "/user/getUser",
				data: {id: '${userId}'},
				success: function(user){
					$("#update-id-hidden").val(user.id);
				    $("#update-name").text(user.name);
				    $("#update-id").text(user.id);
				    $("#update-phone").val(user.phone);
				    hyphenTel(document.querySelector("#update-phone"));
				    /* $("#update-email").val(user.email); */
				    $("#update-email-hidden").val(user.email);
				    $("#update-email").text(user.email);
				    /* userEmail = user.email; */
				    console.log(userEmail);
				    $("#update-addr").val(user.addr);
				    userPwd = user.pwd;
				    console.log(user.pwd);
				    console.log(userPwd);
				},error: (error) => {
					alert("예상치 못한 오류가 발생했습니다. 관리자에게 문의해주세요.");
				     console.log(JSON.stringify(error));
				}				
			})
		}
		
		function canProceedUpdate() {
		    var reqMet = true;
		    var $inputs = $("form[name='update-user-form']").find("input");

		    $inputs.each(function(index, input) {
		        var $input = $(input); // Correctly create a jQuery object from the input
		        // Check if email or phone inputs are empty
		        if ($input.attr("name") === "email" || $input.attr("name") === "phone") {
		            if ($input.val().trim() === "") {
		                $input.closest("label").removeClass("invalid available-email duplicate-email").addClass("required");
		                reqMet = false; // Update condition based on empty required fields
		            }
		        }
		        // Check if any validation classes are present
		        if ($input.closest("label").hasClass("required") || $input.closest("label").hasClass("not-match") || 
		            $input.closest("label").hasClass("wrong-pwd") || $input.closest("label").hasClass("invalid") || 
		            $input.closest("label").hasClass("duplicate-email")) {
		            alert("회원 정보 입력이 완료해주세요.");
		            reqMet = false;
		        }
		    });

		    // Password confirmation check
		    if ($("#after-pwd").val() !== $("#after-pwd-confirm").val()) {
		        alert("비밀번호가 제대로 입력되지 않았습니다");
		        reqMet = false;
		    }

		    return reqMet;
		}

		function updateUser(){
			if(canProceedUpdate){
				$.ajax({
					type: 'POST',
					url : "/user/updateUser",
					data: $("form[name=update-user-form]").serialize(),
					success: function(result){
						console.log(result);
						if(result == 0){
							alert("데이터베이스 오류");
						}else{
							alert("회원 정보가 수정 되었습니다.");
						}
					},error: (error) => {
						alert("예상치 못한 오류가 발생했습니다. 관리자에게 문의해주세요.");
					     console.log(JSON.stringify(error));
					}				
				})
			}
		}
	</script>
	<script src="${js }/updateUser.js"></script>
	<script src="${js }/userUpdateFindAddr.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>

