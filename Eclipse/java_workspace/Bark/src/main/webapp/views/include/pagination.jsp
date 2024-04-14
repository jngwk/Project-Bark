<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <button class="pagination__arrow pagination-btn">
          <span class="pagination__arrow-half"></span>
          <span class="pagination__arrow-half"></span>
        </button>
        <button class="pagination__number pagination-btn">1</button>
        <button class="pagination__number pagination-btn">2</button>
        <button class="pagination__number pagination-btn">3</button>
        <button class="pagination__number pagination__number--active pagination-btn">4</button>
        <button class="pagination__number pagination-btn">5</button>
        <button class="pagination__number pagination-btn">6</button>
        <button class="pagination__number pagination-btn">7</button>
        <button class="pagination__arrow pagination__arrow--right pagination-btn">
          <span class="pagination__arrow-half"></span>
          <span class="pagination__arrow-half"></span>
        </button>
      </div>
</body>
</html>