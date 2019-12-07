<%@page contentType="text/html" pageEncoding="UTF-8"
import = "java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
Connection c = null;
String url = "jdbc:mysql://localhost/test";

try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
c = DriverManager.getConnection(url,"root","root");
ResultSet r = null;
  Statement s = c.createStatement();

 String sql = "SELECT * FROM empleado as e JOIN sucursal as s ON e.sucursalID=s.id WHERE e.sucursalID = '2'";

   r  = s.executeQuery(sql);
   while(r.next()) {
   out.println("<p>id:"+ r.getString("id")+"</p>");
     out.println("<p>empleado: "+ r.getString("empleado")+"</p>");
    out.println("<p>sucursalid: "+ r.getString("sucursalID")+"</p>");
     out.println("<p>nombresucursal: "+ r.getString("sucursal")+"</p>");
    out.println("<br>");
   }
   r  = s.executeQuery(sql);
}
catch(SQLException ex)
{
   out.println(ex);
}
%>
    </body>
</html>
