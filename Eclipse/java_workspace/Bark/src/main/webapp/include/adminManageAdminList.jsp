<%@page import="dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>  
    <link rel="stylesheet" href="${contextPath }/css/adminManageAdminList.css" />
  </head>
  <body>
    <div class="container">
      <div class="row">
        <h2>관리자 계정</h2>

        <div class="table-top">
          <form action="#" class="table-search-form">
            <select name="notice_category">
              <option>---선택---</option>
              <option value="1">이름</option>
              <option value="1">아이디</option>
            </select>
            <input type="search" class="search-bar" />
            <input type="submit" class="search-btn" value="검색" />
          </form>

          <div class="create-account-btn"><a href="#">계정 생성</a></div>
        </div>

        <div class="table">
          <table class="admin-table">
            <thead>
              <tr>
                <th>No</th>
                <th>아이디</th>
                <th>이름</th>
                <th>생성일자</th>
              </tr>
            </thead>
            <tbody>
            <%
            	UserDAO dao = new UserDAO(application);
            	List<UserDTO> uList = dao.getAdminList();
            	pageContext.setAttribute("uList", uList);
            	
            %>
            	<c:forEach items="${uList }" var="user">
            	<c:set var="count" value="1"/>
            		<tr>
            		<td>
            			${count }
            			<c:set var="count" value="${count+1}"/>
            		</td>
            		<td>
            			<a href="${contextPath }/index.jsp?target=include/adminEditUser&id=${user.id}">${user.id }</a>
            		</td>
            		<td>
            			${user.name }
            		</td>
            		<td>
            			${user.regDate }
            		</td>
            	</tr>
            	</c:forEach>
            </tbody>
          </table>
        </div>

        <div class="page-number">
          <a href="#"><</a>
          <a href="#">1</a>
          <a href="#">2</a>
          <a href="#">3</a>
          <a href="#">></a>
        </div>
      </div>
    </div>
  </body>
</html>
