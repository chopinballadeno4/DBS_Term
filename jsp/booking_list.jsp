<%-- 개봉일 순서 --%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>open_now</title>
<link rel="stylesheet" type="text/css" href="../css/bookinglist.css">
</head>
<body>
<%@ include file="dbconn.jsp" %>
<div class="Entire">
    <header class="header">
        <span>예매 내역</span>
    </header>
    <nav>
        <ul class="movie_list" style="list-style: none"> 
            <%
            request.setCharacterEncoding("utf-8");
            ResultSet rs = null ;
            Statement stmt = null;
            String start = request.getParameter("start");
            String end = request.getParameter("end");
             
            try {
                String sql = "select BOOKING_NUMBER, CASH_PAY, MEMBER_ID, ROOM_NAME, POINT_NAME, MOVIE_ID, PVIEWING_NUMBER, BOOK_DATE, SCREENING_CALENDAR, POINT_PAY from BOOKING_LIST where SCREENING_CALENDAR between '"+start+"' and '"+end+"'";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);
                           
                while(rs.next()) {
                    String BookingNum = rs.getString("BOOKING_NUMBER");
                %>
                    <li>
                        <form class="movie_list_item" name="register" action="cancel_result.jsp" method="POST">
                            <input class="movie_button" type="submit" name="no" value="<%= BookingNum%>">
                                <span>예매 내역 확인 ⬆ 클릭</span>
                                <%
                                out.println(BookingNum); 
                                out.println(rs.getString("CASH_PAY")); 
                                out.println(rs.getString("MEMBER_ID"));
                                out.println(rs.getString("ROOM_NAME"));
                                out.println(rs.getString("POINT_NAME"));
                                out.println(rs.getString("MOVIE_ID"));
                                out.println(rs.getString("PVIEWING_NUMBER"));
                                out.println(rs.getString("SCREENING_CALENDAR"));
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