// 유저 타입 버튼


//  pw 유효성 체크
//  비밀번호 확인 칸에 focus시 비밀번호 확인칸에도 eventlistener 추가?
function checkPwd(){
	var input = document.forms[0];
	var pwd = input.pwd.value;
	var pwdCheck = input.pwdCheck.value;
	if(pwd!=pwdCheck){
	   document.getElementById('checkPwd').style.color = "red";	//밝은 빨강으로 수정
	   document.getElementById('checkPwd').innerHTML = "비밀번호가 일치하지 않습니다."; 
	}else{
	   document.getElementById('checkPwd').style.color = "green";	//밝은 파랑으로 수정
	   document.getElementById('checkPwd').innerHTML = "비밀번호가 일치합니다.";
	}	  
}
//  id 중복성체크(미완성)
$(document).ready(function() {
	$("#mem_id").blur(function() {
		$.ajax({
			url:"idcheck.jsp",
			type:"post",
			data:{ "mem_id":$("#mem_id").val() },
			success:function( data ){
				if(data.trim() == "YES"){
					$("#checkId").css("color", "green");
					$("#checkId").text("사용할 수 있는 아이디입니다");
				}else{
					$("#checkId").css("color", "red");
					$("#checkId").text("사용할 수 없는 아이디입니다");
					$("#mem_id").val("");
				}
			},
			error:function(){
				alert('error');
			}			
		});
	});
});

// 유저 타입
function check(elem){
	let buttons = document.querySelector(".user-type-select").children;
    // console.log(buttons[0]);
	if(!elem.className.includes("checked")){
		elem.classList.add("checked");
		let userType = document.querySelector(".user-type");
		userType.value = elem.dataset.type;
		// console.log(userType.value);
		if(elem == buttons[0]){
			buttons[1].classList.remove("checked");
		}
		else{
			buttons[0].classList.remove("checked");
		}
	}
}

