<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/adminstaticFiles.jsp" />

</head>

<body>
	<jsp:include page="/WEB-INF/views/include/adminheader.jsp" />
	<div class="main">
		<div class="wrapper">
			<div class="section">
				<div class="top_navbar">
					<div class="hamburger">
						<a href="#"> <i class="fa-solid fa-bars"></i>
						</a>
					</div>
				</div>
				<div class="welcome1 d-flex align-items-center">
					<div class="profile p-2 m-5">
						<img
							src="https://1.bp.blogspot.com/-vhmWFWO2r8U/YLjr2A57toI/AAAAAAAACO4/0GBonlEZPmAiQW4uvkCTm5LvlJVd_-l_wCNcBGAsYHQ/s16000/team-1-2.jpg"
							alt="profile_picture">
					</div>
					<div class="p-2 m-4" id="userInfo">
						<div class="p-2 m-4" id="userInfo">
							<h1>${userName}님 환영합니다.</h1>
						</div>
					</div>
				</div>
				<div class="container-fluid"
					style="background-color: white; margin: 50px; width: 92%; min-height: 600px;">

					<div class="row-lg-9">
						<div class="container-fluid py-4">
							<div class="row">
								<div class="col-12">

									<div class="card my-4">
										<div
											class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
											<div
												class="bg-gradient-info shadow-success border-radius-lg pt-4 pb-3">
												<h6 class="text-white text-capitalize ps-3">일별 요약</h6>
											</div>
										</div>
										<div class="card-body px-0 pb-2">
											<div class="table-responsive p-0">
												<table
													class="table align-items-center justify-content-center mb-0">
													<thead>
														<tr>
															<td>과목</td>
															<td>출석</td>
															<td>지각</td>
															<td>결석</td>
															<td>휴가</td>
															<td>미출근</td>
														</tr>
													</thead>
													<tbody>
													 <c:forEach var="attSumDailyTotal" items="${attSumDailyTotal}">
														<tr>
															<td>${attSumDailyTotal.subjectName}</td>
															<td>${attSumDailyTotal.attendanceSum}</td>
															<td>${attSumDailyTotal.lateSum}</td>
															<td>${attSumDailyTotal.absenceSum}</td>
															<td>${attSumDailyTotal.leaveSum}</td>
															<td>${attSumDailyTotal.totalCountBySubject-attSumDailyTotal.leaveSum-attSumDailyTotal.attendanceSum-attSumDailyTotal.lateSum-attSumDailyTotal.absenceSum}</td>
														</tr>
														</c:forEach>

													</tbody>
												</table>
											</div>
										</div>

									</div>
									<div class="m-2" style="height: 100px"></div>
									<div class="card my-4">
										<div
											class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
											<div
												class="bg-gradient-info shadow-success border-radius-lg pt-4 pb-3">
												<h6 class="text-white text-capitalize ps-3">new 휴가 신청 목록</h6>
											</div>
										</div>
										<div class="card-body px-0 pb-2">
											<div class="table-responsive p-0">
												<table
													class="table align-items-center justify-content-center mb-0">
													  <thead>
					                    <tr>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">처리결과</th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">글번호</th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">작성자</th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">제목</th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">작성날짜</th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">휴가종류</th>
					                     
					                    </tr>
					                  </thead>
													<tbody>
														<c:forEach var="reason" items="${subAttList}">
											<tr>
												<td class="text-xs font-weight-bold mb-0 text-center">${reason.result}</td>
												<td class="text-xs font-weight-bold mb-0 text-center">${reason.subAttNo}</td>
												
												<td class="pc">
													<p class="text-xs font-weight-bold mb-0 text-center">${reason.userName}</p>
													<p class="text-xs font-weight-bold mb-0 text-center">${reason.userId}</p>
												</td>
												<td class="pc"><h6 class="text-xs font-weight-bold mb-0 text-center">
												<a href='<c:url value="/admin/reasondetail/${reason.subAttNo}"/>'>${reason.title}</a></h6></td>
												<td class="pc"><h6 class="text-xs font-weight-bold mb-0 text-center">${reason.writeDate}</h6></td>
												<td class="text-center">
													<c:choose>
													<c:when test="${reason.subStatus eq '조퇴'}"><span class="badge badge-sm bg-gradient-success">조퇴</span></c:when>
													<c:when test="${reason.subStatus eq '공가'}"><span class="badge badge-sm bg-gradient-info">공가</span></c:when>
													<c:when test="${reason.subStatus eq '외출'}"><span class="badge badge-sm bg-gradient-warning">외출</span></c:when>
													<c:when test="${reason.subStatus eq '경조사'}"><span class="badge badge-sm bg-gradient-secondary">경조사</span></c:when>
													</c:choose>
												</td>
											</tr>
										</c:forEach>
													</tbody>
												</table>
											</div>
										</div>

									</div>


								</div>
							</div>

						</div>
					</div>

				</div>
				<jsp:include page="/WEB-INF/views/include/footer.jsp" />
			</div>
			<jsp:include page="/WEB-INF/views/include/adminsidebar.jsp" />
		</div>
	</div>

</body>
</html>