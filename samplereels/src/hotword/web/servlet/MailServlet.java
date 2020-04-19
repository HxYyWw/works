package hotword.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hotword.domain.SectionMailBean;
import hotword.domain.TypeMailBean;
import hotword.domain.YearMailBean;
import hotword.service.MailService;

/**
 * Servlet implementation class MailServlet
 */
public class MailServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
    private static final MailService Ser = new MailService();
    
    public void getYearMailBeans(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		List<YearMailBean> list = Ser.getYearMailBeans();
		Gson gson = new Gson();
		String data = gson.toJson(list);
		writer.write(data);
	}
    
    public void getTypeMailBeans(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		List<TypeMailBean> list = Ser.getTypeMailBeans();
		Gson gson = new Gson();
		String data = gson.toJson(list);
		writer.write(data);
	}
    
    public void getSectionMailBeans(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		List<SectionMailBean> list = Ser.getSectionMailBeans();
		Gson gson = new Gson();
		String data = gson.toJson(list);
		writer.write(data);
	}
    
}
