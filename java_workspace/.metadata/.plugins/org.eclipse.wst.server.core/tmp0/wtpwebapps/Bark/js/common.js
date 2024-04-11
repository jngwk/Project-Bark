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
