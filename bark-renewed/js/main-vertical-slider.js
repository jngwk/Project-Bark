window.onload = function () {
  // Slider container
  const slider = document.querySelector(".slider");

  // All slides
  const slides = document.querySelectorAll(".container");

  // Active slide index
  let current = 0;

  // Boolean for cycling state
  let cycling = true;

  // Boolean for allowing shifting
  let allowShift = true;

  // slide width
  const slideHeight = slides[0].offsetHeight;

  // Next button
  const nextButton = document.querySelector(".slider-btn");

  //clone slides
  const firstClone = slides[0].cloneNode(true);
  const lastClone = slides[slides.length - 1].cloneNode(true);

  firstClone.id = "first-clone";
  lastClone.id = "last-clone";

  slider.append(firstClone);
  slider.prepend(lastClone);

  // add transition end event listener
  slider.addEventListener("transitionend", updateCurrent);

  // Update current slide
  function updateCurrent() {
    slider.classList.remove("shifting");
    if (current >= slides.length) {
      slider.style.top = -(1 * slideHeight) + "px";
      current = 0; // Reset to start
    }
    allowShift = true;
  }

  // Next slide
  function nextSlide() {
    slider.classList.add("shifting");
    let posInitial = slider.offsetTop;
    if (allowShift) {
      slider.style.top = posInitial - slideHeight + "px";
      current++;
    }
    allowShift = false;
  }

  // Initialize slider
  function init() {
    updateCurrent(); // Set first slide

    if (cycling) {
      startCycling();
    }
  }

  init();

  // Next button click
  nextButton.addEventListener("click", () => {
    nextSlide();
  });

  // Autoplay
  function startCycling() {
    interval = setInterval(() => {
      nextSlide();
    }, 50000); // Change image
  }
};
