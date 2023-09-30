<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="main_content" class="container-fluid px-0">
	<div class="row h-100 mx-0">
		<div id="dashboard" class="col-2 ">
			<a href="${pageContext.request.contextPath}/index"
				class="dashboard-item active  d-flex align-items-center text-decoration-none">
				<div class="icon d-flex justify-content-center align-items-center">
					<i class="bi bi-speedometer2 fs-5"></i>
				</div> <span class="name ps-3">Home</span>
			</a> <a href="#"
				class="dashboard-item  d-flex align-items-center text-decoration-none">
				<div class="icon d-flex justify-content-center align-items-center">
					<i class="bi bi-play-btn"></i>
				</div> <span class="name ps-3">Short</span>
			</a> <a href="#"
				class="dashboard-item d-flex align-items-center text-decoration-none">
				<div class="icon d-flex justify-content-center align-items-center">
					<i class="bi bi-collection-play"></i>
				</div> <span class="name ps-3">Library</span>
			</a> <a id="history_dash" href="#"
				class="dashboard-item d-flex align-items-center text-decoration-none">
				<div class="icon d-flex justify-content-center align-items-center">
					<i class="bi bi-clock-history"></i>
				</div> <span class="name ps-3">History</span>
			</a> 
			<a id="likes_dash" href="#"
				class="dashboard-item d-flex align-items-center text-decoration-none">
				<div class="icon d-flex justify-content-center align-items-center">
					<i class="bi bi-hand-thumbs-up"></i>
				</div> <span class="name ps-3">Likes</span>
			</a> <a href="#"
				class="dashboard-item d-flex align-items-center text-decoration-none">
				<div class="icon d-flex justify-content-center align-items-center">
					<i class="bi bi-music-note-list"></i>
				</div> <span class="name ps-3">Playlists</span>
			</a> <a href="#"
				class="dashboard-item d-flex align-items-center text-decoration-none">
				<div class="icon d-flex justify-content-center align-items-center">
					<i class="bi bi-cloud-arrow-down"></i>
				</div> <span class="name ps-3">Download</span>
			</a> <a href="#"
				class="dashboard-item d-flex align-items-center text-decoration-none">
				<div class="icon d-flex justify-content-center align-items-center">
					<i class="bi bi-caret-down"></i>
				</div> <span class="name ps-3">More</span>
			</a> <a href="#"
				class="dashboard-item d-flex align-items-center text-decoration-none ">
				<div class="icon d-flex justify-content-center align-items-center">
					<i class="bi bi-gear"></i>
				</div> <span class="name ps-3">Settings</span>
			</a> <a href="#"
				class="dashboard-item d-flex align-items-center text-decoration-none">
				<div class="icon d-flex justify-content-center align-items-center">
					<i class="bi bi-clock-history"></i>
				</div> <span class="name ps-3">Report</span>
			</a> <a href="#"
				class="dashboard-item d-flex align-items-center text-decoration-none">
				<div class="icon d-flex justify-content-center align-items-center">
					<i class="bi bi-question-circle"></i>
				</div> <span class="name ps-3">Help</span>
			</a>


		</div>

		<div id="contents"
			class=" col-10  d-flex  flex-wrap">
		<c:forEach items="${listVideos}" var="item">
			<div class="content_item mt-3 pointer">
					<div class="card">
						<img class="card-img-top"
							src="${item.poster}"
							alt="Title">
						<div class="card-body">
							<div class="action  d-flex justify-content-between mb-2">
								<div class="left-group d-flex">
									<a href="${pageContext.request.contextPath}/detail?id=${item.id}"
										class="action-icon  me-2"> <i class="bi bi-play-fill"></i>
									</a>
	
									<div class="action-icon  me-2">
										<i class="bi bi-plus"></i>
									</div>
									
									<c:choose>
									  <c:when test="${item.isLiked}">
									    <div id="<c:out value='${item.id}'/>" class="action-icon like-icon like-icon-active" 
									    	onclick="likeOrUnlike('<c:out value='${item.id}'/>')">
											<i class="bi bi-hand-thumbs-up"></i>
										</div>
									  </c:when>
									  <c:otherwise>
									    <div id="<c:out value='${item.id}'/>" 
										    class="action-icon like-icon " 
										    onclick="likeOrUnlike('<c:out value='${item.id}'/>')">
											<i class="bi bi-hand-thumbs-up"></i>
										</div>
									  </c:otherwise>
									</c:choose>
														
									
								</div>
	
								<div class="action-icon ">
									<i class="bi bi-share"></i>
								</div>
							</div>
							<h4 class="card-title"><c:out value="${item.title}"/></h4>
							<div class="info">
							<span><c:out value="${item.views}"/> views</span>
								<span class="text-blur"></span> 
								<span class="dot">
									<i class="bi bi-dot"></i>
								</span> 
								<span class="text-blur">
									<span class="totalLike<c:out value='${item.id}'/>"><c:out value="${item.totalLike}"/></span>
									 <span>Likes</span>
								 </span>
							</div>
	
						</div>
					</div>
				</div>
			</c:forEach>
			
			<c:if test="${totalItems > 0}">
				<div id="pagination" class="text-center w-100 mt-3">
					<div>Total items : 
						<c:out value="${totalItems}"/> - Page 
						<c:out value="${currentPage}"/> of <c:out value="${totalPages}"/></div>
					<nav aria-label="Page navigation example">
						<ul class="pagination_custom d-flex  justify-content-center mt-2">
							<li class="">
								<c:choose>
							        <c:when test="${currentPage == 1}">
							            <a href="#">
							                <span aria-hidden="true">&laquo;</span>
							            </a>
							        </c:when>
							        <c:otherwise>
							            <a href="${pageContext.request.contextPath}/index?page=${currentPage - 1}">
							                <span aria-hidden="true">&laquo;</span>
							            </a>
							        </c:otherwise>
							    </c:choose>
							</li>
							<li class="d-flex">
								 <c:forEach var="page" begin="1" end="${totalPages}">
								 	 <a href="${pageContext.request.contextPath}/index?page=${page}" 
								 	 	class="${page == currentPage ? 'active' : ''}">
								 	 	<c:out value="${page}"/>
								 	 </a>
								 </c:forEach>
							</li>
							<li class="">
								<c:choose>
							        <c:when test="${currentPage == totalPages}">
							            <a href="#">
							                <span aria-hidden="true">&raquo;</span>
							            </a>
							        </c:when>
							        <c:otherwise>
							            <a href="${pageContext.request.contextPath}/index?page=${currentPage +1}">
							                <span aria-hidden="true">&raquo;</span>
							            </a>
							        </c:otherwise>
							    </c:choose>
							</li>
						</ul>
					</nav>
				</div>
			</c:if>
			<c:if test="${totalItems <= 0}">
				<div class="text-center w-100 mt-3">Danh sách rỗng !</div>
			</c:if>
		</div>
	</div>
</div>

<script>
	var urlLikeOrUnlike = '/assignment/video/like-or-unlike';
	var urlSignIn = '/assignment/sign-in';
	var urlHistory = '/assignment/history';
	var urlLikes = '/assignment/like-storage';
	
	$('#history_dash').on('click', (e)=>{
		getFormWithAjax(urlHistory);
	});
	$('#likes_dash').on('click', (e)=>{
		getFormWithAjax(urlLikes);
	})
	
	function likeOrUnlike(videoId){
		$.ajax({
		  url: urlLikeOrUnlike,
		  type: 'POST',
		  data: {id : videoId}
		}).done(function(response) {
		    if( response == 'UNAUTHORIZED'){
		    	alertUnAuthorited('Bạn cần phải đăng nhập để có thể sử dụng chức năng này!')
		    		.then((confirmed) => {
			  		  if (confirmed) {
						  window.location.href = urlSignIn;
					  } 
				});
		    }else{
				updateHtmlAfterLike(videoId);	
		    }
		}).fail(function (error) {
		    console.log('Error:', error );
		});
	}
	
	function alertUnAuthorited(message) {
	  return new Promise((resolve) => {
	    Swal.fire({
	      icon:'warning',
	      text: message,
	      showCancelButton: true,
	      confirmButtonText: 'Quay về đăng nhập!'
	    }).then((result) => {
	      if (result.isConfirmed) {
	        resolve(true);
	      } else {
	        resolve(false);
	      }
	    });
	  });
	}
	
	function updateHtmlAfterLike(videoId){
		
		let currentLike = $('.totalLike' + videoId).text();
		
		var btnLike = $('#'+videoId);
/* 		console.log($('#'+videoId)) */
		
		if(btnLike.hasClass('like-icon-active')){ // unlike 
			$('.totalLike'+ videoId).text(parseInt(currentLike) - 1)
			btnLike.removeClass('like-icon-active')
		}else{  // like 
			$('.totalLike'+ videoId).text(parseInt(currentLike) + 1)
			btnLike.addClass('like-icon-active')
		}
	}
	
	function getFormWithAjax(urlReturn){
		$.ajax({
		  url: urlReturn,
		  type: 'GET',
		  data: {}
		}).done(function(response) {
		    if( response == 'UNAUTHORIZED'){
		    	alertUnAuthorited('Bạn cần phải đăng nhập để có thể sử dụng chức năng này!')
		    		.then((confirmed) => {
			  		  if (confirmed) {
						  window.location.href = urlSignIn;
					  } 
				});
		    }else{
		    	window.location.href = urlReturn
		    }
		}).fail(function (error) {
		    console.log('Error:', error );
		});
	}
</script>
