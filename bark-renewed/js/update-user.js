function openUpdatePop() {
  document.getElementById("update-popup-layer").style.display = "block";
  document.querySelector("body").classList.add("noscroll");
}

//팝업 닫기
function closeUpdatePop() {
  document.getElementById("update-popup-layer").style.display = "none";
  document.querySelector("body").classList.remove("noscroll");
}

const hypenTel = (target) => {
  target.value = target.value
    .replace(/[^0-9]/g, "")
    .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
};

const pwdBtn = document.querySelector(".pwd-btn");
pwdBtn.onclick = function () {
  document.querySelector(".pwd-mainmenu").classList.toggle("expand");
};

// 리셋버튼
let inputText = document.querySelectorAll(".input-text");
let resetBtn = document.querySelectorAll(".reset-btn");
inputText.forEach((input) => {
  input.addEventListener("keyup", function () {
    if (input.value == "") {
      input.nextElementSibling.style.visibility = "hidden";
    } else if (input.value != "") {
      input.nextElementSibling.style.visibility = "visible";
    }
    input.nextElementSibling.onclick = function () {
      this.style.visibility = "hidden";
    };
  });
});
