  /* 슬라이더 */
    const heroSlides = document.querySelectorAll(".container");
    let current = 0;
    let cycling = true;
    let allowShift = true;
    const nextHeroBtn = document.querySelector(".slider-btn");

    nextHeroBtn.addEventListener("click", nextHeroSlide);

    function nextHeroSlide() {
      heroSlides.forEach((slide) => {
        slide.classList.remove("active");
      });
      if (allowShift == true) {
        current++;
        if (current >= heroSlides.length) {
          current = 0;
        }
        heroSlides[current].classList.add("active");
        allowShift = false;
      }
      //   console.log(current);
      updateCurrent();
    }

    function updateCurrent() {
      allowShift = true;
    }

    // Initialize slider
    function init() {
      updateCurrent(); // Set first slide

      if (cycling) {
        startCycling();
      }
    }

    init();

    // Autoplay
    function startCycling() {
      interval = setInterval(() => {
        nextHeroSlide();
      }, 120 * 1000); // Change image
    }

/* 회원 메뉴*/
 // 프로필 드롭 다운
	function menuToggle() {
		const toggleMenu = document.querySelector(".profile-menu");
		toggleMenu.classList.toggle("active");
	}
