<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="${css }/loginPopup.css" />
<link rel="stylesheet" href="${css }/searchDropdown.css" />
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
								<div class="form-slide first-slide find-acc-form">
									<label class="popup-label find-acc-label"> <span>이메일</span>
										<input type="email" name="email" class="login-popup-input" />
									</label> <label class="popup-label verify-label hide"> <span>인증번호</span>
										<input type="text" name="code"
										class="login-popup-input code-input" />
									</label>
									<button type="button"
										class="submit-btn find-acc-btn login-popup-btn"
										data-stage="get-code">이메일 인증</button>
									<button type="button" class="login-prev-btn login-popup-btn">
										돌아가기</button>
								</div>
								<!-- 비밀번호 변경 -->
								<div class="form-slide renew-pwd-slide">
								<input type="hidden" id="renew-pwd-email" name="email"> 
									<label class="popup-label"> <span>새로운 비밀번호</span> <input
										type="password" name="pwd" class="login-popup-input"
										id="pwd-new" />
									</label> <label class="popup-label pwd-input"> <span>새로운 비밀번호
											확인</span> <input type="password" class="login-popup-input"
										id="confirm-pwd-new" />
									</label>
									<button type="button" class="submit-btn renew-pwd-btn login-popup-btn">
										완료</button>
									<button type="button" class="cancel-btn init-btn login-popup-btn">
										취소</button>
								</div>
								<div class="form-slide final-slide">
									<div class="text-wrap">
										<p>비밀번호가 변경이 완료됐습니다.</p>
										<p>로그인 후 이용해주세요.</p>
									</div>
									<button type="button" class="back-to-login-btn init-btn login-popup-btn">
										로그인</button>
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
									<!-- 개인 회원가입 form -->
									<form class="general-form" action="${contextPath }/user/join"
										method="post" display="none">
										<!-- 개인 아이디 비밀번호 -->
										<div class="form-slide first-slide">
											<input type="hidden" name="type" value="1" /> 
											<input type="hidden" name="available" value="1" /><label
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
										<!-- 개인 이름 전화번호 -->
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
										<!-- 개인 이메일 인증 -->
										<div class="form-slide">
											<label class="popup-label"> <span>이메일</span> <input
												type="email" name="email" class="login-popup-input" />
											</label> <label class="popup-label verify-label hide"> <span>인증번호</span>
												<input type="text" name="code"
												class="login-popup-input code-input" />
											</label>
											<button type="button"
												class="submit-btn login-popup-btn email-verify-btn"
												data-stage="get-code">이메일 인증</button>
											<button type="button" class="prev-btn login-popup-btn">
												이전</button>
										</div>
									</form>
									<!-- 보호소 회원가입 form -->
									<form class="shelter-form" action="${contextPath }/user/join"
										method="post" display="none">
										<!-- 보호소 선택 -->
										<div class="form-slide first-slide">
											<div class="search-wrapper">
												<div class="popup-label">
													<div class="login-popup-input shelter-select-btn">
														<span>보호소 선택</span> <img
															src="${icons }/chev-down-icon.png" alt="" />
													</div>
													<label class="popup-label shelter-name-label hide">
														<span>보호소 이름</span> <input type="text" name="name"
														id="selectedShelterName" class="login-popup-input" />
													</label> <input class="login-popup-input" id="selectedShelterAddr"
														name="addr" type="hidden" />
													<div class="shelter-name-content">
														<div class="search">
															<img src="${icons }/search-btn.png" alt="" /> <input
																id="search-input" spellcheck="false" type="text"
																placeholder="보호소 이름을 검색해주세요..." />
														</div>
														<ul class="options"></ul>
													</div>
												</div>
											</div>
											<button type="button" class="next-btn login-popup-btn">다음</button>
											<button type="button" class="prev-btn login-popup-btn">이전</button>
										</div>
										<!-- 보호소 선택 -->
										<div class="form-slide ">
											<input type="hidden" name="available" value="0"/>
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
										<!-- 보호소 전화번호 -->
										<!-- <div class="form-slide">
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
										</div> -->
										<!-- 보호소 주소 -->
										<div class="form-slide shelter-addr-slide">
											<label class="popup-label"> <span>주소</span> <input
												type="text" name="addr" class="login-popup-input" readonly /><img
												class="search-btn-icon" src="${icons }/search-btn.png"
												alt="검색" />
											</label> <label class="popup-label"> <span>세부 주소</span> <input
												type="text" name="addrDetail" class="login-popup-input" />
											</label>
											<button type="button" class="next-btn login-popup-btn">
												다음</button>
											<button type="button" class="prev-btn login-popup-btn">
												이전</button>
										</div>
										<!-- 보호소 전화번호 이메일 인증 -->
										<div class="form-slide">
											<label class="popup-label"> <span>전화번호</span> <input
												type="tel" name="phone" class="login-popup-input" />
											</label> <label class="popup-label"> <span>이메일</span> <input
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
									<div class="form-slide final-slide general-slide">
										<div class="text-wrap">
											<p>회원가입이 완료 되었습니다!</p>
											<p>로그인 후 이용해주세요</p>
										</div>
									</div>
									<div class="form-slide final-slide shelter-slide">
										<div class="text-wrap">
											<p>회원가입이 완료 되었습니다!</p>
											<p>관리자 승인 후 로그인이 가능합니다.</p>
											<p class="sub-text">* 영업일 기준 24시간 이내에 승인 이메일을 받으실 수 있습니다.</p>
										</div>
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
	<script>
		// 주소 설정하기
		const wrapper = document.querySelector(".search-wrapper"),
		  selectBtn = wrapper.querySelector(".shelter-select-btn"),
		  searchInp = wrapper.querySelector("#search-input"),
		  options = wrapper.querySelector(".options"),
		  shelterNameInp = wrapper.querySelector("#selectedShelterName"),
		  shelterNameLabel = wrapper.querySelector(".shelter-name-label"),
		  shelterAddrSlide = document.querySelector(".shelter-addr-slide"),
		  shelterAddrInp = wrapper.querySelector("#selectedShelterAddr");
		
		selectBtn.addEventListener("click", () => wrapper.classList.toggle("active"));
		
		
		$(".shelter-btn").on("click",function(){
			getShelterList();
		})
		
		var shelterNames = [];
		var sMap = new Map();
		function getShelterList(){
			$.ajax({
				type: 'GET',
				url : "/donation/shelterList",
				success: function(items){
				    items.forEach(item => {
				    	shelterNames.push(item.shelterName);
				    	sMap.set(item.shelterName, item.shelterAddr);
				    	/* shelters.push(item); */
				    })
				    console.log(sMap.size);
				    console.log(sMap.get("강현림동물병원"));
				    addShelter();
				},error: (error) => {
				     console.log(JSON.stringify(error));
				}				
			})
		}
		
		function checkRegisteredShelter(shelterName){ // 원래는 shelterno으로 검사하는게 맞지만..
			$.ajax({
				type: 'GET',
				url : "/user/check-regi-shelter",
				success: function(isRegistered){
				    if(isRegistered){
				    	// add class "duplicate-shelter"
				    }
				},error: (error) => {
				     console.log(JSON.stringify(error));
				}				
			})
		}
		
		function addShelter(selectedShelter) {
			if(shelterNames.length <= 0){
				// 가져오지 못하면 다시 가져와!
				getShelterList();
			}
		  options.innerHTML = "";
		  shelterNames.forEach((sName) => {
		    let isSelected = sName == selectedShelter ? "selected" : "other";
		    let li = `<li onclick="updateName(this); hideShelterNameLabel(this);" class="\${isSelected}">\${sName}</li>`;
		    options.insertAdjacentHTML("beforeend", li);
		  });
		}
		

		function updateName(selectedLi) {
		  searchInp.value = "";
		  addShelter(selectedLi.innerText);
		  wrapper.classList.remove("active");
		  selectBtn.firstElementChild.innerText = selectedLi.innerText;
		  selectBtn.firstElementChild.classList.add("font-dark");
		  /* checkRegisteredShelter(selectedLi.innerText); */
		}

		searchInp.addEventListener("keyup", () => {
		  let arr = [];
		  let searchWord = searchInp.value.toLowerCase();
		  arr = shelterNames
		    .filter((data) => {
		      return data.toLowerCase().startsWith(searchWord);
		    })
		    .map((data) => {
		      let isSelected =
		        data == selectBtn.firstElementChild.innerText ? "selected" : "";
		      return `<li onclick="updateName(this); hideShelterNameLabel(this);" class="\${isSelected}">\${data}</li>`;
		    })
		    .join("");
		  options.innerHTML = arr
		    ? arr
		    : `<li onclick="updateName(this); showShelterNameLabel();">보호소 등록하기</li>`;
		});
		
		function showShelterNameLabel(){
			// hidden input에 이름 비우기
			shelterNameInp.value = "";
			// hidden input에 주소 비우기
			shelterAddrInp.value = "";
			// 주소 슬라이드 다시 작동하게 하기
			enableShelterAddrSlide();
			shelterNameLabel.classList.remove("hide");
			shelterNameLabel.classList.add("show");
		}
		function hideShelterNameLabel(selectedLi){
			selectBtn.firstElementChild.classList.add("font-dark");
			// hidden input에 이름 넣지
			shelterNameInp.value = selectedLi.innerText;
			// 주소 슬라이드 숨기기
			disableShelterAddrSlide();
			// hidden input에 주소 넣기
			shelterAddrInp.value = sMap.get(selectedLi.innerText);
			console.log(shelterAddrInp.value);
			// hidden input에 이름 받기
			shelterNameLabel.classList.add("hide");
			shelterNameLabel.classList.remove("show", "required");
		}
		
		function disableShelterAddrSlide(){
			shelterAddrSlide.classList.add("hide");
			var inputs = shelterAddrSlide.querySelectorAll("input");
			inputs.forEach(input => input.removeAttribute("name"));
			shelterAddrInp.setAttribute("name", "addr");
		}
		function enableShelterAddrSlide(){
			shelterAddrSlide.classList.remove("hide");
			var inputs = shelterAddrSlide.querySelectorAll("input");
			shelterAddrInp.removeAttribute("name", "addr");
			inputs[0].setAttribute("name", "addr");
			inputs[1].setAttribute("name", "addrDetail");
		}
		function initShelterSelector(){
			wrapper.classList.remove("active")
			enableShelterAddrSlide();
			selectBtn.firstElementChild.classList.remove("font-dark");
			searchInp.value = "";
			selectBtn.firstElementChild.innerText = "보호소 선택";
		}
		
	</script>
	<script type="text/javascript" src="${js }/loginPopup.js"></script>
</body>
</html>
