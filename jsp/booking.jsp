<%-- 개봉일 순서 --%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>open_now</title>
<link rel="stylesheet" type="text/css" href="../css/booking.css">
</head>
<body>
<%@ include file="dbconn.jsp" %>
<div class="Entire">
    <header class="header">
        <span>영화 예매</span>
    </header>
    <nav>
        <ul class="movie_list" style="list-style: none"> 
            <%
            request.setCharacterEncoding("utf-8");
            String theater = request.getParameter("theater");
            String title = request.getParameter("title");
            String date = request.getParameter("date");
            ResultSet rs = null ;
            Statement stmt = null;              
            try {
                out.println(theater);
                out.println(title);
                out.println(date);
                String sql = "select A.ROOM_NAME as RN, A.SCREENING_CALENDAR as SC, A.REMAINING_OF_SEATS as ROS, A.POINT_NAME as PN from THEATERROOM A, (select B.MOVIE_ID as MI , B.MOVIE_NAME from MOVIE B where B.MOVIE_NAME ='영화4') where A.SCREENING_CALENDAR='2022-03-05' and A.POINT_NAME='대전극장' and A.MOVIE_ID=MI";                
                //String sql = "select ROOM_NAME from THEATERROOM";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);
                //out.println(rs.next());
                
                while(rs.next()) {
                    //String movieno = rs.getString("MOVIE_ID");
            %>
                    <li>
                        <form class="movie_list_item" name="register" action="several_info.jsp" method="POST">
                            <input placeholder="asdf" class="movie_button" type="submit" name="no" value="상세정보">
                                <span>상세정보 확인 ⬆ 클릭</span>
                                <% 
                                out.println(rs.getString("RN")); 
                                out.println(rs.getString("SC")); 
                                out.println(rs.getString("ROS"));
                                out.println(rs.getString("PN"));
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