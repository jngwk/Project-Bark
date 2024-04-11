window.onload = function () {
	/*로그인 팝업*/
  let counter = 0;
  let slideWidth = 0;
  const allSlides = document.querySelectorAll(".form-slides");
  const contSlides = allSlides[0];
  const subContSlides = allSlides[1];
  const imgBtn = document.querySelector(".img__btn");
  const generalBtn = document.querySelector(".general-btn");
  const shelterBtn = document.querySelector(".shelter-btn");
  const nextBtns = document.querySelectorAll(".next-btn");
  const prevBtns = document.querySelectorAll(".prev-btn");
  const openPopBtn = document.querySelector(".open-pop");
  const closePopBtn = document.querySelector(".close-pop");
  const findAccountBtn = document.querySelector(".forgot-id-pwd");
  const loginPrevBtn = document.querySelector(".login-prev-btn");
  //   open or close
  openPopBtn.addEventListener("click", (event) => {
    event.preventDefault();
    openPop();
  });
  closePopBtn.onclick = () => {
    closePop();
    initPop();
  };

  imgBtn.addEventListener("click", function () {
    document.querySelector(".cont").classList.toggle("s--signup");
    initSlide();
  });
  //   shelter btn 구분
  generalBtn.onclick = hideShelterSlides;
  shelterBtn.onclick = showShelterSlides;
  findAccountBtn.addEventListener("click", () => {
    nextSlide(contSlides);
  });
  loginPrevBtn.addEventListener("click", () => {
    prevSlide(contSlides);
  });
  nextBtns.forEach((btn) => {
    btn.addEventListener("click", () => {
      nextSlide(subContSlides);
    });
  });
  prevBtns.forEach((btn) => {
    btn.addEventListener("click", () => {
      prevSlide(subContSlides);
    });
  });
  // imgBtn.addEventListener("transitionend", () => {
  //   imgBtn.con;
  // });

  function getWidth() {
    return document.querySelector(".form-slide").clientWidth;
  }
  function nextSlide(slides) {
    slideWidth = getWidth();
    counter++;
    slides.style.transform = "translateX(" + (0 - slideWidth) * counter + "px)";
  }
  function prevSlide(slides) {
    slideWidth = getWidth();
    counter--;
    slides.style.transform = "translateX(" + (0 - slideWidth) * counter + "px)";
  }
  function initSlide() {
    imgBtn.addEventListener("transitionend", () => {
      counter = 0;
      allSlides.forEach((slides) => {
        slides.style.transform = "translateX(0)";
      });
      document.querySelectorAll("input").forEach((input) => {
        input.value = "";
      });
    });
  }
  function initPop() {
    counter = 0;
    allSlides.forEach((slides) => {
      slides.style.transform = "translateX(0)";
    });
    document.querySelectorAll("input").forEach((input) => {
      input.value = "";
    });
    document.querySelector(".cont").classList.remove("s--signup");
  }
  function hideShelterSlides() {
    const shelterSlides = document.querySelectorAll(".shelter-slide");
    shelterSlides.forEach((slide) => {
      slide.style.display = "none";
    });
    nextSlide(subContSlides);
  }
  function showShelterSlides() {
    const shelterSlides = document.querySelectorAll(".shelter-slide");
    shelterSlides.forEach((slide) => {
      slide.style.display = "block";
    });
    nextSlide(subContSlides);
  }
  function openPop() {
    document.getElementById("popup_layer").style.display = "block";
  }
  function closePop() {
    document.getElementById("popup_layer").style.display = "none";
  }
  
  /* -------------- */
  
  /* 슬라이더 */
      const slider = document.querySelector(".slider");
    const slides = document.querySelectorAll(".container");
    let current = 0;
    let cycling = true;
    let allowShift = true;
    const nextBtn = document.querySelector(".slider-btn");

    nextBtn.addEventListener("click", nextSlide);

    function nextSlide() {
      slides.forEach((slide) => {
        slide.classList.remove("active");
      });
      if (allowShift == true) {
        current++;
        if (current >= slides.length) {
          current = 0;
        }
        slides[current].classList.add("active");
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
        nextSlide();
      }, 120 * 1000); // Change image
    }
    
    
   

};
/* 회원 메뉴*/
 // 프로필 드롭 다운
	function menuToggle() {
		const toggleMenu = document.querySelector(".profile-menu");
		toggleMenu.classList.toggle("active");
	}
