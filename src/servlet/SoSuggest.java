package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.GetSuggest;
import common.URLStatic;

public class SoSuggest extends HttpServlet{
	/**
	 * 搜索提示数据获取
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String request = GetSuggest.request(URLStatic.SOGOU,req.getParameter("q"));
		
		request = request.substring(request.indexOf(',')+2, request.indexOf(']'));
		PrintWriter writer = resp.getWriter();
		writer.print(request);
		writer.flush();
		writer.close();
	}
}
