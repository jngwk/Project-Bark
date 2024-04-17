<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${css }/root.css" />
    <link rel="stylesheet" href="${css }/dogDetail.css" />
    <script
      src="https://code.jquery.com/jquery-3.7.1.js"
      integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
  <jsp:include page="${views }/include/header.jsp" flush="false"/>
    <div class="dog-desc-container">
      <div class="dog-desc-inner">
        <a href="dog-list.html"
          ><img class="arrow" src="${icons }/arrow-back.png" alt="arrow"
        /></a>
        <div class="summary">
          <div class="img-wrapper">
            <img
              src="https://www.animal.go.kr/files/shelter/2024/03/202404051304148_s.jpg"
              alt=""
              class="dog1-large"
            />
          </div>
          <div class="summary-cont">
            <table>
              <tr>
                <td><img src="${icons }/name.png" alt="icon" /></td>
                <th>이름</th>
                <td>영철이</td>
              </tr>
              <tr>
                <td><img src="${icons }/gender.png" alt="icon" /></td>
                <th>성별</th>
                <td>남</td>
              </tr>
              <tr>
                <td><img src="${icons }/breed.png" alt="icon" /></td>
                <th>견종</th>
                <td>믹스</td>
              </tr>
              <tr>
                <td><img src="${icons }/age.png" alt="icon" /></td>
                <th>나이</th>
                <td>4</td>
              </tr>
              <tr>
                <td><img src="${icons }/shelter.png" alt="icon" /></td>
                <th>보호소</th>
                <td>안산보호소</td>
              </tr>
              <tr>
                <td><img src="${icons }/neut.png" alt="icon" /></td>
                <th>중성화</th>
                <td>O</td>
              </tr>
              <tr>
                <td><img src="${icons }/adopt.png" alt="icon" /></td>
                <th>입양</th>
                <td>가능</td>
              </tr>
            </table>
          </div>
        </div>
        <!-- end of summary -->
        <div class="more">
          <p>
            영철이는 중앙동 거리에서 피부병과 각종 질병등을 보유한 상태로 발견
            보호소에서 다른 강아질과 잘 어울리며 평소에 차분하고 의젓한 모습을
            보입니다. 터그와 공놀이를 좋아하며 활동량이 많은 강아지로 잦은
            산책과 활동을 필요로 합니다. 영철이와 함께 활동적인 생활을 해주실 수
            있는 견주님을 찾습니다.
          </p>
          <button class="large-btn brown-btn expand-btn">입양하기</button>
          <!-- <button class="prev-btn secondary-btn font-bright">목록</button> -->
        </div>
      </div>
    </div>
    <!-- end of dog-desc -->
    <div class="adoption-form">
      <div class="form-container">
        <div class="form-page">
          <form action="#" method="post">
            <img src="${images }/logo-brown.png" />
            <div class="form-title">영철이의 가족이 되어 주세요</div>
            <div class="shelter-info form-section">
              <div class="form-subtitle">보호소 정보</div>
              <table class="form-table">
                <tr>
                  <th>보호소명</th>
                  <td>
                    <input
                      type="text"
                      name="shelterName"
                      value="2조보호소"
                      readonly
                    />
                  </td>
                </tr>
                <tr>
                  <th>전화번호</th>
                  <td>
                    <input
                      type="text"
                      name="shelterNumber"
                      value="02-0000-0000"
                      readonly
                    />
                  </td>
                </tr>
                <tr>
                  <th>주소</th>
                  <td>
                    <input
                      type="text"
                      name="shelterAddr"
                      value="서울특별시 강남구"
                      readonly
                    />
                  </td>
                </tr>
              </table>
            </div>
            <div class="user-info form-section">
              <div class="form-subtitle">기본 정보</div>
              <table class="form-table">
                <tr>
                  <th>이름</th>
                  <td>
                    <input
                      type="text"
                      name="userName"
                      value="김지현"
                      readonly
                    />
                  </td>
                </tr>
                <tr>
                  <th>휴대전화</th>
                  <td>
                    <input
                      type="text"
                      name="userName"
                      value="010-0000-0000"
                      readonly
                    />
                  </td>
                </tr>
                <tr>
                  <th>이메일</th>
                  <td>
                    <input
                      type="text"
                      name="emailName"
                      value="jihyeon2368@naver.com"
                      readonly
                    />
                  </td>
                </tr>
              </table>
            </div>

            <div class="addr-info form-section">
              <div class="form-subtitle">주소 정보</div>
              <table class="form-table">
                <tr>
                  <th>주소</th>
                  <td>
                    <input
                      type="text"
                      name="addr"
                      id="price"
                      maxlength="20"
                    /><a
                      class="addr-search-btn secondary-btn medium-btn"
                      href="#"
                      >검색</a
                    >
                  </td>
                </tr>
                <tr>
                  <th>상세주소</th>
                  <td>
                    <input type="text" name="addrDetail" value="" readonly />
                  </td>
                </tr>
                <tr>
                  <th>우편번호</th>
                  <td>
                    <input type="text" name="postcode" value="" readonly />
                  </td>
                </tr>
                <tr>
                  <td class="consent-checkbox" colspan="2">
                    <input
                      type="checkbox"
                      name="consent"
                      value="consent"
                      id="consent"
                    />
                    <label for="consent">Bark 입양 약관에 동의합니다.</label>
                    <span class="consent-msg">*입양 약관에 동의해주십시오</span>
                  </td>
                </tr>
              </table>
            </div>
            <div class="form-button">
              <input
                class="large-btn brown-btn fold-btn"
                type="button"
                value="취소"
              />
              <input
                class="large-btn secondary-btn inactive submit-adoption-form"
                type="submit"
                value="입양하기"
              />
            </div>
          </form>
        </div>
      </div>
    </div>
    <jsp:include page="${views }/include/footer.jsp" flush="false"/>
    <script src="${js }/dogDetail.js"></script>
  </body>
</html>
