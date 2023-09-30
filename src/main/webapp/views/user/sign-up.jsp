<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="signup_form" scope="request" />


    <div id="main_content" class="container-fluid">
        <div class="container-fluid wrap-form">
          <form  action="${pageContext.request.contextPath}/sign-up" method="post" class="form_register form-common">
            <p class="title_form mb-1"><fmt:message key="form.title"/> </p>
            <c:if test="${error != null}">
                 <span class="text-danger label-custom">* <c:out value="${error}" /> </span>
            </c:if>
            <div class="row">
              <div class="col">
                <label class="form-title label-custom"><fmt:message key="form.label.username"/> </label>
                <input name="id" required type="text" class="form-control" value="${userResgiter.id}">
              </div>
              <div class="col">
                <label class="form-title label-custom"><fmt:message key="form.label.fullname"/> </label>
                <input  name="fullname" required type="text" class="form-control" value="${userResgiter.fullname}">
              </div>
            </div>
  
            <div class="">
                <label class="form-title label-custom">Email </label>
                <input  name="email" required type="text" class="form-control" value="${userResgiter.email}">
            </div>
            <div class="">
                <label class="form-title label-custom"><fmt:message key="form.label.password"/></label>
                <input  name="password" required  type="password" class="form-control" value="${userResgiter.password}">
            </div>  
            <div class="">
              <label class="form-title label-custom"><fmt:message key="form.label.re_password"/> </label>
              <input  name="re_password" required type="password" class="form-control">
            </div>      
            <button class="btn-custom "><fmt:message key="form.title"/></button>
            <p class="signin text-center"><fmt:message key="form.already_account"/> <a class="link-custom" href="${pageContext.request.contextPath}/sign-in">
            	<fmt:message key="form.label.sign_in"/> 
            </a> </p>
        </form>
        </div>

      </div>
