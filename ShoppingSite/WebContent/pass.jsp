<%@  page import="java.sql.*"%>
<%

String password1=request.getParameter("ps1");
String password2=request.getParameter("ps2");
String user1=request.getParameter("usr");
if(password1.equals(password2))
	{

		try
			{	
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SYSTEM", "MrRay@k");
				PreparedStatement ps = con.prepareStatement("insert into password values(?,?,?)");
				ps.setString(1, password1);
				ps.setString(2, password2);
				ps.setString(3, user1);
				int x=ps.executeUpdate();
				
				if(x!=0)
				{
					out.println("password created Sucessfully");
					out.println("<br><a href='login.html'>GO to LoginPage<a/>");
				}
				
				else
				{
					out.println("Invalid Password !!!");
					out.println("<br><a href='password.html'>GO to RegistrationPage<a/>");
				}
			}
		
		catch(Exception e)
			{
				out.print(e);
			}
	
	}



	

%>