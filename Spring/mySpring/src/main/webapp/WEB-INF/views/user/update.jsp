<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/updateUser.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/root.css" />
</head>
<body>
	<div class="update-popup-layer" id="update-popup-layer"
		data-feat="update">
		<div class="update-popupbox">
			<!--팝업 컨텐츠 영역-->
			<div class="update-popup-content">
				<div class="update-title">
					<p class="large-font">개인정보 수정</p>
					<hr />
				</div>
				<form action="#" method="post">
					<div class="update-content">
						<div class="sub-title">
							<p>기본정보</p>
							<label> <span>이름</span>
								<p>김지현</p>
							</label> <label> <span>아이디</span>
								<p>
									wlgus8846<span class="pwd-btn">비밀번호 변경</span>
								</p>
							</label>

							<div class="pwd-mainmenu">
								<ul class="pwd-sub">
									<li><label class="pwd-menu"> <span>현재 비밀번호</span>
											<input type="password" id="before-pwd" class="input-text" />
											<button type="reset" class="reset-btn">
												<img src="../images/reset.png" />
											</button>
									</label></li>
									<li><label class="pwd-menu"> <span>변경 비밀번호</span>
											<input type="password" id="after-pwd" class="input-text" />
											<button type="reset" class="reset-btn">
												<img src="../images/reset.png" />
											</button>
									</label></li>
									<li><label class="pwd-menu"> <span>비밀번호 확인</span>
											<input type="password" class="input-text" />
											<button type="reset" class="reset-btn">
												<img src="../images/reset.png" />
											</button>
									</label></li>
								</ul>
							</div>

							<label> <span>이메일</span> <input type="email" id="email"
								class="input-text" />
								<button type="reset" class="reset-btn">
									<img src="../images/reset.png" />
								</button>
							</label> <label> <span>전화번호</span> <input type="text" id="phone"
								oninput="hypenTel(this)" maxlength="13" class="input-text" />
								<button type="reset" class="reset-btn">
									<img src="../images/reset.png" class="input-text" />
								</button>
							</label>
						</div>
						<!-- 은행정보 -->
						<div class="sub-title">
							<p>은행</p>

							<label> <span>예금주</span> <input type="text"
								id="bank-name" class="input-text" />
								<button type="reset" class="reset-btn">
									<img src="../images/reset.png" />
								</button>
							</label> <label> <span>은행명</span> <input type="text" id="bank" />
								<button type="reset" class="reset-btn">
									<img src="../images/reset.png" class="input-text" />
								</button>
							</label> <label> <span>계좌번호</span> <input type="text"
								id="bankAcc" class="input-text" />
								<button type="reset" class="reset-btn">
									<img src="../images/reset.png" />
								</button>
							</label>
						</div>
						<!-- 주소정보 -->
						<div class="sub-title">
							<p>주소</p>
							<label> <span>우편번호</span> <input type="text"
								id="postcode" class="input-text" />
								<button type="reset" class="reset-btn">
									<img src="../images/reset.png" />
								</button>
							</label> <label> <span>주소</span> <input type="text" id="addr"
								class="input-text" />
								<button type="reset" class="reset-btn">
									<img src="../images/reset.png" />
								</button>
							</label> <label> <span>세부 주소</span> <input type="text"
								id="addrDetail" class="input-text" />
								<button type="reset" class="reset-btn">
									<img src="../images/reset.png" />
								</button>
							</label>
						</div>
						<div style="height: 80px"></div>
					</div>
					<div class="update-completeBtn">
						<button type="button"
							onclick="location.href='javascript:closeUpdatePop()'"
							class="update-cancel-btn">취소</button>
						<button type="submit" class="update-save-btn">저장</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="${js }/updateUser.js"></script>
</body>
</html>

