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
const submitBtns = document.querySelectorAll(".submit-btn");
const openPopBtn = document.querySelector(".open-pop");
const closePopBtn = document.querySelector(".close-pop");
const findAccountBtn = document.querySelector(".forgot-id-pwd");
const loginPrevBtn = document.querySelector(".login-prev-btn");
const generalForm = document.querySelector(".general-form");
const shelterForm = document.querySelector(".shelter-form");

//   open or close
if (openPopBtn != null) {
  openPopBtn.addEventListener("click", (event) => {
    document.querySelector("body").classList.add("noscroll");
    event.preventDefault();
    openPop();
  });
}

closePopBtn.onclick = () => {
  document.querySelector("body").classList.remove("noscroll");
  closePop();
  initPop();
};

imgBtn.addEventListener("click", function () {
  document.querySelector(".cont").classList.toggle("s--signup");
  initSlide();
});
//   shelter btn 구분
generalBtn.addEventListener("click", () => {
  showGeneralForm();
  nextPopupSlide(subContSlides);
});
shelterBtn.addEventListener("click", () => {
  showShelterForm();
  nextPopupSlide(subContSlides);
});
findAccountBtn.addEventListener("click", () => {
  nextPopupSlide(contSlides);
});
loginPrevBtn.addEventListener("click", () => {
  prevSlide(contSlides);
});
submitBtns.forEach((btn) => {
  btn.addEventListener("click", () => {
    let valid = true;
    const parentSlide = btn.closest(".form-slide");
    const inputs = Array.from(parentSlide.getElementsByTagName("input"));
    const labels = Array.from(parentSlide.getElementsByTagName("label"));
    // Convert HTMLCollection to array to use forEach
    inputs.forEach((input) => {
      console.log(input.value);
      input.addEventListener("animationend", () => {
        input.classList.remove("invalid");
      });
      // Check for an empty string instead of null
      if (input.value == "" && input.type != "hidden") {
        input.classList.add("invalid");
        input.closest("label").classList.add("invalid");
        valid = false;
      } else if (input.type != "hidden") {
        input.classList.remove("invalid");
        input.closest("label").classList.remove("invalid");
      }
    });
    // inputs.forEach((input) => {});
    if (valid) {
      // labels.forEach((label) => {
      //   label.classList.remove("invalid");
      // });
      btn.closest("form").submit();
    }
  });
});
nextBtns.forEach((btn) => {
  btn.addEventListener("click", () => {
    let valid = true;
    const parentSlide = btn.closest(".form-slide");
    console.log(parentSlide);
    const inputs = Array.from(parentSlide.getElementsByTagName("input"));
    console.log(inputs);
    const labels = Array.from(parentSlide.getElementsByTagName("label"));
    console.log(labels);
    // Convert HTMLCollection to array to use forEach
    inputs.forEach((input) => {
      console.log(input.value);
      input.addEventListener("animationend", () => {
        input.classList.remove("invalid");
      });
      // Check for an empty string instead of null
      if (input.value == "" && input.type != "hidden") {
        input.classList.add("invalid");
        input.closest("label").classList.add("invalid");
        valid = false;
      } else if (input.type != "hidden") {
        input.classList.remove("invalid");
        input.closest("label").classList.remove("invalid");
      }
    });
    if (valid) {
      nextPopupSlide(subContSlides);
    }
  });
});
prevBtns.forEach((btn) => {
  btn.addEventListener("click", () => {
    prevSlide(subContSlides);
    if (btn.closest("div").classList.contains("first-slide")) {
      btn.closest(".form-slides").addEventListener(
        "transitionend",
        () => {
          hideGeneralForm();
          hideShelterForm();
        },
        { once: true }
      );
    }
  });
});

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
    document.querySelectorAll(".login-popup-input").forEach((input) => {
      input.value = "";
    });
    hideGeneralForm();
    hideShelterForm();
  });
}
function initPop() {
  counter = 0;
  allPopupSlides.forEach((slides) => {
    slides.style.transform = "translateX(0)";
  });
  document.querySelectorAll(".login-popup-input").forEach((input) => {
    input.value = "";
  });
  document.querySelector(".cont").classList.remove("s--signup");
  hideGeneralForm();
  hideShelterForm();
}
function showGeneralForm() {
  generalForm.style.display = "flex";
}
function hideGeneralForm() {
  generalForm.style.display = "none";
}
function showShelterForm() {
  shelterForm.style.display = "flex";
}
function hideShelterForm() {
  shelterForm.style.display = "none";
}
function openPop() {
  document.getElementById("popup_layer").style.display = "block";
}
function closePop() {
  document.getElementById("popup_layer").style.display = "none";
}

// 중복성 검사
var idChk = 0;
function checkId() {
  var id = $("#id").val(); //id값이 "inputId"인 입력란의 값을 저장
  $.ajax({
    url: "idCheck",
    type: "post",
    data: id,
    dataType: "json", //서버로 돌려받는 값의 타입 지정
    //서버로 보낼 데이터 설정
    contentType: "application/json; charset=utf-8",
    success: function (data) {
      //컨트롤러에서 넘어온 result값을 받음
      if (data.result == 0) {
        alert("아이디가 존재합니다. 다른 아이디를 입력해 주세요");
        $(".chk-btn").addClass("has-error");
        $(".chk-btn").removeClass("has-success");
        $("#id").focus();
      } else {
        alert("사용가능한 아이디입니다");
        $(".chk-btn").addClass("has-success");
        $(".chk-btn").removeClass("has-error");
        $("#inputPwd").focus();
        idChk = 1;
      }
    },
    error: function (error) {
      alert("아이디를 다시 입력해 주세요");
    },
  });
}
