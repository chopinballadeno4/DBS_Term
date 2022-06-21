<%-- 개봉일 순서 --%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>open_now</title>
<link rel="stylesheet" type="text/css" href="../css/opendateseq.css">
</head>
<body>
<%@ include file="dbconn.jsp" %>
<div class="Entire">
    <header class="header">
        <span>개봉일 순서</span>
    </header>
    <nav>
        <ul class="movie_list" style="list-style: none"> 
            <%-- 개봉일 순서대로 정렬하기 위해 Order로 옵션을 준다. 필요한 필드들을 가져와서 필드로 선언해준다. --%>
            <%
            request.setCharacterEncoding("utf-8");
            ResultSet rs = null ;
            Statement stmt = null;              
            try {
                String sql = "SELECT MOVIE_NAME, OPENING_DATE, DIRECTOR, ACTOR, RUNNING_TIME, VIEWING_GRADE, MOVIE_ID, GENRE_ID, BOOKING_NUMBER, ACCUMULATE_NUMBER, MOVIE_INFO FROM MOVIE ORDER BY OPENING_DATE";           
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);
                while(rs.next()) {
                    String movieno = rs.getString("MOVIE_ID");
            %>
            <%-- movie의 고유 number가 필요해서 movieno에 넣어준다. --%>
            <li>
            <%-- form 태그를 통해 원하는 정보들을 검색하기 위한 movie number를 보내준다. --%>
                <form class="movie_list_item" name="register" action="several_info.jsp" method="POST">
                    <input placeholder="asdf" class="movie_button" type="submit" name="no" value=<%=rs.getString("MOVIE_ID")%>>
                        <span>상세정보 확인 ⬆ 클릭</span>
                        <% 
                        out.println(rs.getString("MOVIE_NAME")); %>
                        <span class="date">개봉일: <%out.println(rs.getString("OPENING_DATE"));%></span><%
                        out.println(rs.getString("DIRECTOR"));
                        out.println(rs.getString("ACTOR"));
                        out.println(rs.getString("RUNNING_TIME"));
                        out.println(rs.getString("VIEWING_GRADE"));
                        %>
                    </input>
                    <%-- 원하는 정보들을 화면에 뿌려주기 위해 가져온 sql에서 필드에 값을 뿌려준다. while문을 통해 전체 데이터를 뿌려준다 --%>
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