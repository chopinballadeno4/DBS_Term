<%-- 개봉일 순서 --%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>coming_now</title>
<link rel="stylesheet" type="text/css" href="../css/bookingresult.css">
</head>
<body>
<%@ include file="dbconn.jsp" %>
<div class="Entire">
    <header class="header">
        <span>예매 결과</span>
    </header>
    <main class="main">
        <%-- 예매 결과를 나타내어 주는 페이지이다. --%>
            <%       
                        ResultSet rs = null ;
                Statement stmt = null;  
            try {
            request.setCharacterEncoding("utf-8");
            int CN = Integer.parseInt(request.getParameter("CN"));
            int CP = Integer.parseInt(request.getParameter("CP"));
            int AN = Integer.parseInt(request.getParameter("AN"));
            int AP = Integer.parseInt(request.getParameter("AP"));
            int Cash = Integer.parseInt(request.getParameter("Cash"));
            int Point = Integer.parseInt(request.getParameter("Point"));
            
            String Theaterroomtype = String.valueOf(session.getAttribute("Theaterroomtype"));
            String Moviedate = String.valueOf(session.getAttribute("Moviedate")) ;
            String remainseat = String.valueOf(session.getAttribute("remainseat"));
            String Theater = String.valueOf(session.getAttribute("Theater"));
            String Titlle = String.valueOf(session.getAttribute("Title"));
            int Titlen = Titlle.charAt(2) - '0';
            String CancelDate = null;
            int normaltotal = 0;
            int pretotal = 0;


                stmt = conn.createStatement();
                boolean key = true;
                if(CN+CP+AN+AP > 10) {
                    key=false;
                %><span class="ment"> 예매 실패 10장 이상 예매는 불가능 합니다!</span><%
                } else {
                    normaltotal = CN*8000+AN*10000;
                    pretotal = CP*13000+AP*15000;
                    if((normaltotal+pretotal) == (Cash+Point)) {
                        key=true;
                    } else if(normaltotal+pretotal > Cash+Point) {
                        key=false;
                    %><span class="ment"> 예매 실패 ! 금액이 부족합니다! </span><%
                    } else {
                        key=false;
                    %><span class="ment"> 예매 실패 ! 금액이 초과 되었습니다! </span><%
                    }
                }
                if(key) {
                    String sql = "INSERT INTO BOOKING_LIST (CASH_PAY, MEMBER_ID, ROOM_NAME, POINT_NAME, MOVIE_ID, PVIEWING_NUMBER, BOOK_DATE, SCREENING_CALENDAR, POINT_PAY) VALUES ("+Cash+", 10, '"+Theaterroomtype+"', '"+Theater+"', "+ Titlen +", 120,'2022-03-02','2022-03-05',"+Point+")";
                    //out.println(sql);
                    out.println("영화제목:"+Titlle);
                    out.println("극장:"+Theater);
                    out.println("상영관:"+Theaterroomtype);
                    out.println("날짜:"+Moviedate);                
                    rs = stmt.executeQuery(sql);
                    %><span class="ment"> 예매 성공 ! </span><%
                }
                %>
                <button class="button"> 홈으로 돌아가기 </button>
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