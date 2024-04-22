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
  if (target && 'value' in target) {
    // Only process modifications if the input is not empty to avoid unnecessary processing
    if (target.value.trim() !== "") {
      target.value = target.value
        .replace(/[^0-9]/g, "")  // Remove all non-digits
        .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);  // Format with hyphens
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
resetBtns.forEach(function(btn){
	btn.addEventListener("click", function(){
		$(btn).prev().val("");
	})
})
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