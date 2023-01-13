<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<style>
html, body {
	width: 100%; height: 100%;
}
#cardNewsHead {
	width: 100%;
	padding:5px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;  /* 말줄임 적용 */
}
#cardNewsbody{
	width: 100%;
	padding:5px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}

</style>


<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<script>
		/* 커뮤니티 */
		$(document).ready(function() {
			$.ajax({
				url : "/myapp/community/communityMiniView",
				type : "GET",
				datatype : "html",
				success : function(data) {
					$('#communityMiniView').html(data);
				}
			});
		});
		
		/* 출석 */
		$(document).ready(function() {
			$.ajax({
				url : "/myapp/attendance/attendanceMiniView",
				type : "GET",
				datatype : "html",
				success : function(data) {
					$('#attendanceMiniView').html(data);
				}
			});
		});
		
		/* 공지 */
		$(document).ready(function() {
			$.ajax({
				url : "/myapp/board/boardminiview",
				type : "GET",
				datatype : "html",
				success : function(data) {
					$('#boardMiniView').html(data);
				}
			});
		});
		
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				headerToolbar : {
		            left : 'prev,next today',
		            center : 'title',
		            right : 'dayGridMonth'
		         },
		        locale: "ko",
				initialView: 'dayGridMonth',
				events: [
							
							// end 에는 끝 시간을 넣으면 그 시간까지 일정이 잡힘
							{
								title : '1학기 휴복학 신청기간',
								start : '2023-01-09',
								end : '2023-01-20',
								backgroundColor : '#01411C',
								borderColor : '#01411C',
								display : 'auto'
							},
							// display 타입 종류 
							{
								title : '전과 접수기간',
								start : '2023-01-18',
								end : '2023-01-25',
								backgroundColor : '#01411C',
								borderColor : '#01411C',
								display : 'auto'
							},
							{
								title : '전과 면접',
								start : '2023-01-27',
								backgroundColor : '#01411C',
								borderColor : '#01411C',
								display : 'block'
							},
							{
								title : '학사학위취득유예신청기간',
								start : '2023-01-11',
								end : '2023-01-14',
								backgroundColor : '#01411C',
								borderColor : '#01411C',
								display : 'auto'
							}
							
				]
			});
			calendar.render();
		});
	</script>

	<!-- sidebar 토글 -->
	<div class="main">
		<div class="wrapper">
			<div class="section">
				<div class="top_navbar">
					<div class="hamburger">
						<a href="#"> <i class="fa-solid fa-bars"></i>
						</a>
					</div>
				</div>

			<!-- 00님 환영합니다 -->	
			<div class="welcome d-flex align-items-center">
				<div class="profile p-5 my-5">
					<img src="<c:url value="/static/images/profile2.jpeg"/>" alt="profile_picture">
				</div>
				<div class="p-2 m-4 align-self-center" id="userInfo">
					<h2 style="color:white; padding-top:20px;">${userName} 님    환영합니다.</h2>
					<p>${major}
						${grade}학년 <a href="/user/update"><i class="material-icons">settings</i></a>
					</p>
				</div>
			</div>
			<!-- 메인 컨테이너 (메인에 넣을 것은 이 안에 작성) -->
			<div class="container-fluid" style="background-color:white; margin:25px; width:95%; min-height: 800px;">
				
				<!-- 공지사항 4개 -->
				<div class="container-fluid py-4">
			      <div class="row" id="boardMiniView">
			      <!-- 공지사항 forEach  -->
			      </div>
			    </div>
			    <div class="row">
				    <!-- 출석 미니뷰 -->
					<div class="col-6 col-md">
						<div id="attendanceMiniView" style="width:100%; height:25%">
						</div>
						<div class="card mb-5">
							<div
								class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
								<div
									class="shadow-success border-radius-lg pt-4 pb-3" style="background: #01411C;
										background: -webkit-linear-gradient(to left, #00573F, #01411C);
										background: linear-gradient(to left, #00573F, #01411C);">
									<h6 class="text-white text-capitalize ps-3">학사 일정</h6>
								</div>
							</div>
							<div class="card-body px-0 pb-2">
								<div class="table-responsive p-0" >
									<table class="table align-items-center mb-0 text-center"  >
									</table>
									<div style="padding:0px 50px; margin-bottom:20px">
										<div id="calendar"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 커뮤니티 미니뷰 -->
					<div class="col-6 col-md">
						<div id="communityMiniView" style="width: 100%; height: 100%">
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
			</div>
			<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
		</div>
	</div>
	
</body>
</html>