<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.lang}" scope="request"/>
<fmt:setBundle basename="global" scope="request" />

<div id="nav_main" class="mb-1 ">
   <div class="row justify-content-between">
     <div class="col-2 d-flex align-items-center px-0">
       <div class="hambuger ms-3">
         <i class="bi bi-list fs-3"></i>
       </div>
       <a href="${pageContext.request.contextPath}/index" class="main_logo d-flex align-items-center text-decoration-none ">
         <img src="${pageContext.request.contextPath}/dist/images/logo_a.png" alt="logo"  width="32px" >
         <span class="fs-4 fw-bold">TopFilm</span>
       </a>
     </div> 

     <div class="col-6 d-flex align-items-center">
       <form class="search_form w-100 d-flex align-items-center justify-content-between  ">
         <i class="bi bi-search"></i>
         <input type="text" name="" id=""  placeholder="Type here ">
         <div class="voice_icon d-flex justify-content-center align-items-center ms-2 ">
           <i class="bi bi-mic"></i>
         </div>
       </form>
     </div>
     <div class="col-2  info_user d-flex align-items-center justify-content-end">
       <i class="bi bi-clock-history fs-5 me-3"></i>
       <div class="noti position-relative">
         <i class="bi bi-bell fs-5  me-3"></i>
         <div class="noti_number"></div>
       </div>
       <div class="pointer">
         <img src="${pageContext.request.contextPath}/dist/images/user1.jpg" alt="" width="40px" class="rounded-circle dropdown-toggle"  data-bs-toggle="dropdown">
        <c:choose>
     <c:when test="${sessionScope.CURRENT_USER != null}">
         <ul class="dropdown-menu dropdown-menu-end dropdown-account">
          <!--  <li>
             <a class="dropdown-item" type="button">
               <i class="bi bi-pen me-2"></i>
               Manager profile
             </a>
           </li> -->
           <li>
             <a href="${pageContext.request.contextPath}/change-password" class="dropdown-item" type="button">
               <i class="bi bi-pen me-2"></i>
               <fmt:message key="option.change_pass"/> 
             </a>
           </li>
           <li>
             <a href="${pageContext.request.contextPath}/forgot-password" class="dropdown-item" type="button">
               <i class="bi bi-question-circle me-2"></i>
               <fmt:message key="option.forgot_pass"/> 
             </a>
           </li>
           <li>
             <a href="${pageContext.request.contextPath}/sign-in" class="dropdown-item" type="button">
               <i class="bi bi-arrow-clockwise me-2"></i>
               <fmt:message key="option.change_account"/> 
             </a>
           </li>
           <li>
             <a href="${pageContext.request.contextPath}/logout" class="dropdown-item" type="button">
               <i class="bi bi-box-arrow-left me-2"></i>
               <fmt:message key="option.logout"/> 
             </a>
           </li>
         </ul>
     </c:when>
     <c:otherwise>
         <ul class="dropdown-menu dropdown-menu-end dropdown-account">
           <li>
             <a href="${pageContext.request.contextPath}/sign-in" class="dropdown-item" type="button">
               <i class="bi bi-box-arrow-in-right me-2"></i>
               <fmt:message key="option.sign_in"/> 
             </a>
           </li>
           <li>
             <a href="${pageContext.request.contextPath}/sign-up" href="${pageContext.request.contextPath}/change-password" class="dropdown-item" type="button">
               <i class="bi bi-person-plus me-2"></i>
               <fmt:message key="option.signup"/> 
             </a>
           </li>
         </ul>
     </c:otherwise>
 </c:choose>
       </div>
       <label class="ui-switch ms-3">
         <input id="changeLanguage" type="checkbox">
         <div class="slider">
           <div class="circle"></div>
         </div>
       </label>
     </div>
     
   </div>
</div>