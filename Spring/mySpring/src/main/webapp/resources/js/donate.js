IMP.init("imp60737432");


const name = document.querySelector("#donorName");
const phone = document.querySelector("#donorPhone");
const email = document.querySelector("#donorEmail");

const form = document.querySelector("#paymentForm");
const Amount = document.querySelector("#paymentAmount");

document.getElementById("donateButton").addEventListener("click", onClickPay);

async function onClickPay(event) {
	event.preventDefault();
		
	const donorName = name.value;
	const donorPhone = phone.value;
	const donorEmail = email.value;

	const selectPG = form.pg.value;
	const selectAmount = Amount.value;
	
	
	IMP.request_pay({
		pg:selectPG,
		pay_method: "card",
		amount: "10000", 
		name: "후원",
		merchant_uid: "ORD20240430-10010",
		buyer_email: "card",
		buyer_name: "card",
		buyer_phone: "card"
	
	}, function(response){ // 아래부터는 결제후 자동으로 호출 상태에 따른 다른기능 구현 
		const { status, err_msg } = response;
		if (err_msg){
			alert(err_msg); // 결제가 에러일시 메세지 출력
		}
		if ( status === "paid"){
			const { imp_uid } = response;
			verifyPayment(imp_uid); // 결제완료시 , imp_uid //donation 테이블의 state 상태 변경
		}
	});
};

form.addEventListener("submit",onClickPay);