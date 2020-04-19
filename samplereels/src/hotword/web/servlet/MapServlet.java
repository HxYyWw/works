package hotword.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hotword.domain.MapBean;
import hotword.service.MapService;

/**
 * Servlet implementation class MapServlet
 */
public class MapServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private static final MapService Ser = new MapService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void getMapBeans(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		List<MapBean> list = Ser.getMapBeans();
		Gson gson = new Gson();
		String data = gson.toJson(list);
		writer.write(data);
	}
}
