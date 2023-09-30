<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<jsp:include page="/views/fragments/_plugins.jsp"></jsp:include>
<body>
<%-- <h6>Visitors: ${applicationScope.visitors}</h6> --%>
	<div class="container-fluid h-100 px-0">
		<jsp:include page="/views/fragments/_nav.jsp"></jsp:include>
		<jsp:include page="${view}"></jsp:include>
	</div>
</body>

<script type="text/javascript">
	$(window).on('load', function() {
		var langValue = '${lang}';
		if(langValue === 'vi'){
			$('#changeLanguage').prop('checked', true);
		}else{
			$('#changeLanguage').prop('checked', false);
		}
	});
	
/* 	$(window).on('beforeunload', function() {
		var langValue = '${lang}';
		if(langValue === 'vi'){
			$('#changeLanguage').prop('checked', true);
		}else{
			$('#changeLanguage').prop('checked', false);
		}
        
    }); */

	$('#changeLanguage').on('change', function(){
		$.ajax({
		  url: '/assignment/change-language',
		  type: 'GET'
		}).then(function (response) {
		    window.location.reload(); 
		
		}).fail(function (xhr, status, error) {
		    // Request failed or had an error, handle it here
		    console.error('Error:', error);
		});
		
	})
</script>
</html>