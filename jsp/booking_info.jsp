<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>booking_info</title>
<link rel="stylesheet" type="text/css" href="../css/bookinginfo.css">
</head>
<body>
<%@ include file="dbconn.jsp" %>
<div class="Entire">
    <header class="header">
        <span>예매하기</span>
    </header>
    <main class="main">
            <%
            request.setCharacterEncoding("utf-8");
            String id = request.getParameter("no");
            ResultSet rs = null ;
            Statement stmt = null;              
            try {
                String sql = "SELECT MOVIE_NAME, OPENING_DATE, DIRECTOR, ACTOR, RUNNING_TIME, VIEWING_GRADE, MOVIE_ID, GENRE_ID, BOOKING_NUMBER, ACCUMULATE_NUMBER, MOVIE_INFO FROM MOVIE";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);
                //rs.next();
                String [] data = id.split("_");
                String Theaterroomtype = data[0];
                String Moviedate = data[1];
                String remainseat = data[2];
                String Theater = data[3];
            %>
            <div class="movie_info">
                <span>상영관타입: <%= Theaterroomtype %></span>
                <span>상영일: <%= Moviedate %></span>
                <span>남은 좌석수: <%= remainseat %></span>
                <span>극장명: <%= Theater %></span>
            </div>
            <form class="enroll_info" method="post" action="quiz2_check.jsp">
                <p>청소년일반 : <input type="text" name="id" required></p>
                <p>청소년프리미엄 : <input type="text" name="lname" required></p>
                <p>성인일반 : <input type="text" name="id" required></p>
                <p>성인프리미엄 : <input type="text" name="lname" required></p>
                <p>현금 : <input type="text" name="id" required></p>
                <p>포인트 : <input type="text" name="lname" required></p>
                <p><input class="button" type="submit" value="예매"></p>
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