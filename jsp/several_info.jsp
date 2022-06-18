<%-- 개봉일 순서 --%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>coming_now</title>
<link rel="stylesheet" type="text/css" href="../css/severalinfo.css">
</head>
<body>
<%@ include file="dbconn.jsp" %>
<div class="Entire">
    <header class="header">
        <span>영화 상세정보</span>
    </header>
    <main class="main">
            <%
            request.setCharacterEncoding("utf-8");
            String id = request.getParameter("no");
            ResultSet rs = null ;
            Statement stmt = null;              
            try {
                String sql = "SELECT MOVIE_NAME, OPENING_DATE, DIRECTOR, ACTOR, RUNNING_TIME, VIEWING_GRADE, MOVIE_ID, GENRE_ID, BOOKING_NUMBER, ACCUMULATE_NUMBER, MOVIE_INFO FROM MOVIE WHERE MOVIE_ID = " + id ;
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);
                rs.next();
                %>
                //!!!!!!!!!!!!!!!!!!!!
                <span>제목: <%out.println(rs.getString("MOVIE_NAME"));%></span>
                <span>개봉일: <%out.println(rs.getString("OPENING_DATE"));%></span>
                <span>감독: <%out.println(rs.getString("DIRECTOR"));%></span>
                <span>배우: <%out.println(rs.getString("ACTOR"));%></span>
                <span>사영시간: <%out.println(rs.getString("RUNNING_TIME"));%></span>
                <span>관람등급: <%out.println(rs.getString("VIEWING_GRADE"));%></span>
                <span>영화번호: <%out.println(rs.getString("MOVIE_ID"));%></span>
                <span>장르: <%out.println(rs.getString("GENRE_ID"));%></span>
                <span>예약자수: <%out.println(rs.getString("BOOKING_NUMBER"));%></span>
                <span>누적 관객수: <%out.println(rs.getString("ACCUMULATE_NUMBER"));%></span>
                <span>영화정보: <%out.println(rs.getString("MOVIE_INFO"));%></span>  
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