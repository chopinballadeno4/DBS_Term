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
        <%-- 영화 예매를 위한 페이지이다. 선택한 영화의 정보를 그대로 가져와주고 추가적인 정보들을 받아준다. --%>
        <ul class="movie_list" style="list-style: none"> 
            <%
            request.setCharacterEncoding("utf-8");
            String theater = request.getParameter("theater");
            String title = request.getParameter("title");
            String date = request.getParameter("date");
            ResultSet rs = null ;
            Statement stmt = null;              
            try {
                 %> <%
                String sql = "select A.ROOM_NAME as RN, A.SCREENING_CALENDAR as SC, A.REMAINING_OF_SEATS as ROS, A.POINT_NAME as PN from THEATERROOM A, (select B.MOVIE_ID as MI , B.MOVIE_NAME from MOVIE B where B.MOVIE_NAME ='"+title+"') where A.SCREENING_CALENDAR='"+date+"' and A.POINT_NAME='"+theater+"' and A.MOVIE_ID=MI";                
                //String sql = "select ROOM_NAME from THEATERROOM";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);
                //out.println(rs.next());
                
                while(rs.next()) {
                    String tempRN = rs.getString("RN");
                    String tempSC = rs.getString("SC");
                    String tempROS = rs.getString("ROS");
                    String tempPN = rs.getString("PN");
                    String tempAABC = tempRN+"_"+tempSC+"_"+tempROS+"_"+tempPN+"_"+title ;
                    out.println(tempAABC);
                %>
                    <li>
                        <form class="movie_list_item" name="register" action="booking_info.jsp" method="POST">
                            <input class="movie_button" type="submit" name="no" value="<%= tempAABC%>">
                                <span>예매 취소 ⬆ 클릭</span>
                                <%
                                out.println(tempRN); 
                                out.println(tempSC); 
                                out.println(tempROS);
                                out.println(tempRN);
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