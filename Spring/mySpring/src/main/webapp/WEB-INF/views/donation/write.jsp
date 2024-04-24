<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/write.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/root.css" />
<script src="${pageContext.request.contextPath}/resources/js/write.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>


	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp" flush="false" />



	<div class="board-write">
		<div class="board-write-inner">
			<div class="category-container">
				<div class="write-category">
					<div class="category-title">
						<p>게시판</p>
					</div>
					<div class="category-menu">
						<div class="menu-notice">
							<p>
								<img src="${icons }/board-icon.png" />공지사항
							</p>
						</div>
						<div class="menu-shelter">
							<p>보호소 이야기</p>
						</div>
						<div class="menu-share">
							<p>정보공유</p>
						</div>
						<div class="menu-qna">
							<p>문의하기</p>
						</div>
					</div>
				</div>
			</div>
			<div class="write-container">
				<div class="write-board">
					<div class="write-title">
						<p>캠페인 쓰기</p>
					</div>
					<div class="write-read">
						<form role='form' method="post" action="/donation/write" name="WriteForm">
							<div class="form-bg">
								<table class="write-table">
									<thead>
										<tr>
											<th>제목</th>
											<th><input type="text" id="Title" name="title" maxlength="50" /></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="textarea" colspan="3"><textarea
													placeholder="내용을 작성하세요." id="Content" name="Content" maxlength="2048"></textarea>
											</td>
										</tr>
									</tbody>
								</table>
								 
								<div class="write-imgUpload">
									<!-- <input class="upload-name" value="첨부파일" placeholder="첨부파일" readonly /> --> 
									<label for="uploadFile" class="secondary-btn"  >파일찾기</label>
									<input type="file"  name='uploadFile' id='uploadFile'  multiple />
								</div>
								<div class="uploadResult">
									<ul></ul>
								</div>
								<div class="card-footer d-flex">
								</div>
							</div>
							<div class="write-button">
								<input type="button" data-ico="->" 
									value="취소" class="btn brown-btn large-btn"  /> <input
									data-ico="->" type="submit" value="작성 완료"
									class="btn brown-btn large-btn" id="write-button" />
								<input type="hidden" name="id" value="<%=(String)session.getAttribute("userId")%>" />

							</div>
						</form>
						<div class="bigPictureWrapper">
									<div class="bigPicture"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="${views }/include/footer.jsp" flush="false" />
<script>


let formObj=$("form[role='form']");
$("input[type='submit']").on("click", function(e) {
	e.preventDefault();
	
//	alert("들어왔니??");
	let WriteForm = document.WriteForm;
//	alert("들어왔니??2222");
	let Title = $("#Title").val();
//	alert("들어왔니??3333");
	let Content = $("#Content").val();

//	alert("aaa[" + Content +"]");
//	alert(Content);

	if (Title == null || Title == "" || Title.length < 0 ) {
		alert("제목을 입력하세요.");
		e.preventDefault();
		Title.focus();
		return;
	}

	if (Content == null || Content == "" || Content.length < 0 ) {
		alert("내용을 입력하세요.");
		e.preventDefault();
		Content.focus();
		return;
	}  
	
	
	console.log("submit clicked");
	let str="";
	$(".uploadResult ul li").each(function(i, obj) {
		var obj = $(obj);
		console.dir(obj); 
		str += `<input type='hidden' name='attachList[\${i}].fileName' value='\${obj.data("filename")}'>
			<input type='hidden' name='attachList[\${i}].uuid' value='\${obj.data("uuid")}'>
			<input type='hidden' name='attachList[\${i}].uploadPath' value='\${obj.data("path")}'>
			<input type='hidden' name='attachList[\${i}].fileType' value='\${obj.data("type")}'>`;
	});
	
	formObj.append(str).submit();


});

$("input[type='button']").on("click", function(e) {
	
	history.back();
});


//$(document).ready(function() {
/*
	let formObj=$("form[role='form']");
	$("button[type='submit']").on("click", function(e) {
		e.preventDefault();
		console.log("submit clicked");
		let str="";
		$(".uploadResult ul li").each(function(i, obj) {
			var obj = $(obj);
			console.dir(obj); 
			str += `<input type='hidden' name='attachList[\${i}].fileName' value='\${obj.data("filename")}'>
				<input type='hidden' name='attachList[\${i}].uuid' value='\${obj.data("uuid")}'>
				<input type='hidden' name='attachList[\${i}].uploadPath' value='\${obj.data("path")}'>
				<input type='hidden' name='attachList[\${i}].fileType' value='\${obj.data("type")}'>`;
		});
		
		formObj.append(str).submit();
	});
*/	
	$(document).on('input', '#uploadFile', function() {

		let formData = new FormData();
		let inputFile = $("input[name='uploadFile']");
		let files = inputFile[0].files;
		console.log(files);
		let cloneObj = $(".uploadDiv").clone();
		for(let i=0; i<files.length; i++) {
			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		console.log("files.length : " + files.length);
		$.ajax({
			url:'/uploadAjaxAction',
			processData: false, // 전달할 데이터를 query string을 만들지 말것
			contentType: false,
			data:formData, //전달할 데이터
			type:'POST',
			success: function(result){
				// alert('Uploaded');
				console.log(result);
				showUploadedFile(result);
				$(".uploadDiv").html(cloneObj.html());

			}
		});
	});
	
	let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	let	maxSize = 25242880;
	function checkExtension(fileName, fileSize) {
		if (fileSize >= maxSize) {
			alert("파일 크기 초가");
			return false;
		}
		if (regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	let uploadResult = $(".uploadResult ul");
	function showUploadedFile(uploadResultArr) {
		
		if (!uploadResultArr||uploadResultArr.length==0) {
			return;
		}
		let str = "";
		$(uploadResultArr).each(function(i, item) {
			if	(!item.fileType) {
				
				let filePath = item.uploadPath + "/" + item.uuid + "_" + item.fileName;
				filePath = filePath.replace(new RegExp(/\\/g), "/");
				console.log('filePath : ', filePath);
				str +=`<li data-path='\${item.uploadPath}' data-uuid='\${item.uuid}' 
				data-filename='\${item.fileName}' data-type='\${item.fileType}'>
				<a href='/download?fileName=\${filePath}'>
				<img src="/resources/images/File-explorer_36762.png" style="width:20px;">\${item.fileName}</a>
				<span data-file='\${filePath}' data-type="file">X</span></li>`;
			} else {
				let filePath =item.uploadPath + "/s_" + item.uuid + "_" + item.fileName;
				let originPath =item.uploadPath + "/" + item.uuid + "_" + item.fileName;
				filePath = filePath.replace(new RegExp(/\\/g),"/"); //폴더 구분자인 경우 '/'로 통일
			    originPath = originPath.replace(new RegExp(/\\/g),"/"); //폴더 구분자인 경우 '/'로 통일
				console.log('originPath : ', originPath);
				str +=`<li data-path='\${item.uploadPath}' data-uuid='\${item.uuid}' 
				data-filename='\${item.fileName}' data-type='\${item.fileType}'>
				<a href="#" onclick="showImage('\${originPath}'); return false;">
				<img src='/display?fileName=\${filePath}'></a>
				<span data-file='\${filePath}' data-type="image">X</li>`;
			}
		});
		console.log('showUploadedFile end');
		uploadResult.append(str);
		
	}
	
	
	
	
	
	
	function showImage(filePath) {
		//alert(filePath);

 		console.log('filePath : ', filePath);
		$(".bigPictureWrapper").css("display", "flex").show();
		$(".bigPicture")
		.html(`<img src='/display?fileName=\${filePath}'>`)
		.animate({width:'100%', height:'100%'}, 1000 ); 
		
		$(".bigPictureWrapper").on("click", function(e){
		$(".bigPicture").animate({width: '0%', height:'0%'}, 1000);
		setTimeout(function(){
		     $('.bigPictureWrapper').hide();
			}, 1000);
		}); //bigPictureWrapper click
		
	}
	
	
	$(".uploadResult").on("click", "span", function(e){
		let targetFile = $(this).data("file");
		let type = $(this).data("type");
		let targetLi = $(this).closest("li");
		console.log(targetFile);
		$.ajax({
			url:'/deleteFile',
			data: {fileName:targetFile, type:type},
			dataType: 'text',
			type:'POST',
			success: function(result){
				alert('Delete');
				//console.log(result);
				targetLi.remove()
			}
		});
	});
	
//});


</script>
</body>
</html>