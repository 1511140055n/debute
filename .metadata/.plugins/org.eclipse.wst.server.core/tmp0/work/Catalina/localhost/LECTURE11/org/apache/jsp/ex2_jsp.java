/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.26
 * Generated at: 2017-06-27 11:44:30 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.io.*;
import java.util.regex.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public final class ex2_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


int i =0;

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
      out.write("\r\n");
      out.write('\r');
      out.write('\n');


request.setCharacterEncoding("UTF-8");
String btn = request.getParameter("btn");
String name = request.getParameter("name");
String id = request.getParameter("id");
String path = application.getRealPath("node.txt");
String mall = request.getParameter("mall");
String node = request.getParameter("node");
if("".equals(name)){
	name = "ななし";
}
if("書き込む".equals(btn)){
	node = node.replaceAll("\r\n","<br>");
}

Date d = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日(EEE)HH:mm:ss");
String day = sdf.format(d);
//登録
if ("書き込む".equals(btn)) {
	i++;
	if("".equals(node)){
		out.println("書き込みを入力してください");
		return;
	}
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "INSERT INTO NOTE VALUES (?,?,?,?,?)";
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setString(1,String.valueOf(i));
	stmt.setString(2,name);
	stmt.setString(3,mall);
	stmt.setString(4,d.toString());
	stmt.setString(5,node);
	stmt.executeUpdate();
	stmt.close();
	con.close();
}
//表示
Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
String sql = "SELECT * FROM NOTE";
PreparedStatement stmt = con.prepareStatement(sql);
sql = "SELECT * FROM NOTE ORDER BY ID DESC";
stmt = con.prepareStatement(sql);
ResultSet rest = stmt.executeQuery();
while(rest.next())
{
    int id_ = rest.getInt("ID");
    String name_ = rest.getString("NAME");
    String emale_ = rest.getString("EMALE");
    String kakikomidat_ = rest.getString("KAKIKOMIDAT");
    String kakikomi_ = rest.getString("KAKIKOMI");

      out.write("\r\n");
      out.write("<form action= \"name.jsp\" method=\"post\">\r\n");
      out.write("\t<p>");
      out.print( id_ );
      out.write("&nbsp;名前：<a href= mailto:");
      out.print( emale_ );
      out.write('/');
      out.write('>');
      out.print( name_ );
      out.write("</a>&nbsp;日付：");
      out.print( kakikomidat_ );
      out.write("<br>\r\n");
      out.write("\t");
      out.print( kakikomi_ );
      out.write("<br>\r\n");
      out.write("\t<input type=\"hidden\" name=\"id\" value=\"");
      out.print(id_ );
      out.write("\"/>\r\n");
      out.write("\t</p>\r\n");
      out.write("\t</form>\r\n");

}
rest.close();
stmt.close();
con.close();

      out.write("\r\n");
      out.write("<form action= \"ex2.jsp\" method=\"post\">\r\n");
      out.write("<br><input type=\"submit\" name=\"btn\" value=\"書き込む\">\r\n");
      out.write("名前:<input type=\"text\" name=\"name\">\r\n");
      out.write("E-Mail(省略可)：\r\n");
      out.write("<input type=\"text\" name=\"mall\"><br/>\r\n");
      out.write("<textarea name=\"node\" rows=\"5\" cols=\"70\"></textarea><br/>\r\n");
      out.write("</form>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
