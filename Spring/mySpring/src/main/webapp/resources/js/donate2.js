<script th:inline="javascript">

  function kg_request_pay() {
    //전달할 데이터
    var selectedGoodsName = document.querySelector(".kg_pay_btn").getAttribute("data-name");
    var selectedGoodsPrice = document.querySelector(".kg_pay_btn").getAttribute("data-price");
    var selectedGoodsNum = document.querySelector(".kg_pay_btn").getAttribute("data-goodsnum");


    //금액이 입력되지 않은 경우 알림창 띄움
    if(selectedGoodsPrice == null){
      alert("금액을 입력해주세요.");
      return;
    }

    //kg이니시스 결제 API
    var IMP = window.IMP; // 생략가능
    IMP.init("imp60737432");  // 가맹점 식별코드

    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({
      pg: "html5_inicis",
      pay_method: "card",
      merchant_uid: "gpay_" + new Date().getTime(),   // 주문번호
      name: [[${gym.gname}]] +" "+ selectedGoodsName,
      amount: selectedGoodsPrice,                         // 숫자 타입
      buyer_email: [[${user.email}]],
      buyer_name: [[${user.name}]],
      buyer_tel: [[${user.phone}]]
    }, function (rsp) { // callback
      console.log(rsp);
      if ( rsp.success ) { //결제 성공시
        var msg = '결제가 완료되었습니다.';
        var result = {
          "mpaynum" : rsp.merchant_uid, //결제번호
          "membernum" :[[${member.membernum}]], //회원번호
          "mpaymethod":rsp.pay_method, //결제수단
          "mpayprice":rsp.paid_amount, // 결제금액
          "mpaydate" : new Date().toISOString().slice(0, 10), //결제일
          "mpaytime" : "",
        }
        console.log(result);

        $.ajax({
          url:'insertMPay',
          type:'POST',
          contentType: 'application/json',
          data:JSON.stringify(result),
          success: function (res) {
            console.log(res);
            location.href=res;
          },
          error: function (err) {
            console.log(err);
          }
        }); //ajax
      } else {
          var msg = '결제 실패';
          msg += '\n에러내용 : ' + rsp.error_msg;
        }
      alert(msg);
    });
  }

    //결제 데이터 전달
    var selectedPrice = element.querySelector("p").innerText;
    var priceElement = document.getElementById("selectedPrice").querySelector("span");
    priceElement.innerText = selectedPrice;

    var selectedProduct = element.querySelector("h5").innerText;
    var productElement = document.getElementById("selectedProduct").querySelector("span");
    productElement.innerText = selectedProduct;

    // 선택된 상품 정보 가져오기(상품명, 금액)
    var selectedGoodsName = element.getAttribute("data-goodsname");
    var selectedGoodsPrice = element.getAttribute("data-goodsprice");
    var selectedGoodsNum = element.getAttribute("data-goodsnum");

    //kg 이니시스
    var nameElement = document.querySelector(".kg_pay_btn");
    nameElement.setAttribute("data-name", selectedGoodsName);
    nameElement.setAttribute("data-price", selectedGoodsPrice);
    nameElement.setAttribute("data-goodsnum", selectedGoodsNum);
  }
</script>