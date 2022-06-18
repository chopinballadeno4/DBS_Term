<%-- 개봉일 순서 --%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>open_now</title>
<link rel="stylesheet" type="text/css" href="../css/comingnow.css">
</head>
<body>
<%@ include file="dbconn.jsp" %>
<div class="Entire">
    <header class="header">
        <span>예매 순서</span>
    </header>
    <nav>
        <ul class="movie_list" style="list-style: none"> 
            <%
            request.setCharacterEncoding("utf-8");
            ResultSet rs = null ;
            Statement stmt = null;              
            try {
                String sql = "SELECT MOVIE_NAME, OPENING_DATE, DIRECTOR, ACTOR, RUNNING_TIME, VIEWING_GRADE, MOVIE_ID, GENRE_ID, BOOKING_NUMBER, ACCUMULATE_NUMBER, MOVIE_INFO FROM MOVIE ORDER BY BOOKING_NUMBER DESC";                stmt = conn.createStatement();
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);
                while(rs.next()) {
                    String movieno = rs.getString("MOVIE_ID");
            %>
            <li>
                <form class="movie_list_item" name="register" action="several_info.jsp" method="POST">
                    <input placeholder="asdf" class="movie_button" type="submit" name="no" value=<%=rs.getString("MOVIE_ID")%>>
                        <span>상세정보 확인 ⬆ 클릭</span>
                        <% 
                        out.println(rs.getString("MOVIE_NAME")); 
                        out.println(rs.getString("OPENING_DATE")); %>
                        <span class="date">예매 수: <%out.println(rs.getString("BOOKING_NUMBER"));%></span><%
                        out.println(rs.getString("DIRECTOR"));
                        out.println(rs.getString("ACTOR"));
                        out.println(rs.getString("RUNNING_TIME"));
                        out.println(rs.getString("VIEWING_GRADE"));
                        %>
                    </input>
                </form>
            </li>
            <%    
                } 
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
        </ul>
    </nav>
</div>
</body>
</html>