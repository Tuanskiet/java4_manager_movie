<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="main_content" class="main_detail_page container-fluid px-0">
	<div class="container ">
		<div class="row  gx-5">
			<div class="col-8">
				<div id="main_video">
					<div class="video_frame ">
						<iframe width="100%" height="400"
							src="https://www.youtube.com/embed/${videoDetail.id}"
							frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
							allowfullscreen></iframe>
					</div>
					<div class="interact_group mt-2">
						<div class="action_video_detail">
							<i class="bi bi-chat-square-dots me-2"></i> <span>Comment</span>
						</div>

						<div class="group_valuate">
							<div class="action_video_detail">
								<div class="action_like d-flex">
									<button class="btn_default likeOrUnlike">
									<c:choose>
									    <c:when test="${videoDetail.isLiked}">
									        <i class="bi bi-hand-thumbs-up-fill text-danger likeBtn"></i>
									    </c:when>
									    <c:otherwise>
									        <i class="bi bi-hand-thumbs-up likeBtn"></i>
									    </c:otherwise>
									</c:choose>				
									</button>
									<span class="totalLike" > <c:out value="${videoDetail.totalLike}"/></span>
								</div>
								<div class="action_dislike">
									<button class="btn_default">
										<i class="bi bi-hand-thumbs-down"></i>
									</button>
								</div>
							</div>

							<div class="action_video_detail ms-2" onclick="shareVideo()">
								<i class="bi bi-share me-2"></i> <span>Share</span>
							</div>
						</div>
					</div>


					<div class="name_video mt-2">
						<h5>
							<c:out value="${videoDetail.title}"/>
						</h5>
					</div>
				</div>

				<div id="comment">
					<div class="total_comment">
						<span class="fs-4">892 Comments</span>
					</div>
					<form class="form_comment">
						<div class="d-flex align-items-center">
							<img src="${pageContext.request.contextPath}/dist/images/user1.jpg" alt="" width="40px" class="rounded-circle">
							<input class="input_comment" type="text"
								placeholder="Write comment ...">
						</div>
						<div class="btn_comment text-end mt-2">
							<button class="btn_cancel">Cancel</button>
							<button class="btn_summit_comment">Comment</button>
						</div>
					</form>
					<hr>

					<div class="all_comment">
						<div class="cmt_group">
							<img src="${pageContext.request.contextPath}/dist/images/user1.jpg" alt="" width="40px"
								class="rounded-circle dropdown-toggle img_user_comment">
							<div class="parent_comment ms-2">
								<div class="info_comment">
									<span class="name_user">tuankiet@gmail.com</span> <span
										class="dot"> <i class="bi bi-dot"></i>
									</span> <span class="date_comment"> 2 days ago </span>
								</div>
								<div class="content_comment">Lorem ipsum, dolor sit amet
									consectetur adipisicing elit. Culpa ut maxime iusto?</div>
								<div class="action_comment mt-2">
									<i class="bi bi-hand-thumbs-up"></i> <i
										class="bi bi-hand-thumbs-down"></i>

									<div class="reply_btn  ms-4">
										<i class="bi bi-chat-square-dots"></i> <span>Reply</span>
									</div>
								</div>
							</div>

							<div class="form_reply">
								<div class="d-flex align-items-center ms-5 mt-2">
									<img src="${pageContext.request.contextPath}/dist/images/user1.jpg" alt="" width="40px"
										class="rounded-circle"> 
										<input class="input_comment"
										type="text" placeholder="Write comment ...">
								</div>
							</div>
						</div>

						<div class="cmt_group mt-4">
							<img src="${pageContext.request.contextPath}/dist/images/user1.jpg" alt="" width="40px"
								class="rounded-circle  img_user_comment">
							<div class="parent_comment ms-2">
								<div class="info_comment">
									<span class="name_user">tuankiet@gmail.com</span> <span
										class="dot"> <i class="bi bi-dot"></i>
									</span> <span class="date_comment"> 2 days ago </span>
								</div>
								<div class="content_comment">Lorem ipsum, dolor sit amet
									consectetur adipisicing elit. Culpa ut maxime iusto?</div>
								<div class="action_comment mt-2">
									<i class="bi bi-hand-thumbs-up"></i> <i
										class="bi bi-hand-thumbs-down"></i>

									<div class="reply_btn  ms-4">
										<i class="bi bi-chat-square-dots"></i> <span>Reply</span>
									</div>
								</div>
							</div>
							<div class="cmt_group ms-5 mt-4 ">
								<img src="${pageContext.request.contextPath}/dist/images/user1.jpg" alt="" width="40px"
									class="rounded-circle img_user_comment">
								<div class="parent_comment ms-2">
									<div class="info_comment">
										<span class="name_user">tuankiet@gmail.com</span> <span
											class="dot"> <i class="bi bi-dot"></i>
										</span> <span class="date_comment"> 2 days ago </span>
									</div>
									<div class="content_comment">Lorem ipsum, dolor sit amet.
										Culpa ut maxime iusto?</div>
									<div class="action_comment mt-2">
										<i class="bi bi-hand-thumbs-up"></i> <i
											class="bi bi-hand-thumbs-down"></i>

										<div class="reply_btn  ms-4">
											<i class="bi bi-chat-square-dots"></i> <span>Reply</span>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

			<div id="video_porpose" class="col-4">
				<c:forEach items="${listVideos}" var="item">
					<a href="${pageContext.request.contextPath}/detail?id=${item.id}"
						 class="video_item row w-100 mb-2">
						<div class="col-7">
							<div class="img ">
								<img src="${item.poster}"
									alt="err" class="img-fluid rounded-2">
							</div>
						</div>
						<div class="col-5 px-0">
							<div class="details  d-flex justify-content-between flex-column">
								<div class="name">
									<span class="text-truncated"><c:out value="${item.title}"/></span>
								</div>
								<div class="type">
									<span class="text-blur">Âm nhạc</span>
								</div>
								<div class="info">
									<span class="text-blur"><c:out value="${item.views}"/> Views</span> <span class="dot">
										<i class="bi bi-dot"></i>
									</span> 
									<span class="text-blur">
										<c:out value="${item.totalLike}"/> Likes
									</span>
								</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>

		</div>
	</div>
</div>
<input id="idVideo" type="hidden" value="${videoDetail.id}"></input>
<script type="text/javascript">
	var urlLikeOrUnlike = '/assignment/video/like-or-unlike';
	var urlSignIn = '/assignment/sign-in';
	var urlSendMailShareVideo = '/assignment/sendmail-share-video';
	$('.likeOrUnlike').on('click', ()=>{
		$.ajax({
		  url: urlLikeOrUnlike,
		  type: 'POST',
		  data: {id : $('#idVideo').val()}
		}).done(function(response) {
		    if( response == 'UNAUTHORIZED'){
		    	alertUnAuthorited('Bạn cần phải đăng nhập để có thể sử dụng chức năng này!')
		    		.then((confirmed) => {
			  		  if (confirmed) {
						  window.location.href = urlSignIn;
					  } 
				});
		    }else{
		    	updateHtmlAfterLike();
		    }
		}).fail(function (error) {
		    console.log('Error:', error );
		});
	});
	
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
	
	function updateHtmlAfterLike(){
		let currentLike = $('.totalLike').text();
		let btnLike = $('.likeBtn');
		if(btnLike.hasClass('bi-hand-thumbs-up-fill')){ // unlike 
			btnLike.removeClass('bi-hand-thumbs-up-fill')
			btnLike.removeClass('text-danger')
			btnLike.addClass('bi-hand-thumbs-up');
			$('.totalLike').text(parseInt(currentLike) - 1)
		}else{  // like 
			btnLike.addClass('bi-hand-thumbs-up-fill')
			btnLike.addClass('text-danger')
			btnLike.removeClass('bi-hand-thumbs-up')
			$('.totalLike').text(parseInt(currentLike) + 1)
		}
	}
	
	/* ahare video */
async function shareVideo(){
 	 const { value: emails } = await Swal.fire({
		  title: 'Enter your friend\' email',
		  input: 'text',
		  showCancelButton: true,
		  inputAttributes: {
		    autocapitalize: 'off',
		    autocorrect: 'off'
		  },
		  inputAutoTrim: true
 	 
	});
	if (emails){
		let data = {emails : emails, videoId : $('#idVideo').val()}
		sendMailAjax(urlSendMailShareVideo, data);
		Swal.fire({
		  icon: 'success',
		  title: 'Gửi thành công!'
		})
	}
}
	
function sendMailAjax(url, data){
	$.ajax({
	  url: url,
	  type: 'POST',
	  data: data
	}).then(function (response) {
		if( response == 'UNAUTHORIZED'){
	    	alertUnAuthorited('Bạn cần phải đăng nhập để có thể sử dụng chức năng này!')
	    		.then((confirmed) => {
		  		  if (confirmed) {
					  window.location.href = urlSignIn;
				  } 
			});
	    }
	}).fail(function (xhr, status, error) {
	   
	    console.error('Error:', error);
	});
	
}
	
	
</script>