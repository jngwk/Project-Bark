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
        input.classList.remove("required");
      });
      // Check for an empty string instead of null
      if (input.value == "" && input.type != "hidden") {
        input.classList.add("required");
        input.closest("label").classList.add("required");
        valid = false;
      } else if (input.type != "hidden") {
        input.classList.remove("required");
        input.closest("label").classList.remove("required");
      }
    });
    // inputs.forEach((input) => {});
    if (valid) {
      // labels.forEach((label) => {
      //   label.classList.remove("required");
      // });
    	
    	if(btn.classList.contains("login-btn")){
    		login.call(this);
    	}
    	else{
    		btn.closest("form").submit();
    	}

      
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
        input.classList.remove("required");
      });
      // Check for an empty string instead of null
      if (input.value == "" && input.type != "hidden") {
        input.classList.add("required");
        input.closest("label").classList.add("required");
        valid = false;
      } else if (input.type != "hidden") {
        input.classList.remove("required");
        input.closest("label").classList.remove("required");
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


// Bind input events to each class to handle as they are typed into
$(".id-input").on("input", function(e) {
  checkId.call(this, e); // Use `call` to set `this` context correctly for `checkId`
});

// Function to check for duplicate ID
function checkId(e) {
  var id = $(this).val(); // Correctly fetch the value of the input
  var $label = $(this).closest(".popup-label"); // Assuming .popup-label is the container that needs the class changes

  console.log(id); // Log the ID value to ensure it's captured correctly

  $.ajax({
    url: "/user/checkId", // Endpoint to check the ID
    type: "POST", // Use POST method
    data: { id: id }, // Send ID to server
    success: function (cnt) {
      // Based on the response, adjust classes
      if (cnt == 0) {
        // If cnt is 0, ID is available
        $label.removeClass("required duplicate").addClass("available");
      } else {
        // If cnt is 1 or more, ID is duplicate
        $label.removeClass("required available").addClass("duplicate");
      }
    },
    error: function () {
      alert("오류가 발생했습니다."); // Error handling
    },
  });
}

// Confirm password for shelter form
$("#confirm-pwd-shelter").on("input", function() {
    checkPwd("pwd-shelter", "confirm-pwd-shelter");
});

// Confirm password for general form
$("#confirm-pwd-gen").on("input", function() {
    checkPwd("pwd-gen", "confirm-pwd-gen");
});

// Function to check if passwords match
function checkPwd(passwordSelector, confirmPasswordSelector) {
    console.log("Password selector:", passwordSelector, document.getElementById(passwordSelector));
    console.log("Confirm password selector:", confirmPasswordSelector, document.getElementById(confirmPasswordSelector));

    var pwd = document.getElementById(passwordSelector).value || '';
    var pwdCheck = document.getElementById(confirmPasswordSelector).value || '';
    var $label = $("#" + confirmPasswordSelector).closest(".popup-label");
    
    if (pwdCheck !== "") {
        if (pwd === pwdCheck) {
            $label.removeClass("not-match required");
        } else {
            $label.removeClass("required").addClass("not-match");
        }
    } else {
        $label.removeClass("match not-match required"); // Clear all classes if the confirmation password is empty
    }
}

// 로그인 확인
function login(e) {
    var id = $(".login-form").find('input[name="id"]').val(); // Correctly fetch the value of the ID input
    var pwd = $(".login-form").find('input[name="pwd"]').val(); // Fetch the password input value
    var $label = $(".login-form").find('.popup-label').last(); // This might need adjustment based on where you want the label changes to appear
    console.log(id + ", " + pwd);
    $.ajax({
        url: "/user/login/", // Endpoint to check the ID
        type: "post", // Use POST method
        data: { id: id, pwd: pwd }, // Send ID and password to server
        dataType: "json",
        success: function (result) {
            if (result == 0) {
                // If result is 0, login fail
                $label.removeClass("required").addClass("not-user");
            } else if(result == 1) {
                // If result is 1, login success
                $label.removeClass("required not-user");
                window.location.href="/"; // Redirect on successful login
            } else {
                alert('데이터베이스 오류');
            }
        },
        error: function () {
            alert("오류가 발생했습니다."); // Error handling
        },
    });
}

function hasDuplicateClass(labels) {
  labels.forEach((label) => {
    if (label.classList.contains(".duplicate")) {
      return true;
    }
  });
  return false;
}


