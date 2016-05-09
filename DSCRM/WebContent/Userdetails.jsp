<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Validate Page</title>
<script type="text/javascript">

 /* 	 function validateEmail(email) {
 	    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
 	    return re.test(email);
	} 
 */

</script>
<body>
	<%@ page language="java" import="java.sql.*,java.io.*"%>
	<%
		System.out.println("i am in jsp");
		String UserName = request.getParameter("user");
	    String UserMobileNumber= request.getParameter("mobileNumber");
	    String UserAddress= request.getParameter("Address");
	    String UserRequrement=request.getParameter("Requrement");
	    String UserEmail=request.getParameter("email"); %>
   
	   <% Connection conn = null;
	    String userQuery = "insert into userrequest (name,mobile_Number,Address,Requrement,email) values ('"+UserName+"','"+UserMobileNumber+"', '"+UserAddress+"','"+UserRequrement+"','"+UserEmail+"');";
	     
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/dscrm", "root", "root");
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(userQuery);
		} //end of try block.
		catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>