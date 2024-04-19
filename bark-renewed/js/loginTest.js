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
const inputs = document.querySelectorAll(".login-popup-input");

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

inputs.forEach((input) => {
  input.addEventListener("input", () => {
    input.closest(".popup-label").classList.remove("required");
  });
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

// Add event listener to each submit button
submitBtns.forEach((btn) => {
  btn.addEventListener("click", () =>
    handleFormButtonClick(btn, submitButtonAction)
  );
});

// Add event listener to each next button
nextBtns.forEach((btn) => {
  btn.addEventListener("click", () =>
    handleFormButtonClick(btn, nextButtonAction)
  );
});

prevBtns.forEach((btn) => {
  btn.addEventListener("click", () => prevButtonAction(btn));
});

// Utility function to handle form validation and button actions
function handleFormButtonClick(btn, callback) {
  const parentSlide = btn.closest(".form-slide");
  const inputs = parentSlide.querySelectorAll("input");
  let isValid = true;

  inputs.forEach((input) => {
    console.log(input.value); // Debugging log

    const popupLabel = input.closest(".popup-label");
    if (!popupLabel || popupLabel.classList.contains("hide")) {
      return; // Skip this iteration as no related label was found
    }

    // Validate input fields
    if (input.value.trim() === "") {
      input.classList.add("required");
      popupLabel.classList.add("required");
    } else {
      input.classList.remove("required");
      popupLabel.classList.remove("required");
    }
  });

  isValid = checkClass(
    Array.from(parentSlide.querySelectorAll(".popup-label"))
  );
  console.log("isValid: " + isValid);
  // Only proceed if all validations pass
  if (isValid) {
    callback(btn);
  }
}

// Function for handling next button
function nextButtonAction(btn) {
  const parentSlides = btn.closest(".form-slides");
  console.log(parentSlides);
  nextPopupSlide(parentSlides);
}

// Function for handling prev button
function prevButtonAction(btn) {
  const parentSlides = btn.closest(".form-slides");
  console.log(parentSlides);
  prevSlide(parentSlides);
  if (btn.closest(".form-slide").classList.contains("first-slide")) {
    parentSlides.addEventListener(
      "transitionend",
      () => {
        removeAllInput();
        removeAllClassFromLabel();
        hideGeneralForm();
        hideShelterForm();
      },
      { once: true }
    );
  }
}

// Define actions based on button type
function submitButtonAction(btn) {
  if (btn.classList.contains("login-btn")) {
    login.call(btn);
  } else if (btn.classList.contains("find-acc-btn")) {
    findAcc.call(btn);
  } else if (btn.classList.contains("email-verify-btn")) {
    console.log("submitButtonAction");
    if (btn.dataset.stage == "get-code") {
      console.log("Before: getVerificationCode");
      getVerificationCode(btn);
    } else if (btn.dataset.stage == "verify-email") {
      verifyEmail(btn);
    } else {
      join(btn);
    }
  } else {
    btn.closest("form").submit();
  }
}

function checkClass(labels) {
  return !labels.some(
    (label) =>
      $(label).hasClass("required") ||
      $(label).hasClass("invalid") ||
      $(label).hasClass("duplicate") ||
      $(label).hasClass("not-match") ||
      $(label).hasClass("invalid-pwd")
  );
}

function removeAllClassFromLabel() {
  document.querySelectorAll(".popup-label").forEach((label) => {
    $(label).removeClass(
      "required invalid duplicate available not-match match not-user no-acc invalid-pwd valid-pwd"
    );
  });
}

function removeAllInput() {
  document.querySelectorAll(".login-popup-input").forEach((input) => {
    input.value = "";
  });
}

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
    removeAllInput();
    removeAllClassFromLabel();
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
    input.classList.remove("required");
  });
  document.querySelector(".cont").classList.remove("s--signup");
  removeAllClassFromLabel();
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

// Validations from here ------------------------------

// Bind input events to each ".id-input" to handle as they are typed into
$(".id-input").on("input", function (e) {
  checkId.call(this, e); // Use `call` to maintain correct context
});

// Function to check for duplicate ID
function checkId(e) {
  var $input = $(this); // Using jQuery object of the input
  var id = $input.val(); // Fetch the value of the input
  var $label = $input.closest(".popup-label"); // Get the closest label

  if (id.trim() === "") {
    $label.removeClass("invalid available duplicate required"); // Remove all related classes
    console.log("Input cleared.");
    return; // Exit the function early
  }

  console.log(id);

  // Validate the ID locally first
  if (idValidChk($input)) {
    // Pass jQuery object to validation function
    $.ajax({
      url: "/user/checkId", // Endpoint to check the ID
      type: "POST", // Use POST method
      data: { id: id }, // Send ID to server
      success: function (cnt) {
        // Based on the response, adjust classes
        if (cnt == 0) {
          // If cnt is 0, ID is available
          $label.removeClass("required duplicate").addClass("available");
        } else if (cnt > 0) {
          // If cnt is 1 or more, ID is duplicate
          $label.removeClass("required available").addClass("duplicate");
        } else {
          // Handle unexpected values
          $label.removeClass("required available duplicate");
        }
      },
      error: function () {
        alert("오류가 발생했습니다."); // Error handling
      },
    });
  }
}

// Function to check ID validity based on a regex pattern and length
function idValidChk($input) {
  // 영어 또는 숫자만 가능, 영어는 필수
  const pattern = /^(?=.*[A-Za-z])[A-Za-z\d]{4,12}$/; // Regex to check valid ID characters
  const id = $input.val().trim(); // Get the value, trim whitespace
  const $label = $input.closest(".popup-label");

  // 4글자 이상 12글자 이하
  if (!pattern.test(id) || !(id.length >= 4 && id.length <= 12)) {
    console.log("Invalid ID.");
    $label.removeClass("available duplicate").addClass("invalid"); // Adjust classes appropriately
    return false;
  } else {
    console.log("Valid ID.");
    $label.removeClass("invalid"); // Remove invalid class if present
    return true;
  }
}

// Confirm password for shelter form
$("#pwd-shelter").on("input", function () {
  setupPasswordValidation("pwd-shelter", "confirm-pwd-shelter");
});

// Confirm password for general form
$("#pwd-gen").on("input", function () {
  setupPasswordValidation("pwd-gen", "confirm-pwd-gen");
});

function setupPasswordValidation(passwordSelector, confirmPasswordSelector) {
  var pwdInput = document.getElementById(passwordSelector);
  var pwdCheckInput = document.getElementById(confirmPasswordSelector);
  var pwdLabel = $("#" + passwordSelector).closest(".popup-label");
  var pwdCheckLabel = $("#" + confirmPasswordSelector).closest(".popup-label");

  // 최소 8글자 이상이면서, 알파벳과 숫자 및 특수문자(@$!%*#?&)가 하나 이상 포함
  const passwordRegex =
    /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

  function validatePassword() {
    var pwd = pwdInput.value || "";

    // Clear previous states
    pwdLabel.removeClass("invalid-pwd valid-pwd");

    // Check password against the regex pattern
    if (!passwordRegex.test(pwd)) {
      console.log("Password does not meet security requirements.");
      pwdLabel.addClass("invalid-pwd");
    } else {
      console.log("Password meets security requirements.");
      pwdLabel.addClass("valid-pwd");
    }

    // Validate the match as well, as the password rules might have changed
    validatePasswordMatch();
  }

  function validatePasswordMatch() {
    var pwd = pwdInput.value || "";
    var pwdCheck = pwdCheckInput.value || "";

    // Clear previous states
    pwdCheckLabel.removeClass("not-match match");

    // Check if passwords match
    if (pwdCheck !== "") {
      // Only compare if the confirm password is not empty
      if (pwd === pwdCheck) {
        console.log("Passwords match.");
        pwdCheckLabel.addClass("match").removeClass("not-match");
      } else {
        console.log("Passwords do not match.");
        pwdCheckLabel.addClass("not-match").removeClass("match");
      }
    }
  }

  // Attach event listeners to both inputs for appropriate validation
  pwdInput.addEventListener("input", validatePassword);
  pwdCheckInput.addEventListener("input", validatePasswordMatch);
}

// 로그인 확인
function login(e) {
  var id = $(".login-form").find('input[name="id"]').val(); // Correctly fetch the value of the ID input
  var pwd = $(".login-form").find('input[name="pwd"]').val(); // Fetch the password input value
  var $label = $(".login-form").find(".popup-label").last(); // This might need adjustment based on where you want the label changes to appear
  console.log(id + ", " + pwd);
  $.ajax({
    url: "/user/login/", // Endpoint to check the ID
    type: "post", // Use POST method
    data: { id: id, pwd: pwd }, // Send ID and password to server
    dataType: "json",
    success: function (result) {
      console.log(result);
      if (result == 0) {
        // If result is 0, wrong id
        $label.removeClass("required").addClass("not-user");
      } else if (result == 1) {
        // If result is 1, login success
        $label.removeClass("required not-user");
        window.location.href = "/"; // Redirect on successful login
      } else if (result == -1) {
        // If result is 0, wrong pwd
        $label.removeClass("required").addClass("not-user");
      } else {
        alert("데이터베이스 오류");
      }
    },
    error: function () {
      alert("오류가 발생했습니다."); // Error handling
    },
  });
}

// 이메일 유효성
$("input[name='email']").on("input", function () {
  emailValidChk($(this)); // Pass the jQuery object itself
});

function emailValidChk($input) {
  const pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  const email = $input.val().trim(); // Get the value, trim whitespace
  const $label = $input.closest(".popup-label");

  console.log(email); // Log the cleaned email address

  $label.removeClass("required invalid");

  if (email !== "") {
    if (!pattern.test(email)) {
      console.log("Invalid email address.");
      $label.addClass("invalid");
    } else {
      console.log("Valid email address.");
    }
  }
}

// 이메일 인증번호 받기 (미완)
function getVerificationCode(btn) {
  const parentSlide = $(btn).closest(".form-slide");
  const $label = parentSlide.find(".verify-label");
  const $emailInput = parentSlide.find("input[name='email']");
  // TODO 코드 보내기
  console.log("계정 찾기: 이메일 전송하기");
  // Slide label down and show
  $label.removeClass("hide").addClass("show");
  // Change button text
  btn.innerText = "인증하기";
  btn.dataset.stage = "verify-email";

  // Event listener on email input using jQuery
  $emailInput.on(
    "input",
    function () {
      $label.removeClass("show").addClass("hide");
      $(btn).off("click"); // Remove event listener using jQuery
      $(btn).text("이메일 인증"); // Change button text using jQuery
      btn.dataset.stage = "get-code";
    },
    { once: true }
  );
}
// 이메일 인증하기 (미완)
function verifyEmail(btn) {
  // TODO 코드 받아오기 Ajax?
  const verficationCode = "1111";
  const parentSlide = $(btn).closest(".form-slide");
  const $label = parentSlide.find(".verify-label");
  const $codeInput = parentSlide.find("input[name='code']");
  const $emailInput = parentSlide.find("input[name='email']");
  console.log("테스팅용 코드: " + verficationCode);
  $label.removeClass("pending");

  // match
  if (verficationCode == $codeInput.val()) {
    console.log("code match");
    $(btn).text("가입하기");
    btn.dataset.stage = "join";
    $label.removeClass("wrong-code").addClass("valid-code");
    $emailInput.prop("readOnly", true);
    $codeInput.prop("readOnly", true);
  }
  // no-match
  else {
    $label.removeClass("");
    $label.addClass("wrong-code");
  }
}

// 회원가입 (미완)
function join(btn) {
  var parentSlides = btn.closest(".form-slides");
  console.log($(btn).closest("form").serialize());
  $.ajax({
    type: "POST",
    url: "/user/join",
    data: $(btn).closest("form").serialize(),
    success: function (result) {
      // show slide
      if (result == true) {
        nextPopupSlide(parentSlides);
      } else {
        alert("데이터베이스 오류");
      }
    },
  });
}

// 계정 찾기 (미완)
function findAcc() {
  var name = $(".find-acc-form").find('input[name="name"]').val();
  var email = $(".find-acc-form").find('input[name="email"]').val();
  var $label = $(".find-acc-form").find(".popup-label").last();
  console.log(name + ", " + email);
  $.ajax({
    url: "/user/findAcc", // Endpoint to check the ID
    type: "post", // Use POST method
    data: { name: name, email: email }, // Send ID and password to server
    dataType: "json",
    success: function (result) {
      if (result == 0) {
        // If result is 0, no account
        $label.removeClass("required").addClass("no-acc");
      } else if (result == 1) {
        // If result is 1, send email
        $label.removeClass("required no-acc");
        console.log("계정 찾기: 이메일 전송하기");
      } else {
        alert("데이터베이스 오류");
      }
    },
    error: function () {
      alert("오류가 발생했습니다."); // Error handling
    },
  });
}

// 회원정보 수정 ajax
