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
											<div class="search-wrapper">
												<div class="popup-label">
													<div class="login-popup-input shelter-select-btn">
														<span>보호소 선택</span> <img
															src="${icons }/chev-down-icon.png" alt="" />
													</div>
													<label class="popup-label shelter-name-label hide">
														<span>보호소 이름</span> <input type="text" name="name"
														id="selectedShelterName" class="login-popup-input"/>
													</label>

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
										<div class="form-slide ">
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
										<div class="form-slide shelter-addr-slide">
											<label class="popup-label"> <span>주소</span> <input
												type="text" name="addr" class="login-popup-input" readonly /><img
												class="search-btn-icon" src="${icons }/search-btn.png"
												alt="검색" />
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
		  shelterAddrSlide = wrapper.querySelector(".shelter-addr-slide")
		  ;
		
		selectBtn.addEventListener("click", () => wrapper.classList.toggle("active"));
		
		
		$(".shelter-btn").on("click",function(){
			getShelterList();
			console.log("click");
		})
		
		var shelters = [];
		var shelterNames = [];
		function getShelterList(){
			$.ajax({
				type: 'GET',
				url : "/donation/shelterList",
				success: function(items){
				    items.forEach(item => {
				    	shelterNames.push(item.shelterName);
				    	shelters.push(item);
				    })
				    addShelter();
				    console.log(shelterNames.length);
				    console.log(shelters.length);
				    console.log(shelters[0].shelterAddr);
				},error: (error) => {
				     console.log(JSON.stringify(error));
				}				
			})
		}

		function addShelter(selectedShelter) {
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
		    // onclick을 밑에 input 생기는 걸로 바꾸기
		});
		
		function showShelterNameLabel(){
			/* selectBtn.firstElementChild.classList.remove("font-dark"); */
			shelterNameInp.value = "";
			shelterNameLabel.classList.remove("hide");
			shelterNameLabel.classList.add("show");
		}
		function hideShelterNameLabel(selectedLi){
			selectBtn.firstElementChild.classList.add("font-dark");
			shelterNameInp.value = selectedLi.innerText;
			shelterNameLabel.classList.add("hide");
			shelterNameLabel.classList.remove("show", "required");
		}
		
		
		
	</script>
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
