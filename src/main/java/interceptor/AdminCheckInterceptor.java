package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import dao.MemberDao;
import vo.MemberVo;

public class AdminCheckInterceptor 
      extends HandlerInterceptorAdapter
{

	@Autowired
	MemberDao member_dao;
	
	@Override
	public boolean preHandle(
			HttpServletRequest  request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		// TODO Auto-generated method stub

		//�α��� üũ
		HttpSession session = request.getSession();
		Object user = session.getAttribute("user");
		
		// �������� ������
		String contextPath = request.getContextPath();
		String redirectPage = "";
		
		// �α����� ���ߴٸ�
		if(user == null){
			redirectPage = String.format("%s/%s?admin=none", contextPath,"index.do");
			response.sendRedirect(redirectPage);
		} else {
			
			// �� ����� �����ڰ� �ƴ϶��
			MemberVo vo = (MemberVo) session.getAttribute("user");
			if(vo.getM_grade() != 1){
				redirectPage = String.format("%s/%s?admin=normal", contextPath,"index.do");
				response.sendRedirect(redirectPage);
			}
		}
		
		return super.preHandle(request, response, handler);
	}
	
}
