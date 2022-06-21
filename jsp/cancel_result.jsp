<%-- 개봉일 순서 --%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>coming_now</title>
<link rel="stylesheet" type="text/css" href="../css/cancelresult.css">
</head>
<body>
<%@ include file="dbconn.jsp" %>
<div class="Entire">
    <header class="header">
        <span>취소 결과</span>
    </header>
    <main class="main">
            <%-- 취소 결과를 보여주기 위한 페이지 입니다. 쿼리문을 통해 취소에 대한 정보를 출력해줍니다. --%>
            <%
            request.setCharacterEncoding("utf-8");
            String id = request.getParameter("no");
            int nn = Integer.parseInt(id);
            ResultSet rs = null ;
            Statement stmt = null;              
            try {
                String sql = "DELETE FROM BOOKING_LIST WHERE BOOKING_NUMBER = "+nn+"";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);
            %>

                <span class="ment"> 취소 성공 ! </span>
                <form class="movie_list_item" name="register" action="/DBS_term/home.html" method="POST">
                    <input placeholder="홈으로 돌아가기" class="movie_button" type="submit" value="홈으로">
                </form>
            <%          
            } catch(SQLException ex) {
                out.println("테이블의 정보를 불러오는 것을 실패하였습니다.<br>");
                out.println("SQLException:"+ex.getMessage());
            } finally {
                if(stmt != null)
                    stmt.close();
                if(conn != null)
                    conn.close();
            }
            %>
    </main>
</div>
</body>
</html>