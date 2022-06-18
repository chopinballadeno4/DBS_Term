# DBS_term

2022 데이터베이스설계 텀프로젝트

services.msc -> Apache Tomcat 9.0 Tomcat9

## 구현기능

1. 개봉일 순서와 예매 순서로 검색 (상세 정보 검색도 포함) 10점
2. 예매를 위한 검색 15점
3. 예매를 위한제약 조건 (시간, 좌석수, 관람료 처리) 10점
4. 결제 방법 처리 (현금결제, 포인트 결제) 5점
5. 예매가 성공적으로 처리 될 때 10점
6. 예매 취소가 성공적으로 처리 될때 15점
7. 시작 날짜와 종료 날짜 사이의 내역 조회 (결과 정렬 방식도 포함) 15점

## 기능

1. session으로 정보 전달. 세션에 올리기 : session.setAttribute("id",id); 세션에서 가져오기 : session.getAttribute("id");
2. 리다이렉트. response.sendRedirect("quiz2_change.html");
