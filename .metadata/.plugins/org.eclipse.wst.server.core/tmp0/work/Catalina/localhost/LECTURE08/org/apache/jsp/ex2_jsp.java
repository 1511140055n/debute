/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.26
 * Generated at: 2017-06-06 10:05:10 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.util.regex.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public final class ex2_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<form action= \"ex2.jsp\" method=\"post\">\r\n");

int i = 0;
request.setCharacterEncoding("UTF-8");
String path = application.getRealPath("node.txt");
String btn = request.getParameter("btn");
String name =  request.getParameter("name");
String mall = request.getParameter("mall");
String node = request.getParameter("node");
ArrayList<String> list = new ArrayList<String>();
if("".equals(name)){
	name = "ななし";
}
if("書き込む".equals(btn)){
	node = node.replaceAll("\r\n","<br>");
}

Date d = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日(EEE)HH:mm:ss");
String day = sdf.format(d);
try {
	if("書き込む".equals(btn)){
		if("".equals(node)){
			out.println("書き込みを入力してください");
			return;
		}
		out.println("<br>");
		FileWriter fw = new FileWriter(path, true);
		BufferedWriter bw = new BufferedWriter(fw);
		bw.write(name);
		bw.write(",");
		bw.write(mall);
		bw.write(",");
		bw.write(day);
		bw.write(",");
		bw.write(node);
		bw.newLine();
		bw.close();
		fw.close();
	}
	try {
		if("書き込む".equals(btn)){
			String str1;
			FileReader fr = new FileReader(application.getRealPath("node.txt"));
			BufferedReader br = new BufferedReader(fr);
			while ((str1 = br.readLine()) != null) {
				String[] str2 = str1.split(",");
				list.add(str2[0]);
				list.add(str2[1]);
				list.add(str2[2]);
				list.add(str2[3]);
			}
			br.close();
			fr.close();
			System.out.println(list.size());
			i = list.size()/4;
			for(int j = list.size() -1; j  > 0; j-=4){
				out.print(i + ":名前：<a href= mailto:"+list.get(j-2)+">"+ list.get(j-3) +" </a>");
				out.print(list.get(j-1) +"<br>");
				out.print(list.get(j) +"<br>");
				i--;
			}
		}
	} catch(IOException e) {
	out.print("");
	}
} catch(IOException e) {
out.print("");
}
if ("初期化".equals(btn)) {
	try {
		FileWriter fw = new FileWriter(path, false);
		BufferedWriter bw = new BufferedWriter(fw);
		bw.write("");
		bw.close();
		fw.close();
	} catch(IOException e) {
	out.print("ファイル書き込みエラー" + e);
	}
	try {
		String str;
		FileReader fr = new FileReader(application.getRealPath("node.txt"));
		BufferedReader br = new BufferedReader(fr);
		while ((str = br.readLine()) != null) {
		out.print(str + "<br>");
		}
		br.close();
		fr.close();
	} catch(IOException e) {
	out.print("エラーです" + e);
	}
}

      out.write("\r\n");
      out.write("\r\n");
      out.write("<br><input type=\"submit\" name=\"btn\" value=\"書き込む\">\r\n");
      out.write("名前:<input type=\"text\" name=\"name\">\r\n");
      out.write("E-Mail(省略可)：\r\n");
      out.write("<input type=\"text\" name=\"mall\"><br/>\r\n");
      out.write("<textarea name=\"node\" rows=\"5\" cols=\"70\"></textarea><br/>\r\n");
      out.write("<input type =\"reset\" name=\"btn\" value=\"リセット\">\r\n");
      out.write("<input type =\"submit\" name=\"btn\" value=\"初期化\">\r\n");
      out.write("</form>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
