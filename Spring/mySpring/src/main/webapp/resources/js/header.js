$('.dropdown').hover(
    function() { // Mouse enter
        let dropdownContent = $(this).find('.dropdown-content');
        let height = dropdownContent.outerHeight(); // Get the outer height including padding and border
        $('.header-container').addClass('expand'); // Add 'expand' class only on hover
        dropdownContent.addClass('expand');
        $('.header-container.expand').css('height', 105 + height + 'px'); // Adjust height
    },
    function() { // Mouse leave
    	$(this).find('.dropdown-content').removeClass('expand');
    	$('.header-container.expand').css('height', '');
        $('.header-container').removeClass('expand'); // Remove 'expand' class when not hovering
    }
);

/* 회원 메뉴*/
 // 프로필 드롭 다운
	function menuToggle() {
		const toggleMenu = document.querySelector(".profile-menu");
		toggleMenu.classList.toggle("active");
	}