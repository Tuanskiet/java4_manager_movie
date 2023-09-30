<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="main_content" class="container-fluid">
  <div class="container-fluid wrap-form">
    <form action="${pageContext.request.contextPath}/change-password" method="post" class="form-change-password form-common">
      <p class="title_form mb-1">Change Password </p>
      <c:if test="${error != null}">
           <span class="text-danger label-custom">* <c:out value="${error}" /> </span>
      </c:if>
      <div class="row">
        <div class="col">
          <label class="form-title label-custom">Username : </label>
          <input required placeholder="" type="text" class="form-control" value="${sessionScope.CURRENT_USER.id}">
        </div>
        <div class="col">
          <label class="form-title label-custom">Current Password : </label>
          <input required name="current_pass" type="password" class="form-control" value="${current_pass}">
        </div>
      </div>

      <div class="row">
        <div class="col">
          <label class="form-title label-custom">New Password : </label>
          <input required name="new_pass" type="password" class="form-control">
        </div>
        <div class="col">
          <label class="form-title label-custom">Confirm New Password : </label>
          <input required name="comfirm_new_pass" type="password" class="form-control">
        </div>
      </div>

      <button class="btn-custom ">Submit</button>
      <p class="signin text-center">Already have an acount ? 
      	<a class="link-custom" href="${pageContext.request.contextPath}/sign-in">Signin</a>
      </p>
  </form>
  </div>
</div>

      
      

