<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<html>
<head>
<title>Database SQL : Select</title>
<link rel="stylesheet" href="select01.css">
</head>
<body>
<%@ include file="dbconn.jsp" %>
        <%
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String salary = request.getParameter("salary");
        String groupid = request.getParameter("groupid");
        %>
    <table id="t1">
    <tr>
        <%if(id != null) {%><th>아이디</th><%}%>
        <%if(name != null) {%><th>이름</th><%}%>
        <%if(email != null) {%><th>이메일</th><%}%>
        <%if(salary != null) {%><th>월급</th><%}%>
        <%if(groupid != null) {%><th>부서 ID</th><%}%>
    </tr>
    <tr>
    <%
            ResultSet rs = null ;
            Statement stmt = null;              
        try {
            String sql = "SELECT employee_id, concat(first_name, concat(' ', last_name)) as name, email, salary, department_id FROM employees";           
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            String pid = null;
            String pname = null;
            String pemail = null;
            String psalary = null;
            String pgroupid = null;
            while(rs.next()) {           
                if(id != null) {
                    pid = rs.getString("employee_id");
                   %>                  <td><%=pid%></td><%
                } 
                if(name != null) {
                     pname = rs.getString("name");
                    %>            <td><%=pname%></td><%
                }
                if(email != null) {
                     pemail = rs.getString("email");
                    %>         <td><%=pemail%></td><%

                }
                if(salary != null) {
                     psalary = rs.getString("salary");
                    %> <td><%=psalary%></td><%


                }
                if(groupid != null) {
                     pgroupid = rs.getString("department_id");
                     %><td><%=pgroupid%></td><%

                }
   
    %>
</tr>
        <%
        }
            out.println("201702021 배성민<br>");
            out.println("Employee 테이블 삽입이 성공했습니다.");
        } catch(SQLException ex) {
            out.println("Employee 테이블 삽입이 실패했습니다.<br>");
            out.println("SQLException:"+ex.getMessage());
        } finally {
            if(stmt != null)
                stmt.close();
            if(conn != null)
                conn.close();
        }
        %>
        <p><%=new java.util.Date() %></p>

</body>
</html>