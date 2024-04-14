<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1.0">
<link rel="stylesheet" href="../css/bootstrap.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
<style>
.btn-transparent {
    background: transparent;
    border: none;
}
.dropdown-toggle::after {
    display: none;
}
.bi-bell-fill {
color: rgb(48, 40, 25); /* 종 모양 RGB 색상 입력 */
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="dropdown">
        <button class="btn btn-transparent dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-bell-fill"></i>
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <li><a class="dropdown-item" href="#">알림 1</a></li>
            <li><a class="dropdown-item" href="#">알림 2</a></li>
            <li><a class="dropdown-item" href="#">알림 3</a></li>
                <li><hr class="dropdown-divider"></li>
    	<li><a class="dropdown-item" href="#">Action four</a></li>
        </ul>
    </div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>