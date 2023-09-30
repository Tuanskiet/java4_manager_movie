<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/views/fragments/_plugins.jsp"></jsp:include>
<body>
	<div class="container-fluid h-100 px-0">
		<jsp:include page="/views/fragments/_nav.jsp"></jsp:include>
		 <div class="row h-100 mx-0">
		 		<jsp:include page="/views/fragments/_dashboard_admin.jsp"></jsp:include>
				<jsp:include page="${view}"></jsp:include>
		 </div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function(){
		var listDashboardItem = $('#dashboard .dashboard-item');
		var currentUrl = window.location.pathname;
	
		 $.each(listDashboardItem, function(index, element) {
			 	 var nextUrl = $(this).attr('href');
				 if(currentUrl === nextUrl){
				 $(this).addClass('active');
			}
		 });
	});
</script>
</html>


