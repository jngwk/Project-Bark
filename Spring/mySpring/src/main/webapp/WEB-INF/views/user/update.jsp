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
				<form action="#" method="post">
					<div class="update-content">
						<div class="sub-title">
							<p>기본정보</p>
							<label> <span>이름</span>
								<p id="update-name"></p>
							</label> <label> <span>아이디</span>
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
											<input type="password" id="after-pwd" class="input-text" />
											<button type="button" class="reset-btn">
												<img src="${icons}/reset.png" />
											</button>
									</label></li>
									<li><label class="pwd-menu"> <span>비밀번호 확인</span>
											<input type="password" class="input-text" />
											<button type="button" class="reset-btn">
												<img src="${icons}/reset.png" />
											</button>
									</label></li>
								</ul>
							</div>

							<label> <span>이메일</span> <input type="email"
								class="input-text" id="update-email" />
								<button type="button" class="reset-btn">
									<img src="${icons}/reset.png" />
								</button>
							</label> <label> <span>전화번호</span> <input type="text"
								id="update-phone" oninput="hyphenTel(this)" maxlength="13"
								class="input-text" />
								<button type="button" class="reset-btn">
									<img src="${icons}/reset.png" class="input-text" />
								</button>
							</label>
						</div>
						<!-- 주소정보 -->
						<div class="sub-title">
							<p>주소</p>
							<label> <span>주소</span> <input type="text"
								id="update-addr" class="input-text" readonly />
								<button type="button" class="addr-search-btn">
									<img src="${icons}/light-brown-search-btn.png" />
								</button>
							</label> <label> <span>세부 주소</span> <input type="text"
								id="update-addrDetail" class="input-text" />
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
						<button type="submit" class="brown-btn medium-btn update-save-btn">저장</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		function getUser(){
			$.ajax({
				type: 'GET',
				url : "/user/getUser",
				data: {id: '${userId}'},
				success: function(user){
					/* console.log(user.name);
					console.log(user.id);
					console.log(user.phone);
					console.log(user.email);
					console.log(user.addr); */
				    $("#update-name").text(user.name);
				    $("#update-id").text(user.id);
				    $("#update-phone").val(user.phone);
				    hyphenTel(document.querySelector("#update-phone"));
				    $("#update-email").val(user.email);
				    $("#update-addr").val(user.addr);
				    init
				},error: (error) => {
					alert("오류");
				     console.log(JSON.stringify(error));
				}				
			})
		}
		
	</script>
	<script src="${js }/updateUser.js"></script>
</body>
</html>

