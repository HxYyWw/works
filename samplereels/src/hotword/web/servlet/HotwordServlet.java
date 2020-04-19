package hotword.web.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hotword.domain.HotwordBean;
import hotword.domain.HotwordSearchBean;
import hotword.service.HotwordService;

/**
 * Servlet implementation class HotwordServlet
 */
public class HotwordServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private static final HotwordService Ser = new HotwordService();
   
	public void getHotwordBeans(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		List<HotwordBean> list = Ser.getHotwordBeans();
		Gson gson = new Gson();
		String data = gson.toJson(list);
		writer.write(data);
	}
	
	public void getHotwordBean(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		String name = request.getParameter("name");
		HotwordBean list = Ser.getHotwordBean(name);
		Gson gson = new Gson();
		String data = gson.toJson(list);
		writer.write(data);
	}
	
	public void getHotwordSearchBeans(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		String name = request.getParameter("name");
		List<HotwordSearchBean> list = Ser.getHotwordSearchBeans(name);
		Gson gson = new Gson();
		String data = gson.toJson(list);
		writer.write(data);
	}
	
	public void download(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				//获得请求文件名
				String filename = "detailinfo.docx";
				//设置文件MIME类型
				response.setContentType(getServletContext().getMimeType(filename));
				//设置Content-Disposition
				response.setHeader("Content-Disposition", "attachment;filename="+filename);
				//读取目标文件，通过response将目标文件写到客户端
				//获取目标文件的绝对路径
				String fullFileName = getServletContext().getRealPath("/download/" + filename);

				//System.out.println(fullFileName);
				//读取文件
				InputStream in = new FileInputStream(fullFileName);
				OutputStream out = response.getOutputStream();
				//写文件
				int b;
				while((b=in.read())!= -1)
				{
					out.write(b);
				}
				in.close();
				out.close();

	}

}
