window.onload = function () {
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