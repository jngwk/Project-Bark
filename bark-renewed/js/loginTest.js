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
    if (hasDuplicateClass(labels)) {
      valid = false;
    }
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

$(".id-input").each((input) => {
  input.on("input", checkId(this));
});

// 중복성 검사
function checkId() {
  var id = $(this).val(); //id값이 "id"인 입력란의 값을 저장
  var $label = $(this).closest(".popup-label");
  console.log($(this).val());
  $.ajax({
    url: "/user/checkId", //Controller에서 요청 받을 주소
    type: "post", //POST 방식으로 전달
    data: { id: id },
    success: function (cnt) {
      //컨트롤러에서 넘어온 cnt값을 받는다
      if (cnt == 0) {
        //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디
        $label.removeClass("invalid");
        $label.removeClass("duplicate");
        $label.addClass("available");
      } else {
        // cnt가 1일 경우 -> 이미 존재하는 아이디
        $label.removeClass("invalid");
        $label.removeClass("available");
        $label.addClass("duplicate");
      }
    },
    error: function () {
      alert("오류가 발생했습니다.");
    },
  });
}

// Confirm password for shelter form
$("#confirm-pwd-shelter").on("keyup", function () {
  checkPwd("pwd-shelter", "confirm-pwd-shelter");
});

// Confirm password for general form
$("#confirm-pwd-gen").on("keyup", function () {
  checkPwd("pwd-gen", "confirm-pwd-gen");
});

// Function to check if passwords match
function checkPwd(passwordSelector, confirmPasswordSelector) {
  var pwd = document.getElementById(passwordSelector).value || "";
  var pwdCheck = document.getElementById(confirmPasswordSelector).value || "";
  var $label = $("#" + confirmPasswordSelector).closest(".popup-label");

  if (pwdCheck !== "") {
    // Only check if there is something in the confirmation password input
    if (pwd === pwdCheck) {
      $label.removeClass("not-match invalid").addClass("match");
    } else {
      $label.removeClass("match").addClass("not-match");
    }
  } else {
    $label.removeClass("match not-match invalid"); // Clear all classes if the confirmation password is empty
  }
}

function login(e) {
  var $form = $(this).closest(".form-slide"); // Get the closest parent that groups the inputs
  var id = $form.find('input[name="id"]').val(); // Correctly fetch the value of the ID input
  var pwd = $form.find('input[name="pwd"]').val(); // Fetch the password input value
  var $label = $form.find(".popup-label").last(); // This might need adjustment based on where you want the label changes to appear
  console.log(id + ", " + pwd);
  $.ajax({
    url: "/user/login", // Endpoint to check the ID
    type: "POST", // Use POST method
    data: { id: id, pwd: pwd }, // Send ID and password to server
    success: function (result) {
      if (result == 0) {
        // If result is 0, login fail
        $label.removeClass("invalid").addClass("not-user");
      } else if (result == 1) {
        // If result is 1, login success
        $label.removeClass("invalid not-user");
        window.location.href = "/"; // Redirect on successful login
      } else {
        alert("데이터베이스 오류");
      }
    },
    error: function () {
      alert("오류가 발생했습니다."); // Error handling
    },
  });
}
