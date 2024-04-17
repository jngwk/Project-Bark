<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${css }/updateUser.css" />
    <link rel="stylesheet" href="${css }/root.css" />
    <script src="../js/update-user copy.js"></script>
  </head>
  <body>
    <div class="popup_layer" id="popup_layer">
      <div class="popup_box">
        <!--팝업 컨텐츠 영역-->
        <div class="popup_content">
          <div class="title">
            <text class="large-font">개인정보 수정</text>
            <hr />
          </div>
          <form action="#" method="post">
            <div class="content">
              <div class="sub-title">
                <text>기본정보</text>
                <label>
                  <span>이름</span>
                  <text>김지현</text>
                </label>
                <label>
                  <span>아이디</span>
                  <text>wlgus8846<span class="pwd-btn">비밀번호 변경</span></text>
                </label>

                <div class="menu">
                  <ul class="sub">
                    <li>
                      
                        <label class="pwd-menu">
                          <span>현재 비밀번호</span>
                          <input
                            type="password"
                            id="before-pwd"
                            class="input-text"
                          />
                          <button type="reset" class="reset-btn">
                            <img src="../images/reset.png" />
                          </button>
                        </label>
                      
                    </li>
                    <li>
                      
                        <label class="pwd-menu">
                          <span>변경 비밀번호</span>
                          <input
                            type="password"
                            id="after-pwd"
                            class="input-text"
                          />
                          <button type="reset" class="reset-btn">
                            <img src="../images/reset.png" />
                          </button>
                        </label>
                      
                    </li>
                    <li>
                      
                        <label class="pwd-menu">
                          <span>비밀번호 확인</span>
                          <input type="password" class="input-text" />
                          <button type="reset" class="reset-btn">
                            <img src="../images/reset.png" />
                          </button>
                        </label>
                      
                    </li>
                  </ul>
                </div>
                
                  <label>
                    <span>이메일</span>
                    <input type="email" id="email" class="input-text" />
                    <button type="reset" class="reset-btn">
                      <img src="${images }/reset.png" />
                    </button>
                  </label>
                
                
                  <label>
                    <span>전화번호</span>
                    <input
                      type="text"
                      id="phone"
                      oninput="hypenTel(this)"
                      maxlength="13"
                      class="input-text"
                    />
                    <button type="reset" class="reset-btn">
                      <img src="${images }/reset.png" class="input-text" />
                    </button>
                  </label>
                
              </div>
              <!-- 은행정보 -->
              <div class="sub-title">
                <text>은행</text>
                
                  <label>
                    <span>예금주</span>
                    <input type="text" id="bank-name" class="input-text" />
                    <button type="reset" class="reset-btn">
                      <img src="${images }/reset.png" />
                    </button>
                  </label>
                
                
                  <label>
                    <span>은행명</span>
                    <input type="text" id="bank" />
                    <button type="reset" class="reset-btn">
                      <img src="${images }/reset.png" class="input-text" />
                    </button>
                  </label>
                
                
                  <label>
                    <span>계좌번호</span>
                    <input type="text" id="bankAcc" class="input-text" />
                    <button type="reset" class="reset-btn">
                      <img src="${images }/reset.png" />
                    </button>
                  </label>
                
              </div>
              <!-- 주소정보 -->
              <div class="sub-title">
                <text>주소</text>
                
                  <label>
                    <span>우편번호</span>
                    <input type="text" id="postcode" class="input-text" />
                    <button type="reset" class="reset-btn">
                      <img src="${images }/reset.png" />
                    </button>
                  </label>
                
                
                  <label>
                    <span>주소</span>
                    <input type="text" id="addr" class="input-text" />
                    <button type="reset" class="reset-btn">
                      <img src="${images }/reset.png" />
                    </button>
                  </label>
                
                
                  <label>
                    <span>세부 주소</span>
                    <input type="text" id="addrDetail" class="input-text" />
                    <button type="reset" class="reset-btn">
                      <img src="${images }/reset.png" />
                    </button>
                  </label>
                
              </div>
              <div style="height: 80px"></div>
            </div>
            <div class="completeBtn">
              <button
                type="button"
                onclick="location.href='javascript:closePop()'"
                class="cancle-btn"
              >
                취소
              </button>
              <button type="submit" class="save-btn">저장</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
