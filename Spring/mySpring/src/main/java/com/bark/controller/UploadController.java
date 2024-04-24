package com.bark.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	@Autowired
	ServletContext context;	//application
	
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
		
		String uploadFolder=context.getRealPath("/resources/images");
		log.info("uploadFolder " + uploadFolder);
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
	
	//D:\WorkSpace\BarkWorkSpace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Bark\resources\images
	@PostMapping(value="/DogUploadAjaxAction", produces= MediaType.APPLICATION_JSON_VALUE )
	@ResponseBody
	public ResponseEntity<List<DogAttached>> dogUploadAjaxPost(MultipartFile[] uploadFile) {
		String uploadFolder = context.getRealPath("/resources/images/dogs");	
		List<DogAttached> list = new ArrayList<DogAttached>();

		for(MultipartFile multipartFile: uploadFile) {
			DogAttached dogAttached = new DogAttached();
			
			log.info("---------------------------------------");
			log.info("Upload File Name : "+multipartFile.getOriginalFilename());
			log.info("Upload File Size : "+multipartFile.getSize());

			UUID uuid = UUID.randomUUID();
			String uploadFileName = multipartFile.getOriginalFilename();
			dogAttached.setFileName(uploadFileName);

			uploadFileName = uuid.toString()+"_"+uploadFileName;

			File saveFile = new File(uploadFolder, uploadFileName);
			try { 
				multipartFile.transferTo(saveFile); 
				dogAttached.setUuid(uuid.toString()); 
				dogAttached.setUploadPath(getFolder());

				if(checkImageType(saveFile)) {
					dogAttached. setFileType(true);

					FileOutputStream thumbnail 
					= new FileOutputStream(new File(uploadFolder, "s_"+uploadFileName));
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
	   File file = new File("C:\\Users\\yjlee\\git\\Bark\\Project-Bark\\Spring\\mySpring\\src\\main\\webapp\\resources\\images\\dogs"+fileName);
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
