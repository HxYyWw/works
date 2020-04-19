package hotword.tools;

import java.util.regex.*;

public class Encoding {	
	public static boolean IsChinese(String str)
    {
		Pattern p = Pattern.compile("[\u4e00-\u9fa5]");
		 Matcher m = p.matcher(str);
		 if (m.find()) {
		  return true;
		 }
		 return false;
    }
public static void main(String[] args) {
	System.out.println(IsChinese("工程力学系"));
}
}
