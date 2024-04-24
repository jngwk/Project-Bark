<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/campaign.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/root.css" />

</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp" flush="false"></jsp:include>
	<div class="story-container">
		<div class="story">
			<p class="page-title">Campaign</p><p class="page-subtitle">[캠페인 둘러보기]</p>
			<div class="story-button">
				<a class="large-btn green-btn" onclick="writebtn();">글쓰기</a>
			</div>
			<ul>
				<div class="story-list">
				<c:forEach var="bList" items="${bList}" >
					<li><a href="/donation/read?bno=${bList.bno}&pageNum=${page.cri.pageNum}&amount=${page.cri.amount}">
						<div class="story-card">
							<div class="story-banner">
								<img class="banner-img" src="${bList.uploadPath}/${bList.fileName}" />
							</div>
							<div class="story-title xlarge-font">
								<p>${bList.title}</p> 
							</div>
							<div class="story-info">
								<div class="story-content">
									<p><pre>${bList.content}</pre></p>
								</div>
								<div class="story-write">
									<p>
										<img class="icon-img" src="${icons}/shelter-icon.png" />${bList.shelterName}
									</p>
								</div>
								<div class="sub-info">
									<div class="story-date xsmall-font">
										<p>
											<img class="icon-img" src="${icons}/calendar-icon.png" /><fmt:formatDate pattern="yyyy-MM-dd" value="${bList.regDate}" />
										</p>
									</div>
									<div class="story-hit xsmall-font">
										<p>
											<img class="icon-img" src="${icons}/hit-icon.png" /><fmt:formatNumber type="number" maxFractionDigits="3" value="${bList.hit}" />
										</p>
									</div>
								</div>
							</div>
						</div>
					</a></li>
				</c:forEach>	
				</div>
			</ul>
		</div>
	<!-- 페이지넘버 -->
	<jsp:include page="${views }/include/pagination.jsp" flush="false" />
	<jsp:include page="${views }/include/footer.jsp" flush="false"></jsp:include>
	<script src="${js }/campaign.js"></script>
<script>
let idValue ='<%=(String)session.getAttribute("userId")%>';	// 접속자 id

function writebtn() {
 	
	//alert(idValue.length);
	if (idValue == null || idValue  == "null") {
		alert("로그인 후 글쓰기 가능합니다.");
		return;		

	} 
	window.location.href = "/donation/write";

}
</script>
</body>
</html>
