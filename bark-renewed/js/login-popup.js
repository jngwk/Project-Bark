window.onload = function () {
    document
      .querySelector(".img__btn")
      .addEventListener("click", function () {
        document.querySelector(".cont").classList.toggle("s--signup");
      });
      const slides = document.querySelector(".form-slides");
      let counter = 0;
      const imgBtn = document.querySelector(".img__btn");
      const generalBtn = document.querySelector(".general-btn");
      const shelterBtn = document.querySelector(".shelter-btn");
      const nextBtns = document.querySelectorAll(".next-btn");
      const prevBtns = document.querySelectorAll(".prev-btn");
      //   onclick
      imgBtn.onclick = initSlide;
      //   shelter btn 구분
      generalBtn.onclick = hideShelterSlides;
      shelterBtn.onclick = showShelterSlides;
      nextBtns.forEach((btn) => {
        btn.onclick = nextSlide;
      });
      prevBtns.forEach((btn) => {
        btn.onclick = prevSlide;
      })
      
    

      function nextSlide(){
        counter ++;
        slides.style.transform = "translateX(" + (-780 * counter) + "px)";
      }
      function prevSlide(){
        counter --;
        slides.style.transform = "translateX(" + (-780 * counter) + "px)";
      }
      function initSlide(){
        imgBtn.addEventListener("transitionend", () => {
            counter = 0;
            slides.style.transform = "translateX(0)";
            document.querySelectorAll("input").forEach((input) => {
                input.value = "";
            })
        })
      }
      function hideShelterSlides(){
        const shelterSlides = document.querySelectorAll(".shelter-slide");
        shelterSlides.forEach((slide) => {
            slide.style.display = "none";
        });
        nextSlide();
      }
      function showShelterSlides(){
        const shelterSlides = document.querySelectorAll(".shelter-slide");
        shelterSlides.forEach((slide) => {
            slide.style.display = "block";
        });
        nextSlide();
      }
  };