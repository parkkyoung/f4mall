package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class CKEditorFileUploadController {

	@Autowired
	ServletContext application;

	@RequestMapping(value = "/ckeditorImageUpload.do", method = RequestMethod.POST)
	public void ckeditorImageUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload) throws Exception {

		PrintWriter printWriter = null;

		try {

			String fileName = upload.getOriginalFilename();
			String web_path = "/resources/upload/";
			String abs_path = application.getRealPath(web_path);
			// String uploadPath = "������/" + fileName;//������
			File f = new File(abs_path, fileName);
			// ����ȭ���� �ִ°��
			if (f.exists()) {
				long time = System.currentTimeMillis();
				int index = fileName.lastIndexOf('.');
				String f_name = fileName.substring(0, index);
				String f_ext = fileName.substring(index);

				fileName = String.format("%s_%d%s", f_name, time, f_ext);
				f = new File(abs_path, fileName);
			}
			// ���ε�ȭ�� ������ ��ġ�� ����
			upload.transferTo(f);

			String callback = request.getParameter("CKEditorFuncNum");

			response.setContentType("text/html;charset=utf-8");
			printWriter = response.getWriter();

			String url = request.getRequestURL().toString().replaceAll("/ckeditorImageUpload.do", "");
			// System.out.println(url);

			// String url = request.getContextPath();

			String fileUrl = url + web_path + fileName;// url���

			printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + callback
					+ ",'" + fileUrl + "','�̹����� ���ε� �Ͽ����ϴ�.'" + ")</script>");
			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {

				if (printWriter != null) {
					printWriter.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
