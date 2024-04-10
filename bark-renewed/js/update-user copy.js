function openPop() {
  document.getElementById("popup_layer").style.display = "block";
}

//팝업 닫기
function closePop() {
  document.getElementById("popup_layer").style.display = "none";
}
window.onload = function () {


const hypenTel = (target) => {
  target.value = target.value
    .replace(/[^0-9]/g, "")
    .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
};

const pwdBtn = document.querySelector(".pwd-btn");
pwdBtn.onclick =  function () {
    document.querySelector(".menu").classList.toggle("expand");
  };
}