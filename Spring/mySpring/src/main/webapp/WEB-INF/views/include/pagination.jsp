<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${css }/root.css" />
<link rel="stylesheet" href="${css }/pagination.css" />
<script src="${js }/pagination.js"></script>
</head>
<body id="pagination">
<!-- 페이지넘버 -->
      <div class="pagination">
        <span class="pagination__number-indicator"></span>
        <button class="pagination__arrow pagination-btn" id="prev" onclick="location.href=
        	'/board/noticeList?pageNum=${page.start-2}&amount=10&searchfield=${searchfield}&searchWord=${searchWord}'">
          <span class="pagination__arrow-half"></span>
          <span class="pagination__arrow-half"></span>
        </button>
        <c:forEach var="num" begin="${page.start}" end="${page.end}">
        <c:choose>
        <c:when test="${num eq page.cri.pageNum}">
        	 <button class="pagination__number pagination-btn pagination__number--active " id="btn" onclick="location.href=
				'/board/noticeList?pageNum=${num-1}&amount=10&searchfield=${searchfield}&searchWord=${searchWord}'">${num}</button>
        </c:when>
        <c:otherwise>
        	<button class="pagination__number pagination-btn" id="btn" onclick="location.href=
				'/board/noticeList?pageNum=${num-1}&amount=10&searchfield=${searchfield}&searchWord=${searchWord}'">${num}</button>
        </c:otherwise>
        </c:choose>
        
        <c:if test='${num} == 1'>
			
		</c:if>
        </c:forEach>
        <button class="pagination__arrow pagination__arrow--right pagination-btn"  id="next" onclick="location.href=
        	'/board/noticeList?pageNum=${page.end}&amount=10&searchfield=${searchfield}&searchWord=${searchWord}'">
          <span class="pagination__arrow-half"></span>
          <span class="pagination__arrow-half"></span>
        </button>
      </div>
      
<script>
	
	alert("start-end-prev-next[" + ${page.start} + "-" + ${page.end} + "-" + ${page.prev} + "-" + ${page.next} +"]" + typeof(${page.start}));
	
	if (${page.prev}) {
		document.getElementById('prev').style.display = 'block';
	} else {
		document.getElementById('prev').style.display = 'none';
	}
	
	if (${page.next}) {
		document.getElementById('next').style.display = 'block';
	} else {
		document.getElementById('next').style.display = 'none';
	}
	
/*  	$("#btn").on("click",function() {
		$(this).addClass("pagination__number--active");
	});
 */


</script>
</body>
</html>