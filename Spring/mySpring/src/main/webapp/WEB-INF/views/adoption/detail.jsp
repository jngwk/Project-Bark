<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/root.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dogDetail.css" />
    <script
      src="https://code.jquery.com/jquery-3.7.1.js"
      integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp" flush="false"/>
    <div class="dog-desc-container">
    <p class="page-title">Detail</p><p class="page-subtitle">[상세보기]</p>
      <div class="dog-desc-inner">
        <a href="${contextPath }/adoption/list"
          ><img class="arrow" src="${icons }/arrow-back.png" alt="arrow"
        /></a>
        <div class="summary">
          <div class="img-wrapper">
            <img
              src="${dog.imgUrl }"
              alt=""
              class="dog1-large"
            />
          </div>
          <div class="summary-cont">
            <table>
              <tr>
                <td><img src="${icons }/name.png" alt="icon" /></td>
                <th>이름</th>
                <td>
                	<c:choose>
					    <c:when test="${not empty dog.name}">
						    ${dog.name}
						</c:when>
						<c:otherwise>
						    이름없음
						</c:otherwise>
					</c:choose>
				</td>
              </tr>
              <tr>
                <td><img src="${icons }/gender.png" alt="icon" /></td>
                <th>성별</th>
                <td>
                	<c:choose>
					    <c:when test="${dog.gender eq 'M'}">
					        남
					    </c:when>
					    <c:when test="${dog.gender eq 'F'}">
					        여
					    </c:when>
					</c:choose>
				</td>
              </tr>
              <tr>
                <td><img src="${icons }/breed.png" alt="icon" /></td>
                <th>견종</th>
                <td>${dog.breed}</td>
              </tr>
              <tr>
                <td><img src="${icons }/age.png" alt="icon" /></td>
                <th>나이</th>
                <td>${dog.age}</td>
              </tr>
              <tr>
                <td><img src="${icons }/shelter.png" alt="icon" /></td>
                <th>보호소</th>
                <td>${dog.shelterName}</td>
              </tr>
              <tr>
                <td><img src="${icons }/neut.png" alt="icon" /></td>
                <th>중성화</th>
                <td>
                	<c:choose>
					    <c:when test="${dog.neuter == 0}">
					        O
					    </c:when>
					    <c:when test="${dog.neuter == 1}">
					        X
					    </c:when>
					</c:choose>
			    </td>
              </tr>
              <tr>
                <td><img src="${icons }/adopt.png" alt="icon" /></td>
                <th>입양</th>
                <td>
                	<c:choose>
					    <c:when test="${dog.available == 0}">
					        입양불가
					    </c:when>
					    <c:when test="${dog.available == 1}">
					        입양가능
					    </c:when>
					</c:choose>
				</td>	
              </tr>
            </table>
          </div>
        </div>
        <!-- end of summary -->
        <div class="more">
          <p>
          	${dog.feature}
<!--           	<br>
            영철이는 중앙동 거리에서 피부병과 각종 질병등을 보유한 상태로 발견
            보호소에서 다른 강아질과 잘 어울리며 평소에 차분하고 의젓한 모습을
            보입니다. 터그와 공놀이를 좋아하며 활동량이 많은 강아지로 잦은
            산책과 활동을 필요로 합니다. 영철이와 함께 활동적인 생활을 해주실 수
            있는 견주님을 찾습니다. 
          </p> -->
          <c:if test="${userType == 1 || userType == 3 }">
          	<button class="large-btn brown-btn expand-btn">입양하기</button>
          <!-- <button class="prev-btn secondary-btn font-bright">목록</button> -->
          </c:if>
        </div>
      </div>
    </div>
    <!-- end of dog-desc -->
    <div class="adoption-form">
      <div class="form-container">
        <div class="form-page">
          <form action="/adoption/adoptionWrite" method="post">
            <img src="${images }/logo-brown.png" />
            <!-- <div class="form-title">영철이의 가족이 되어 주세요</div> -->
            
            <div class="shelter-info form-section">
              <div >&nbsp;<br>&nbsp;<br>&nbsp;</div>
              <div class="form-subtitle">보호소 정보</div>
              <table class="form-table">
                <tr>
                  <th>보호소명</th>
                  <td>
                    <input
                      type="text"
                      name="shelterName"
                      value="${dog.shelterName}"
                      readonly
                    />
                  </td>
                </tr>
                <tr>
                  <th>전화번호</th>
                  <td>
                    <input
                      type="text"
                      name="careTel"
                      value="${dog.careTel}"
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
                      value="${dog.shelterAddr}"
                      readonly
                    />
                    <input type="hidden"  name="dogno"  value="${dog.dogno}" />
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
                      name="name"
                      value="${user.name}"
                      readonly
                    />
                  </td>
                </tr>
                <tr>
                  <th>휴대전화</th>
                  <td>
                    <input
                      type="text"
                      name="phone"
                      value="${user.phone }"
                      readonly
                    />
                  </td>
                </tr>
                <tr>
                  <th>이메일</th>
                  <td>
                    <input
                      type="text"
                      name="email"
                      value="${user.email }"
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
                      id="addr"
                      maxlength="20"
                    /><a
                      class="addr-search-btn secondary-btn medium-btn"
                     type="button" onclick="findAddr()"
                      >검색</a
                    >
                    <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="width:40px;cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
					</div>
                  </td>
                </tr>
                <tr>
                  <th>상세주소</th>
                  <td>
                    <input type="text" name="addrDetail" id="addrDetail" value=""/>
                  </td>
                </tr>
                <!-- <tr>
                  <th>우편번호</th>
                  <td>
                    <input type="text" name="postcode" id="postcode" value="" readonly />
                  </td>
                </tr> -->
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
                <!-- onClick="location.href=/adoption/adoptionWrite" -->

            </div>
          </form>
        </div>
      </div>
    </div>
    <jsp:include page="${views }/include/footer.jsp" flush="false"/>
    <script src="${js }/dogDetail.js"></script>
    <script src="${js }/findAddr.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  </body>
</html>

