<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="contents" class="col-10 mt-3">
              <!-- Tabs navs -->
              <ul class="nav nav-tabs mb-3" id="ex1" role="tablist">
                <li id="nav-item-1" class="nav-item" role="presentation">
                  <a
                    class="nav-link active"
                    id="ex1-tab-1"
                    data-bs-toggle="tab" data-bs-target="#ex1-tabs-1"
                    href="#ex1-tabs-1"
                    role="tab"
                    aria-controls="ex1-tabs-1"
                    aria-selected="true"
                    >User Edition</a
                  >
                </li>
                <li  id="nav-item-2" class="nav-item" role="presentation">
                  <a
                    class="nav-link"
                    id="ex1-tab-2"
                    data-bs-toggle="tab" data-bs-target="#ex1-tabs-2"
                    href="#ex1-tabs-2"
                    role="tab"
                    aria-controls="ex1-tabs-2"
                    aria-selected="false"
                    >User List</a
                  >
                </li>
              </ul>
              <!-- Tabs navs -->

              <!-- Tabs content -->
              <div class="tab-content" id="ex1-content">
                <div class="tab-pane fade show active"
                  id="ex1-tabs-1"
                  role="tabpanel"
                  aria-labelledby="ex1-tab-1">
                  
                  <form id="myForm" action="" method="post" class="form">
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
                      </label> 
                      <input  id="file" type="file" accept="image/gif, image/jpeg, image/png"> 
                    </div>
  
                    <div class="row  mb-3">
                      <div class="col">
                        <label  class=" label-custom">Username : </label>
                        <input name="id" type="text" class="form-control"  >
                        <!-- <div  id="emailHelp" class="form-text text-danger">*This email is already in use!</div> -->
                      </div>
                      <div class="col">
                        <label for="password" class=" label-custom">Password : </label>
                        <input name="password" type="text" class="form-control"   >
                      </div>
                    </div>
                    <div class="row  mb-3">
                      <div class="col">
                        <label for="email" class=" label-custom">Fullname : </label>
                        <input name="fullname" type="text" class="form-control"  >
                      </div>
                      <div class="col">
                        <label for="password" class=" label-custom">Email : </label>
                        <input name="email" type="text" class="form-control"  >
                      </div>
                    </div>
                    <div class="row ">
                      <div class="col">
                        <input name="role" value="false" id="role_user" type="radio" class="" name="role"   checked>
                        <label for="role_user" class="label-custom" >User</label>
                        <input name="role"  value="true" id="role_admin" type="radio" class="ms-5"  name="role" >
                        <label for="role_admin" class="label-custom">Adimin</label>
                      </div>
                    </div>
                    <div class="row text-end">
                      <div class="col px-4 action_admin">
                        <button 
                        		id="btnUpdate"
                        		formaction="${pageContext.request.contextPath}/admin/users/update"
                       			class="btn btn-primary btn-update mt-3 ms-2">Update</button>
                        <button 
                       		 id="btnDelete"
	                         formaction="${pageContext.request.contextPath}/admin/users/delete"
	                         class="btn btn-primary btn-delete mt-3 ms-2">Delete</button>
                      </div>	
                    </div>
                  </form>


                </div>
                <div class="tab-pane fade" id="ex1-tabs-2" role="tabpanel" aria-labelledby="ex1-tab-2">
                  <table class="table align-middle mb-0 ">
                    <thead class="">
                      <tr>
                        <th>#</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Fullname</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listUsers}" var="item">
                      <tr>
                        <td>
                          <div class="d-flex align-items-center">
                            <img
                                src="https://mdbootstrap.com/img/new/avatars/8.jpg"
                                alt=""
                                style="width: 45px; height: 45px"
                                class="rounded-circle"
                                />
                          </div>
                        </td>
                        <td>
                          <p class="fw-normal mb-1"><c:out value="${item.id}"/></p>
                        </td>
                        <td>
                          <p class="fw-normal mb-1"><c:out value="${item.password}"/></p>
                        </td>
                        <td>
                          <p class="fw-normal mb-1"><c:out value="${item.fullname}"/></p>
                        </td>
                        <td><c:out value="${item.email}"/></td>
                        <td>
                          <span class="badge badge-success rounded-pill d-inline">
                          		<c:out value="${item.isAdmin() ? 'Admin' : 'User'}"/>
                          </span>
                        </td>
                        <td>
                          <button
                          		 onclick="editUser('<c:out value='${item.id}'/>')"
                          		 class="btn btn-primary btn-update mt-3 ms-2">Edit
                          </button>
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
var urlEditUser = '/assignment/admin/users/edit';
var urlUpdateUser = '/assignment/admin/users/update';
function editUser(userId){
	$.ajax({
	  url: urlEditUser,
	  type: "GET",
	  data: {userId : userId}
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
	$("input[name='password']").val(data.password);
	$("input[name='fullname']").val(data.fullname);
	$("input[name='email']").val(data.email);
	if(data.admin){
		$("#role_admin").prop("checked", true);
		$("#role_user").prop("checked", false);
	}else{
		$("#role_user").prop("checked", true);
		$("#role_admin").prop("checked", false);
	}
}
/* myForm.on("submit", function(event) {
	  event.preventDefault();
}); */
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
		  $("#btnDelete").unbind('click').click(); 
	  } 
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

</script>