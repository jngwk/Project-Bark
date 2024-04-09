window.onload = function () {
  let counter = 0;
  const slides = document.querySelector(".form-slides");
  const imgBtn = document.querySelector(".img__btn");
  const generalBtn = document.querySelector(".general-btn");
  const shelterBtn = document.querySelector(".shelter-btn");
  const nextBtns = document.querySelectorAll(".next-btn");
  const prevBtns = document.querySelectorAll(".prev-btn");
  const openPopBtn = document.querySelector(".open-pop");
  const closePopBtn = document.querySelector(".close-pop");

  //   open or close
  openPopBtn.onclick = openPop;
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
  nextBtns.forEach((btn) => {
    btn.onclick = nextSlide;
  });
  prevBtns.forEach((btn) => {
    btn.onclick = prevSlide;
  });
  imgBtn.addEventListener("transitionend", () => {
    imgBtn.con;
  });

  function nextSlide() {
    counter++;
    slides.style.transform = "translateX(" + -780 * counter + "px)";
  }
  function prevSlide() {
    counter--;
    slides.style.transform = "translateX(" + -780 * counter + "px)";
  }
  function initSlide() {
    imgBtn.addEventListener("transitionend", () => {
      counter = 0;
      slides.style.transform = "translateX(0)";
      document.querySelectorAll("input").forEach((input) => {
        input.value = "";
      });
    });
  }
  function initPop() {
    counter = 0;
    slides.style.transform = "translateX(0)";
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
    nextSlide();
  }
  function showShelterSlides() {
    const shelterSlides = document.querySelectorAll(".shelter-slide");
    shelterSlides.forEach((slide) => {
      slide.style.display = "block";
    });
    nextSlide();
  }
  function openPop() {
    document.getElementById("popup_layer").style.display = "block";
  }
  function closePop() {
    document.getElementById("popup_layer").style.display = "none";
  }
};
