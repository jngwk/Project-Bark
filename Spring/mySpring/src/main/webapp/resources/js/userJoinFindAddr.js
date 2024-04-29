var element_layer = document.getElementById("join-layer");

function closeDaumPostcode() {
  element_layer.style.display = "none";
}

function findAddrInJoin() {
  new daum.Postcode({
    oncomplete: function (data) {
      var addr = ""; //주소 변수
      var extraAddr = ""; //참고항목 변수

      if (data.userSelecetedType == "R") {
        // 사용자가 도로명 주소를 선택했을 경우
        addr = data.roadAddress;
      } else {
        //  사용자가 지번 주소를 선택했을 경우
        addr = data.jibunAddress;
      }
      console.log(addr);
      // document.getElementById('postcode').value = data.zonecode;
      document.getElementById("join-addr").value = addr;
      document.getElementById("join-addrDetail").focus();
      element_layer.style.display = "none";
      console.log(document.getElementById("update-addr").value);
    },
    width: "100%",
    height: "100%",
    maxSuggestItems: 5,
  }).embed(element_layer);

  element_layer.style.display = "block";

  initLayerPosition();
}

function initLayerPosition() {
  var width = 400; //우편번호서비스가 들어갈 element의 width
  var height = 500; //우편번호서비스가 들어갈 element의 height
  var borderWidth = 3; //샘플에서 사용하는 border의 두께

  // 위에서 선언한 값들을 실제 element에 넣음
  element_layer.style.width = width + "px";
  element_layer.style.height = height + "px";
  element_layer.style.border = borderWidth + "px solid var(--color-brown)";

  // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산
  element_layer.style.left =
    ((window.innerWidth || document.documentElement.clientWidth) - width) / 2 -
    borderWidth +
    "px";
  element_layer.style.top =
    ((window.innerHeight || document.documentElement.clientHeight) - height) /
      2 -
    borderWidth +
    "px";
}
