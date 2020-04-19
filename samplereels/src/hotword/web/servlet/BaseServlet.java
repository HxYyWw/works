package hotword.web.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import hotword.tools.Encoding;



/**
 * Servlet implementation class BaseServlet
 */
public class BaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BaseServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		//在传递request之前对request的getParameter()方法进行增强
		
		/**
		 * 装饰者模式（包装）
		 * 
		 * 1，增强类与被增强的类要实现统一接口
		 * 2，在增强类中传入被增强的类
		 * 3，需要增强的方法中重写  不需要增强的方法调用被增强的对象
		 * 
		 */
		
		EnhanceRequest  enhanceRequest = new EnhanceRequest(request);
		
		try {
			//1,获取请求的method的名称
			String methodName = request.getParameter("method");
//			System.out.println(methodName);
			//2，获得当前被访问的对象的字节码对象
			Class clazz = this.getClass();
			
			//3,获得当前字节码对象的指定方法  第一个参数  调用的函数名称，第二个参数   传递的数据
			Method method = clazz.getMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
			
			//4,执行相应的功能方法  第一个参数执行的对象，第二个参数传递的数据
			method.invoke(this, enhanceRequest,response);
		}
		 catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		  }
		
		
	}
	
	class EnhanceRequest extends HttpServletRequestWrapper{

		private HttpServletRequest request;
		
		public EnhanceRequest(HttpServletRequest request) {
			super(request);
			this.request = request;
		}
		
		
		//对getParameter(String)增强
		@Override
		public String getParameter(String name) {
			String parameter = request.getParameter(name);
			if(parameter!=null&&!"".equals(parameter)) {
				if(Encoding.IsChinese(parameter)) {
					return parameter;
				}
			try {
				parameter = new String(parameter.getBytes("iso8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			}else {
				return null;
			}
			return parameter;
		}
		
		//对getParameterValues增强
		@Override
		public String[] getParameterValues(String name) {
			String[] strs = request.getParameterValues(name);
			if(strs!=null) {
				try {
					for(String str :strs) {
						str = new String(str.getBytes("iso8859-1"),"UTF-8");
					}
				} catch (Exception e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
			}else {
				return null;
			}
			return strs;
		}
		
		//对getParameterMap()增强
		@Override
		public Map<String,String[]> getParameterMap(){
			Map<String,String[]> map = new HashMap<String, String[]>(request.getParameterMap());
			for(String key : map.keySet()) {
					try {
						String[] values = map.get(key);
						for(int i=0;i<values.length;i++) {
							values[i]=new String(values[i].getBytes("iso8859-1"),"UTF-8");
						}
						for(int i=0;i<values.length;i++) {
						}
						map.replace(key, values);
					} catch (UnsupportedEncodingException e) {
						// TODO 自动生成的 catch 块
						e.printStackTrace();
					}
			}
			return map;
		}
 }
}

