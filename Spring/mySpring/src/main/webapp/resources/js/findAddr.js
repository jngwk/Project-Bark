function findAddr(){
        new daum.Postcode({
            oncomplete: function(data) {

                var addr = '';  //주소 변수
                var extraAddr = ''; //참고항목 변수

                if(data.userSelecetedType == 'R'){  // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else {    //  사용자가 지번 주소를 선택했을 경우
                    addr = data.jibunAddress;
                }

                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("addr").value = addr;
                document.getElementById("addrDetail").focus();
            }
        }).open();
    }