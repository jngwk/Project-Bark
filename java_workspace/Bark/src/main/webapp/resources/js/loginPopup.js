  let counter = 0;
  let slideWidth = 0;
  const allPopupSlides = document.querySelectorAll(".form-slides");
  const contSlides = allPopupSlides[0];
  const subContSlides = allPopupSlides[1];
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
  if(openPopBtn != null){
	openPopBtn.addEventListener("click", (event) => {
    event.preventDefault();
    openPop();
  });
  }
  
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
    nextPopupSlide(contSlides);
  });
  loginPrevBtn.addEventListener("click", () => {
    prevSlide(contSlides);
  });
  nextBtns.forEach((btn) => {
    btn.addEventListener("click", () => {
      nextPopupSlide(subContSlides);
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
  function nextPopupSlide(slides) {
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
      allPopupSlides.forEach((slides) => {
        slides.style.transform = "translateX(0)";
      });
      document.querySelectorAll("input").forEach((input) => {
        input.value = "";
      });
    });
  }
  function initPop() {
    counter = 0;
    allPopupSlides.forEach((slides) => {
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
    nextPopupSlide(subContSlides);
  }
  function showShelterSlides() {
    const shelterSlides = document.querySelectorAll(".shelter-slide");
    shelterSlides.forEach((slide) => {
      slide.style.display = "block";
    });
    nextPopupSlide(subContSlides);
  }
  function openPop() {
    document.getElementById("popup_layer").style.display = "block";
  }
  function closePop() {
    document.getElementById("popup_layer").style.display = "none";
  }
