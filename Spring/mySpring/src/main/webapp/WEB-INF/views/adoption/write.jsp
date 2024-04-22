<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">등록 페이지</h1>
		<p class="mb-4"></p>
		<form role="form"
			action="${pageContext.request.contextPath}/dog/write" method="post">
			
			<div class="form-group">
				<label>보호소 이름</label>
				<input class="form-control" name='shelterId'>
			</div>
			
			<div class="form-group">
				<label>강아지 이름</label>
				<input class="form-control" name='name'>
			</div>
			
			<div class="form-group">
				<label>성별</label><input class="form-control" name='gender'>
			</div>
			<div class="form-group">
				<label>견종</label><input class="form-control" name='breed'>
			</div>
			<div class="form-group">
				<label>나이</label><input class="form-control" name='age'>
			</div>

			<div class="form-group">
				<label>상세설명</label>
				<textarea class="form-control" rows="5" name='desc'></textarea>
			</div>
			
			<div class="form-group">
			    <label>중성화 여부</label><br>
			    <input type="radio" id="neutered" name="neuter" value="1">
			    <label for="neutered">완료</label><br>
			    <input type="radio" id="notNeutered" name="neuter" value="0">
			    <label for="notNeutered">X</label>
			</div>
			<div class="card" style="width: 100%;">
							<div class="card-header ">File Attach</div>
							<div class="card-body">
								<div class="form-group uploadDiv">
									<input type="file" name='uploadFile' id='uploadFile' multiple>
								</div>
								<div class="uploadResult">
									<ul></ul>
								</div>
								<div class="bigPictureWrapper">
									<div class="bigPicture"></div>
								</div>
							</div>
						<div class="card-footer d-flex">
							<button type="submit" class="btn btn-success ml-auto">Submit</button>
							<button type="reset" class="btn btn-warning ml-2">Reset</button>
						</div>
						
		</form>
		<!-- /.container-fluid -->
		<jsp:include page="${views }/include/footer.jsp" flush="false"/>
	<script>
$(document).ready(function() {
	let formObj=$("form[role='form']");
	$("button[type='submit']").on("click", function(e){
	   e.preventDefault();
	   console.log("submit clicked");
	   let str="";
	   $(".uploadResult ul li").each(function(i, obj){
	       var obj = $(obj);
	       console.dir(obj);
	       str += `<input type='hidden' name='attachList[\${i}].fileName' value='\${obj.data("filename")}'>
	       <input type='hidden' name='attachList[\${i}].uuid' value='\${obj.data("uuid")}'>
	       <input type='hidden' name='attachList[\${i}].uploadPath' value='\${obj.data("path")}'>
	       <input type='hidden' name='attachList[\${i}].fileType' value='\${obj.data("type")}'>`;   });
	   formObj.append(str).submit();

	}); //sumbit button event


	var regex = new RegExp("(.*?)\.(jpg|png|gif)$");
	var maxSize = 5242880; 
	function checkExtension(fileName, fileSize){
	   if(fileSize>=maxSize){
	      alert("파일 크기 초과");
	    return false;
	   }
	   if(!regex.test(fileName)){
	      alert("jpg,gif,png 형식만 등록 가능합니다");
	      return false;
	    }
	   return true;
	}

	
	$(document).on('input','#uploadFile', function (){
	      var formData = new FormData();
	      var inputFile=$("input[name='uploadFile']");
	      var files = inputFile[0].files;
	      console.log(files);
	      
	      let cloneObj=$(".uploadDiv").clone(); 
	    //업로드 전에 <input type='file'>객체가 포함된 <div> 복사
	      
	 	 //add filedata to formdata
		   for(var i=0; i< files.length; i++){
			    if(!checkExtension(files[i].name, files[i].size)){
			        return false;
			    }
		      formData.append("uploadFile", files[i]);
		   }
		   console.log("files.length : "+files.length);
		   $.ajax({
		      url:'/DogUploadAjaxAction', 
		      processData: false, //전달할 데이터를 query string을 만들지 말 것
		      contentType: false,
		      data: formData,  //전달할 데이터
		      type: 'POST',
		      success: function(result){
		       //  alert('Uploaded');
		         console.log(result);
		         showUploadedFile(result);
		         $(".uploadDiv").html(cloneObj.html());

		      }
		   }); //$.ajax
	    });
	//썸네일 표시 부분
	   let uploadResult = $(".uploadResult ul");
	   function showUploadedFile(uploadResultArr){

		   if(!uploadResultArr|| uploadResultArr.length==0){return;}
	      let str ="";
	      $(uploadResultArr).each(function(i, item){
			   if(!item.fileType){ //이미지가 아닌 경우
				   //  str += `<li><img  src='/resources/images/attach.png'>\${item.fileName}</li>`;
				   let filePath = item.uploadPath+ "/"+ item.uuid+ "_"+ item.fileName;
				   filePath = filePath.replace(new RegExp(/\\/g),"/"); //폴더 구분자인 경우 '/'로 통일
				//   str += `<li><a href='/download?fileName=\${filePath}'><img src='/resources/images/attach.png'>\${item.fileName}</a>
				//	   <span data-file='\${filePath}' data-type='file'>x</span></li>`;
				   str += `<li data-path='\${item.uploadPath}' data-uuid='\${item.uuid}' data-filename='\${item.fileName}' data-type='\${item.fileType}'><a href='/dogdownload?fileName=\${filePath}'><img src='/resources/images/attach.png'>\${item.fileName}</a>
					   <span data-file='\${filePath}' data-type='file'>x</span></li>`;


				   }
				   else{  					   
					  // str += `<li>\${item.fileName}</li>`;  
					    let filePath = item.uploadPath+ "/s_"+ item.uuid+ "_"+ item.fileName;
					    let originPath = item.uploadPath+ "/"+ item.uuid+ "_"+ item.fileName;
					    filePath = filePath.replace(new RegExp(/\\/g),"/"); //폴더 구분자인 경우 '/'로 통일
					    originPath = originPath.replace(new RegExp(/\\/g),"/"); //폴더 구분자인 경우 '/'로 통일
					    console.log('originPath : ', originPath);
					    //str += `<li><a href="#" onclick="showImage('\${originPath}'); return false;"><img src='/display?fileName=\${filePath}'></a></li>`;
					 //   str += `<li><a href="#" onclick="showImage('\${originPath}'); return false;"><img src='/display?fileName=\${filePath}'></a>
					   // 	<span data-file='\${filePath}' data-type='image'>x</span></li>`;
					    str += `<li data-path='\${item.uploadPath}' data-uuid='\${item.uuid}' data-filename='\${item.fileName}' data-type='\${item.fileType}'><a href="#" onclick="showImage('\${originPath}'); return false;"><img src='/dogdisplay?fileName=\${filePath}'></a>
					    	<span data-file='\${filePath}' data-type='image'>x</span></li>`;

				   } 
	      });
	      uploadResult.append(str);
	   } //showUploadedFile

	   $(".uploadResult").on("click", "span", function(e){
		   let targetFile = $(this).data("file");
		   let type = $(this).data("type");
		   let targetLi = $(this).closest("li");
		   console.log(targetFile);
		   $.ajax({
		       url:'/dogdeleteFile',
		       data : {fileName:targetFile, type:type},
		       dataType:'text',
		       type : 'post',
		       success:function(result){   alert(result);
		       targetLi.remove()}
		   }); //$.ajax
		}); //span x event

	
	
});  //document ready


function showImage(filePath) {
	  // alert(filePath);
	   $(".bigPictureWrapper").css("display", "flex").show();
	   $(".bigPicture")
	   .html(`<img src='/dogdisplay?fileName=\${filePath}'>`)
	   .animate({width:'100%', height:'100%'}, 1000 ); 

	   $(".bigPictureWrapper").on("click", function(e){
		   $(".bigPicture").animate({width: '0%', height:'0%'}, 1000);
		   setTimeout(function(){
		      $('.bigPictureWrapper').hide();
		   }, 1000);
		}); //bigPictureWrapper click

	} //showImage
</script>

	<jsp:include
		page="${pageContext.request.contextPath}//WEB-INF/views/include/footer.jsp" />

</body>
</html>