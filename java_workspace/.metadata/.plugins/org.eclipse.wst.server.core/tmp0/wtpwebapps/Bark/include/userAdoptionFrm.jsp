<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${contextPath }/css/userAdoptionFrm.css">
</head>
<body>
	<div class="container">
        <div class="adoption-title"><h1>입양 신청서</h1></div>
		<div class="adoption">
            <form action="#" method="post" class="adoption-form">
                <div class="firstform">
                    <table>
                        <tbody>
                            <tr>
                                <td>강아지 이름</td>
                                <td>강철이</td>
                                <td>보호소명</td>
                                <td>2조보호소</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div><h>*신청자 정보</h></div>
                <div class="secondform">
                    <table>
                        <tbody>
                            <tr >
                                <td>성명</td>
                                <td><input type="text" name="name" required></td>
                                <td>주소</td>
                                <td><input type="text" name="addr" required></td>
                            </tr>
                            <tr >
                                <td>생년월일</td>
                                <td><input type="date" name="date" required></td>
                                <td>연락처</td>
                                <td><input type="tel" name="tel" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"></td>
                            </tr>
                            <tr >
                                <td>직업</td>
                                <td><input type="text" name="jop"></td>
                                <td>e-mail</td>
                                <td><input type="email" name="email" required></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div><h>*본인 신청 여부 : 본인<input type="radio" name="check"value="1" checked>대리인<input type="radio" name="check"value="2"></h></div>
                <div><h>*동거인 동의</h></div>
                <div class="thirdform">
                    <table>
                        <tbody>
                            <tr>
                                <td>성명</td>
                                <td><input type="text" name="name"></td>
                                <td>관계</td>
                                <td><input type="text" name="relationship"></td>
                                <td>연락처</td>
                                <td><input type="tel" name="tel" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"></td>
                                <td>동의</td>
                                <td><select name="consent">
                                    <option value="1">X</option>
                                    <option value="0">O</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>성명</td>
                                <td><input type="text" name="name"></td>
                                <td>관계</td>
                                <td><input type="text" name="relationship"></td>
                                <td>연락처</td>
                                <td><input type="tel" name="tel" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"></td>
                                <td>동의</td>
                                <td><select name="consent">
                                    <option value="1">X</option>
                                    <option value="0">O</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>성명</td>
                                <td><input type="text" name="name"></td>
                                <td>관계</td>
                                <td><input type="text" name="relationship"></td>
                                <td>연락처</td>
                                <td><input type="tel" name="tel" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"></td>
                                <td>동의</td>
                                <td><select name="consent">
                                    <option value="1">X</option>
                                    <option value="0">O</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="adoption-text">
                    <p>*Bark의 입양 안내사항을 성실히 이행할 것을 서약하며,</p>
                    <p>학대 •파양 등의 정황이 발견 될 시 불이익이 있을 수 있습니다.</p>
                    <h3>Bark는 올바른 입양 문화를 지향합니다.</h3>
                </div>
                <div class="adoption-button">
                <input type="button" value="취소" id="cancel">
                <input type="submit" value="신청" id="result">
                </div>
			</form>
		</div>
	</div>
</body>
</html>