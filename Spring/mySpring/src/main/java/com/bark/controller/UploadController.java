package com.bark.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bark.domain.Attached;
import com.bark.domain.DogAttached;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("uploadAjax ajax");
	}
	
	@GetMapping("/dogUploadAjax")
	public void dogUploadAjax() {
		log.info("dogUpload ajax");
	}

	@PostMapping(value="/uploadAjaxAction", produces= MediaType.APPLICATION_JSON_VALUE )
	@ResponseBody
	public ResponseEntity<List<Attached>>  uploadAjaxPost(MultipartFile[] uploadFile) {
		String uploadFolder="d:/upload/board/";
		List<Attached> list = new ArrayList<Attached>();
		//파일을 upload 지정 폴더 내부에 새로운 폴더를 생성하여 저장하기로 
		File uploadPath  = new File(uploadFolder, getFolder());
		log.info("upload Path : "+uploadPath);
		if(uploadPath.exists() ==false) { //폴더가 존재하지 않으면 새로 생성
			uploadPath.mkdirs();  //yyyy/MM/dd 폴더 생성
		}

		for(MultipartFile multipartFile: uploadFile) {
			Attached attached = new Attached();
			
			log.info("---------------------------------------");
			log.info("Upload File Name : "+multipartFile.getOriginalFilename());
			log.info("Upload File Size : "+multipartFile.getSize());

			UUID uuid = UUID.randomUUID();
			String uploadFileName = multipartFile.getOriginalFilename();
			attached.setFileName(uploadFileName);

			uploadFileName = uuid.toString()+"_"+uploadFileName;

			File saveFile = new File(uploadPath, uploadFileName);
			try { 
				multipartFile.transferTo(saveFile); 
				attached.setUuid(uuid.toString()); attached.setUploadPath(getFolder());

				if(checkImageType(saveFile)) {
					attached. setFileType(true);

					FileOutputStream thumbnail 
					= new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}
				list.add(attached); log.info("attached : "+attached);

			} catch (Exception e) {  log.error(e.getMessage());  }
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@PostMapping(value="/DogUploadAjaxAction", produces= MediaType.APPLICATION_JSON_VALUE )
	@ResponseBody
	public ResponseEntity<List<DogAttached>>  dogUploadAjaxPost(MultipartFile[] uploadFile) {
		String uploadFolder="d:/upload/dog/";
		List<DogAttached> list = new ArrayList<DogAttached>();
		//파일을 upload 지정 폴더 내부에 새로운 폴더를 생성하여 저장하기로 
		File uploadPath  = new File(uploadFolder, getFolder());
		log.info("upload Path : "+uploadPath);
		if(uploadPath.exists() ==false) { //폴더가 존재하지 않으면 새로 생성
			uploadPath.mkdirs();  //yyyy/MM/dd 폴더 생성
		}

		for(MultipartFile multipartFile: uploadFile) {
			DogAttached dogAttached = new DogAttached();
			
			log.info("---------------------------------------");
			log.info("Upload File Name : "+multipartFile.getOriginalFilename());
			log.info("Upload File Size : "+multipartFile.getSize());

			UUID uuid = UUID.randomUUID();
			String uploadFileName = multipartFile.getOriginalFilename();
			dogAttached.setFileName(uploadFileName);

			uploadFileName = uuid.toString()+"_"+uploadFileName;

			File saveFile = new File(uploadPath, uploadFileName);
			try { 
				multipartFile.transferTo(saveFile); 
				dogAttached.setUuid(uuid.toString()); dogAttached.setUploadPath(getFolder());

				if(checkImageType(saveFile)) {
					dogAttached. setFileType(true);

					FileOutputStream thumbnail 
					= new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}
				list.add(dogAttached); log.info("dog : attached : "+dogAttached);

			} catch (Exception e) {  log.error(e.getMessage());  }
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	// board 썸네일 표시 기능
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]>getFile(String fileName){
	   log.info("fileName : "+fileName);
	   File file = new File("d:/upload/board/"+fileName);
	   log.info("file : "+ file);
	   ResponseEntity<byte[]> result = null;
	   try {
	         HttpHeaders header = new HttpHeaders();
	         header.add("Content-Type", Files.probeContentType(file.toPath())); 
		//적당한 MIME 타입을 헤더에 추가
	         result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
	   } catch (IOException e) { e.printStackTrace();}
	   return result;
	}
	// dog 표시 기능
	@GetMapping("/dogdisplay")
	@ResponseBody
	public ResponseEntity<byte[]>dogGetFile(String fileName){
	   log.info("fileName : "+fileName);
	   File file = new File("d:/upload/dog/"+fileName);
	   log.info("file : "+ file);
	   ResponseEntity<byte[]> result = null;
	   try {
	         HttpHeaders header = new HttpHeaders();
	         header.add("Content-Type", Files.probeContentType(file.toPath())); 
		//적당한 MIME 타입을 헤더에 추가
	         result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
	   } catch (IOException e) { e.printStackTrace();}
	   return result;
	}
	// board 다운로드
	@GetMapping(value="/download", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(String fileName){
	   log.info("download file : "+ fileName);
	   Resource resource = new FileSystemResource("d:/upload/board/"+fileName);
	   if(resource.exists() ==false) {return new ResponseEntity<>(HttpStatus.NOT_FOUND); }

	   log.info("resource : "+ resource);
	
	   String resourceName = resource.getFilename();
	 //remove UUID, 추가된 부분
	   String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
	   log.info("resourceOriginalName : "+resourceOriginalName);

	   HttpHeaders headers = new HttpHeaders();
	   try {
	      headers.add("Content-Disposition", "attachment; fileName=" 
	              + new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1"));
	   } catch (UnsupportedEncodingException e) {
	      e.printStackTrace();
	   } 
   return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);

	}
	// dog 다운로드
	@GetMapping(value="/dogdownload", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> dogDownloadFile(String fileName){
	   log.info("download file : "+ fileName);
	   Resource resource = new FileSystemResource("d:/upload/dog/"+fileName);
	   if(resource.exists() ==false) {return new ResponseEntity<>(HttpStatus.NOT_FOUND); }

	   log.info("resource : "+ resource);
	
	   String resourceName = resource.getFilename();
	 //remove UUID, 추가된 부분
	   String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
	   log.info("resourceOriginalName : "+resourceOriginalName);

	   HttpHeaders headers = new HttpHeaders();
	   try {
	      headers.add("Content-Disposition", "attachment; fileName=" 
	              + new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1"));
	   } catch (UnsupportedEncodingException e) {
	      e.printStackTrace();
	   } 
   return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);

	}
	// board 삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type){
	    log.info("deleteFile: "+fileName);
	    File file;
	    try {
	       file = new File("d:/upload/board/"+URLDecoder.decode(fileName, "UTF-8"));
	       file.delete(); //upload 폴더에서 해당 이름의 파일 삭제 
	       if(type.equals("image")) {//이미지인 경우, 원본 파일 삭제
	            String largeFileName  = file.getAbsolutePath().replace("s_", "");
	            log.info("largeFileName : "+largeFileName);
	            file = new File(largeFileName);
	            file.delete();
	       }
	   } catch (UnsupportedEncodingException e) {
	      e.printStackTrace();
	      return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	   }
	   return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	//dog 삭제
	@PostMapping("/dogdeleteFile")
	@ResponseBody
	public ResponseEntity<String> dogDeleteFile(String fileName, String type){
	    log.info("deleteFile: "+fileName);
	    File file;
	    try {
	       file = new File("d:/upload/dog/"+URLDecoder.decode(fileName, "UTF-8"));
	       file.delete(); //upload 폴더에서 해당 이름의 파일 삭제 
	       if(type.equals("image")) {//이미지인 경우, 원본 파일 삭제
	            String largeFileName  = file.getAbsolutePath().replace("s_", "");
	            log.info("largeFileName : "+largeFileName);
	            file = new File(largeFileName);
	            file.delete();
	       }
	   } catch (UnsupportedEncodingException e) {
	      e.printStackTrace();
	      return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	   }
	   return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}


	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String  str = sdf.format(date);
		return str.replace("-", File.separator);
	}

	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		}catch(IOException e) {
			e.printStackTrace();
		}
		return false;
	}

}
