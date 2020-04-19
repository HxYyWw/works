package hotword.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hotword.domain.DataBean;
import hotword.service.DataService;


/**
 * Servlet implementation class DataServlet
 */
public class DataServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private DataService Ser = new DataService();
	
	public void getDataBeans(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		List<DataBean> list = Ser.getDataBeans();
		Gson gson = new Gson();
		String data = gson.toJson(list);
		writer.write(data);
	}
	
}
