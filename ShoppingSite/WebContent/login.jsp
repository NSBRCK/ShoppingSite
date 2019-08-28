<%@ page import= "java.sql.*" %>
<%@ page session="true" %>

		
<% 

String user=request.getParameter("username");
String pass=request.getParameter("password");

try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from registration");

while(rs.next())
{
if(user.equals(rs.getString("user1")) && pass.equals(rs.getString("pass1")))
{
out.println("login successfully");
request.getRequestDispatcher("website1.html").forward(request,response);
}

} 
out.println("BHAI THIK SE PASSWORD MAARNA!!!!");
request.getRequestDispatcher("login.html").forward(request,response);
} 
catch(Exception e)
{
	out.println(e);	
}
%>
 