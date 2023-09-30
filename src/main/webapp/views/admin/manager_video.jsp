<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="contents" class="col-10 mt-3">
	<!-- Tabs navs -->
	<ul class="nav nav-tabs mb-3" id="ex1" role="tablist">
		<li class="nav-item" role="presentation"><a
			class="nav-link active" id="ex1-tab-1" data-bs-toggle="tab"
			data-bs-target="#ex1-tabs-1" href="#ex1-tabs-1" role="tab"
			aria-controls="ex1-tabs-1" aria-selected="true">Video
				Edition</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="ex1-tab-2" data-bs-toggle="tab" data-bs-target="#ex1-tabs-2"
			href="#ex1-tabs-2" role="tab" aria-controls="ex1-tabs-2"
			aria-selected="false">Video list</a></li>
	</ul>
	<!-- Tabs navs -->

	<!-- Tabs content -->
	<div class="tab-content" id="ex1-content">
		<div class="tab-pane fade show active" id="ex1-tabs-1" role="tabpanel"
			aria-labelledby="ex1-tab-1">

			<form class="form">
				<div class="wrapper_upload">
					<div class="main_upload ">
						<img id="img_upload" src="" alt="" class="img-fluid">
						<div class="icon_upload">
							<i class="bi bi-cloud-plus text-center"></i>
							<p>Browse File to upload!</p>
						</div>
					</div>
					<label for="file" class="footer_upload">
						<p id="file-name" class="text-truncate">Not selected file</p>
					</label> <input id="file" type="file"
						accept="image/gif, image/jpeg, image/png">
				</div>

				<div class="row  mb-3">
					<div class="col">
						<label for="email" class=" label-custom">Youtube ID : </label> 
						<input name="id" type="text" class="form-control" required="required">
						<c:if test="${error != null}">
			                 <span class="text-danger label-custom">* <c:out value="${error}" /> </span>
			            </c:if>
					</div>
					<div class="col">
						<label for="password" class=" label-custom">Video Title :
						</label> <input name="title" type="text" class="form-control" required="required">
					</div>
				</div>
				<div class="row  mb-3">
					<div class="col">
						<label for="email" class=" label-custom">Poster : </label> <input
							type="text" name="poster" class="form-control" required="required">
					</div>
					<div class="col">
						<label for="password" class=" label-custom">View count : </label>
						<input name="views" type="number" class="form-control" required="required">
					</div>
				</div>
				<div class="row ">
					<div class="col">
						<input id="active" name="status" value="true" type="radio" class="" checked> <label
							for="active" class="label-custom">Active</label> 
							<input
								id="unactive"  name="status" value="false" type="radio" class="ms-5" required="required"> 
								<label
							for="unactive" class="label-custom">UnActive</label>
					</div>

				</div>
				<div class="row">
					<div class="col">
						<label class=" label-custom">Description :
						</label>
						<textarea name="description" type="text" class="form-control" rows="2" required="required"></textarea>
					</div>
				</div>

				<div class="row text-end">
					<div class="col px-4 action_admin">
						<button 
						 	id="btnCreate"
                        	formaction="${pageContext.request.contextPath}/admin/videos/create"
						 class="btn btn-primary btn-create mt-3 ">Create</button>
						<button 
							id="btnUpdate"
                        	formaction="${pageContext.request.contextPath}/admin/videos/update"
						 	class="btn btn-primary btn-update mt-3 ms-2">Update</button>
						<button 
							id="btnDelete"
	                        formaction="${pageContext.request.contextPath}/admin/videos/delete"
							class="btn btn-primary btn-delete mt-3 ms-2">Delete</button>
						<button type="reset" class="btn btn-primary btn-reset mt-3 ms-2">Reset</button>
					</div>
				</div>
			</form>


		</div>
		<div class="tab-pane fade" id="ex1-tabs-2" role="tabpanel"
			aria-labelledby="ex1-tab-2">
			<table class="table align-middle mb-0 ">
				<thead class="">
					<tr>
						<th>Youtube ID</th>
						<th>Video Title</th>
						<th>View Count</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${listVideos}" var="item">
					<tr>
						<td>
							<p class="fw-normal mb-1"><c:out value="${item.id}"/></p>
						</td>
						<td>
							<p class="fw-normal mb-1 text-truncate">
								<c:out value="${item.title}"/>
							</p>
						</td>
						<td>
							<c:out value="${item.views}"/>
						</td>
						<td>
							<c:choose>
							  <c:when test="${item.isActive()}">
							    <span class="badge badge-success rounded-pill d-inline">
									Active
								</span>
							  </c:when>
							  <c:otherwise>
							    <span class="badge badge-danger rounded-pill d-inline">
									UnActive
								</span>
							  </c:otherwise>
							</c:choose>
							
						</td>
						<td>
							<button
								onclick="editVideo('<c:out value='${item.id}'/>')"
								class="btn btn-primary btn-update mt-3 ms-2">Edit</button>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>

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
	<!-- Tabs content -->
</div>


<script>
var urlCreateVideo = '/assignment/admin/videos/create';
var urlEditVideo = '/assignment/admin/videos/edit';


function editVideo(videoId){
	$.ajax({
	  url: urlEditVideo,
	  type: "GET",
	  data: {videoId : videoId}
	}).then(function (data) {	
		showDataEdit(data);
	}).fail(function (error) {
	   
	});
	
	$('#ex1-tabs-2').removeClass('active show');
	$('#ex1-tabs-1').addClass('active show');
	$('#ex1-tab-2').removeClass('active');
	$('#ex1-tab-1').addClass('active');

}

function showDataEdit(data){
	$("input[name='id']").val(data.id);
	$("input[name='title']").val(data.title);
	$("input[name='poster']").val(data.poster);
	$("input[name='views']").val(data.views);
	$("textarea[name='description']").val(data.description);
	if(data.active){
		$("#active").prop("checked", true);
		$("#unactive").prop("checked", false);
	}else{
		$("#unactive").prop("checked", true);
		$("#active").prop("checked", false);
	}
}

$('#btnUpdate').on('click', (event)=>{
	event.preventDefault();
	alertSuccess('Cập nhật thành công!')
	.then((confirmed) => {
	  if (confirmed) {
		  $("#btnUpdate").unbind('click').click(); 
	  } 
	});
});

$('#btnDelete').on('click', ()=>{
	event.preventDefault();
	alertWarning('Bạn có muốn xóa không !')
	.then((confirmed) => {
	  if (confirmed) {
		  alertSuccess('Xoá thành công!')
		  setTimeout(() =>{
			  $("#btnDelete").unbind('click').click(); 
	      }, 2000);
	  } 
	});
});

$('#btnCreate').on('click', (event)=>{
	event.preventDefault();
	var data = {
		id : $("input[name='id']").val(),
		title :$("input[name='title']").val(),
		poster : $("input[name='poster']").val(),
		views : $("input[name='views']").val(),
		description:  $("textarea[name='description']").val()	
	}
	
	$.ajax({
	  url: urlCreateVideo,
	  type: "POST",
	  data: data
	}).then(function (response) {	
		if(response === 'CREATED'){
			 alertSuccess('Thêm mới thành công!');
		}else if(response === 'DUPLICATE'){
			alertFail('Thêm mới thất bạị!', 'Video Id đã tồn tại!');
		}
	}).fail(function (error) {
		alertFail('Thêm mới thất bạị!', error);
	});
});

function alertSuccess(message) {
  return new Promise((resolve) => {
    Swal.fire({
      icon: 'success',
      text: message,
      confirmButtonText: 'Ok!'
    }).then((result) => {
      if (result.isConfirmed) {
        resolve(true);
      } else {
        resolve(false);
      }
    });
  });
}

function alertWarning(message) {
  return new Promise((resolve) => {
    Swal.fire({
      icon: 'warning',
      text: message,
      confirmButtonText: 'Xóa',
      showCancelButton: true
    }).then((result) => {
      if (result.isConfirmed) {
        resolve(true);
      } else {
        resolve(false);
      }
    });
  });
}

function alertFail(title, message) {
	Swal.fire({
	      icon: 'error',
	      title: title,
	      text : message,
	      confirmButtonText: 'Đóng'
	 });
}
</script>