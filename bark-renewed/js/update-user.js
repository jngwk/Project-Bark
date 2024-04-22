function openUpdatePop() {
  getUser();
  document.getElementById("update-popup-layer").style.display = "block";
  document.querySelector("body").classList.add("noscroll");
}

//팝업 닫기
function closeUpdatePop() {
  document.getElementById("update-popup-layer").style.display = "none";
  document.querySelector("body").classList.remove("noscroll");
}

const hyphenTel = (target) => {
  // Ensure target is a valid element and has a value property
  if (target && "value" in target) {
    // Only process modifications if the input is not empty to avoid unnecessary processing
    if (target.value.trim() !== "") {
      target.value = target.value
        .replace(/[^0-9]/g, "") // Remove all non-digits
        .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`); // Format with hyphens
    }
  } else {
    console.error("Invalid target or missing value property");
  }
};

const pwdBtn = document.querySelector(".pwd-btn");
pwdBtn.onclick = function () {
  document.querySelector(".pwd-mainmenu").classList.toggle("expand");
  document.querySelector(".update-popupbox").classList.toggle("expand");
};

// 리셋버튼
let inputText = document.querySelectorAll(".input-text");
let resetBtns = document.querySelectorAll(".reset-btn");
resetBtns.forEach(function (btn) {
  btn.addEventListener("click", function () {
    $(btn).prev().val("");
  });
});

inputText.forEach((input) => {
  if (!$(input).hasClass("verify-btn")) {
    input.addEventListener("keyup", function () {
      if (input.value == "") {
        input.nextElementSibling.style.visibility = "hidden";
      } else if (input.value != "") {
        input.nextElementSibling.style.visibility = "visible";
      }
      input.nextElementSibling.onclick = function () {
        this.style.visibility = "hidden";
        $(input)
          .closest("label")
          .removeClass(
            "invalid available-email duplicate-email wrong-pwd not-match match"
          );
      };
    });
  }
});

$(".update-content")
  .find("input[name='email']")
  .on("input", function () {
    emailValidChkOnUpdate($(this)); // Pass the jQuery object itself
  });

function emailValidChkOnUpdate($input) {
  const pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  const email = $input.val().trim(); // Get the value, trim whitespace
  const $label = $input.closest("label");

  // console.log(email); // Log the cleaned email address

  $label.removeClass("required invalid");

  if (email !== "") {
    if (!pattern.test(email)) {
      // console.log("Invalid email address.");
      $label.addClass("invalid");
    } else {
      // console.log("Valid email address.");
    }
  }
}
// 이메일 중복 검사
function checkDuplicateEmailOnUpdate($input) {
  var email = $input.val();
  var $label = $input.closest("label");
  console.log(email);

  if (email.trim() === "") {
    $label.removeClass("invalid available-email duplicate-email required"); // Remove all related classes
    // console.log("Input cleared.");
    return; // Exit the function early
  }

  $.ajax({
    url: "/user/checkEmail", // Endpoint to check the email
    type: "post", // Use POST method
    data: { email: email }, // Send email to server
    dataType: "json",
    success: function (result) {
      console.log("result: " + result);
      console.log("userEmail: " + userEmail);
      console.log("email: " + email);
      if (result == 0) {
        // If result is 0, no account
        $label
          .removeClass("required duplicate-email")
          .addClass("available-email");
      } else if (result == 1) {
        // If result is 1, email exists
        if (email === userEmail) {
          $label.removeClass(
            "invalid available-email duplicate-email required"
          );
        } else {
          $label.removeClass("required available").addClass("duplicate-email");
        }
      } else {
        alert("데이터베이스 오류");
      }
    },
    error: function () {
      alert("오류가 발생했습니다."); // Error handling
    },
  });
}

function sendCode(btn) {
  $(".verify-label").addClass("show");
}

// password
$("#after-pwd").on("input", function () {
  setupPasswordValidation("after-pwd", "after-pwd-confirm");
});
function setupPasswordValidation(passwordSelector, confirmPasswordSelector) {
  var pwdInput = document.getElementById(passwordSelector);
  var pwdCheckInput = document.getElementById(confirmPasswordSelector);
  var pwdLabel = $("#" + passwordSelector).closest("label");
  var pwdCheckLabel = $("#" + confirmPasswordSelector).closest("label");

  // 최소 8글자 이상이면서, 알파벳과 숫자 및 특수문자(@$!%*#?&)가 하나 이상 포함
  const passwordRegex =
    /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

  function validatePassword() {
    var pwd = pwdInput.value || "";

    // Clear previous states
    pwdLabel.removeClass("invalid-pwd valid-pwd");

    // Check password against the regex pattern
    if (!passwordRegex.test(pwd)) {
      // console.log("Password does not meet security requirements.");
      pwdLabel.addClass("invalid-pwd");
    } else {
      // console.log("Password meets security requirements.");
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
        // console.log("Passwords match.");
        pwdCheckLabel.addClass("match").removeClass("not-match");
      } else {
        // console.log("Passwords do not match.");
        pwdCheckLabel.addClass("not-match").removeClass("match");
      }
    }
  }

  // Attach event listeners to both inputs for appropriate validation
  pwdInput.addEventListener("input", validatePassword);
  pwdCheckInput.addEventListener("input", validatePasswordMatch);
}

$("#before-pwd").on("input", checkPwd($("#before-pwd")));
function checkPwd($input) {
  console.log($input.val());
  if (userPwd !== $input.val().trim()) {
    $input.closest(".label").addClass("wrong-pwd");
  } else {
    $input.closest(".label").removeClass("wrong-pwd");
  }
}
