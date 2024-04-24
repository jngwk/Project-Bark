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
        <button class="pagination__arrow pagination-btn" id="prev" onclick="showPrev();">
          <span class="pagination__arrow-half"></span>
          <span class="pagination__arrow-half"></span>
        </button>
        <c:forEach var="num" begin="${page.start}" end="${page.end}">
        <c:choose>
        <c:when test="${num eq page.cri.pageNum}">
        	 <button class="pagination__number pagination-btn pagination__number--active " data-num="${num}" onclick="showNum(this)">${num}</button>
        </c:when>
        <c:otherwise>
        	<button class="pagination__number pagination-btn" data-num="${num}" onclick="showNum(this)">${num}</button>
        </c:otherwise>
        </c:choose>
        
        <c:if test='${num} == 1'>
			
		</c:if>
        </c:forEach>
        <button class="pagination__arrow pagination__arrow--right pagination-btn"  id="next" onclick="showNext()">
          <span class="pagination__arrow-half"></span>
          <span class="pagination__arrow-half"></span>
        </button>
      </div>
      
<script>
	
	//alert("KYW 확인용[" + ${page.start} + "-" + ${page.end} + "-" + ${page.prev} + "-" + ${page.next} +"]\n["
	//		+ ${page.cri.pageNum} + "-" + ${page.cri.amount} + "]");

			
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
	
	
	let pageNumPrev = '<c:out value="${page.start-1}"/>'; 
	let pageNumNext = '<c:out value="${page.end+1}"/>';
	let amount= '<c:out value="${page.cri.amount}"/>';

	let searchField = '<c:out value="${page.cri.searchField}"/>';
 	let searchWord = '<c:out value="${page.cri.searchWord}"/>';
 	
 	
	function  showPrev() {
		window.location.href='/adoption/list?pageNum=' + pageNumPrev + '&amount=' + amount + '&searchField=' + searchField + '&searchWord=' + searchWord ;
	 
	}
	
	function  showNum(obj) {

		let num=$(obj).data("num");
		window.location.href='/adoption/list?pageNum=' + num + '&amount=' + amount + '&searchField=' + searchField + '&searchWord=' + searchWord ;
        
	}


	function  showNext() {
		
		window.location.href='/adoption/list?pageNum=' + pageNumNext + '&amount=' + amount + '&searchField=' + searchField + '&searchWord=' + searchWord ;
 
			
		}
</script>
</body>
</html>