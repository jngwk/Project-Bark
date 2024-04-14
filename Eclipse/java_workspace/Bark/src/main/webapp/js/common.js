// 스크롤시 뒷 배경 blur
document.addEventListener("scroll", function(){
	let nav = document.querySelectorAll(".nav-scroll");
	nav.forEach(function(element){
		if(window.scrollY != 0)
			element.classList.add("scrolled");
		if(window.scrollY == 0)
			element.classList.remove("scrolled");
	})
});

/* 회원 메뉴*/
 // 프로필 드롭 다운
	function menuToggle() {
		const toggleMenu = document.querySelector(".profile-menu");
		toggleMenu.classList.toggle("active");
	}