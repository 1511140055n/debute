/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.26
 * Generated at: 2017-11-22 06:49:10 UTC
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
import java.security.MessageDigest;
import java.util.ArrayList;

public final class test_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


String getMessageDigest(String data) throws Exception{
	StringBuffer sb = new StringBuffer();
	MessageDigest md5 = MessageDigest.getInstance("MD5");
	byte[] result = md5.digest(data.getBytes());
	for(byte b : result){
		int b2 = b & 0xff;
		if(b2 < 16) sb.append("0");
		sb.append(Integer.toHexString(b2));
	}
	return sb.toString();
}

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
      out.write("<form action= \"test.jsp\" method=\"post\">\r\n");
      out.write("\r\n");
      out.write("\r\n");

request.setCharacterEncoding("UTF-8");
String btn = request.getParameter("btn");
String name =  request.getParameter("name");
String pass = request.getParameter("pass");
ArrayList<String> list = new ArrayList<String>();
if(session.isNew())session.setAttribute("a","true");
if("登録".equals(btn)){
	pass = getMessageDigest(pass);
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "INSERT INTO TEST(NAME,PASS) VALUES(?,?)";
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setString(1, name);
	stmt.setString(2, pass);
	int cnt = stmt.executeUpdate();
	stmt.close();
	con.close();
}
if("ログイン".equals(btn)){
	pass = (String)getMessageDigest(pass);
	Connection con = null;
	try {
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");

		String sql = "SELECT * FROM TEST NAME = ? AND PASS = ?";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, name);
		stmt.setString(2, pass);
		ResultSet rest = stmt.executeQuery();
		while (rest.next()) {
			out.print("ログインに成功しました");
			break;
		}
	} catch(SQLException e) {
		e.printStackTrace();
	} catch(ClassNotFoundException e) {
		e.printStackTrace();
	} finally {
		if (con != null) {
			try {
				con.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
	/*Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql2 = "SELECT * FROM TEST";
	PreparedStatement stmt2 = con.prepareStatement(sql2);
	ResultSet rest = stmt2.executeQuery();
	out.println(name+"\t,"+pass);
	while(rest.next())
	{
	    String _name = rest.getString("NAME");
	    String _pass = rest.getString("PASS");
	    out.println(_name+","+_pass);

	    if((name).equals(_name)){
	    	out.print("ログインしました");
	    	break;
	    }
	}
	rest.close();
	stmt2.close();
	con.close();
	try{
		String str = "";
		FileReader fr = new FileReader(application.getRealPath("info.txt"));
		BufferedReader br = new BufferedReader(fr);
		while ((str = br.readLine()) != null) {
			String[] str2 = str.split(",");
			list.add(str2[0]);
			list.add(str2[1]);
		}

		br.close();
	} catch(IOException e) {
		out.print("");
	}
	int i = 0;
	while(true){
		if(list.get(i).equals(id) && list.get(i+1).equals(pass)){
			session.setAttribute("a","false");
		}
		i += 2;
		if(i == list.size()){
			break;
		}
	}
*/

/*
String a = (String)session.getAttribute("a");
if("false".equals(a)){
	out.print("ログインしました");
}
else if("true".equals(a)){
	out.print("ログインに失敗しました");

}*/

      out.write("\r\n");
      out.write("<table>\r\n");
      out.write("        <tr>\r\n");
      out.write("            <th>NAME</th>\r\n");
      out.write("            <td><input type=\"text\"  name=\"name\"></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("            <th>パスワード</th>\r\n");
      out.write("            <td><input type=\"text\"  name=\"pass\"></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("</table>\r\n");
      out.write("<input type=\"submit\" name=\"btn\" value=\"ログイン\">\r\n");
      out.write("<input type=\"submit\" name=\"btn\" value=\"登録\">\r\n");
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
