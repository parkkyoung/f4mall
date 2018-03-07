package controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SmartEditerController {
	/*	2018년3월7일(seo) 	*/
	@Autowired
	ServletContext application;
	
	 @RequestMapping(value = "/coding.do")
	    public String coding() {
	        return "coding";
	    }
	 
	    @RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
	    public String insertBoard(String editor) {
	        System.err.println("저장할 내용 : " + editor);
	        return "redirect:/coding.do";
	    }
	 
	    // 다중파일업로드
	    @RequestMapping(value = "/file_uploader_html5.do",
	                  method = RequestMethod.POST)
	    @ResponseBody
	    public String multiplePhotoUpload(HttpServletRequest request) {
	        // 파일정보
	        StringBuffer sb = new StringBuffer();
	        try {
	            // 파일명을 받는다 - 일반 원본파일명
	            String oldName = request.getHeader("file-name");
	            // 파일 기본경로 _ 상세경로
	            String web_path = "/resources/photoUpload/";
	            String filePath = application.getRealPath(web_path);
	            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
	                          .format(System.currentTimeMillis()))
	                          .append(UUID.randomUUID().toString())
	                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
	            InputStream is = request.getInputStream();
	            OutputStream os = new FileOutputStream(filePath + saveName);
	            int numRead;
	            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	            while ((numRead = is.read(b, 0, b.length)) != -1) {
	                os.write(b, 0, numRead);
	            }
	            os.flush();
	            os.close();
	            
	            
	            String url = request.getRequestURL().toString();
	            System.out.println(url);
	            
	            
	            // 정보 출력
	            sb = new StringBuffer();
	            sb.append("&bNewLine=true")
	              .append("&sFileName=").append(oldName)
	              
	              //주소 변경 필요하다.
	              .append("&sFileURL=").append(url.replace("/file_uploader_html5.do", web_path)).append(saveName);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return sb.toString();
	    }
	    /*	//2018년3월7일(seo) 	*/
}
