<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="main_content"  >
  <div class="container-fluid wrap-form">
    <div class="form-common">
      <p class="title_form mb-1">Forgot Password </p>
      <div class="mb-2">
          <label class="label-custom">  Email 
        	  <span class="text-danger label-custom">*</span>
           </label>
          <input  
           name="email" 
           type="text" class="form-control" required placeholder="Enter your email">
      </div>      
      <button class="btn-custom btnSubmit">Send Email</button>
      <p class="signin text-center">Don't have an account? 
    		  <a class="link-custom" href="${pageContext.request.contextPath}/sign-up">Sign up now</a> 
      </p>
    </div>
  </div>
</div>
<script>
	var urlSignIn = '/assignment/sign-in';
	var urlSendMail = '/assignment/sendmail-reset-pass';
	$('.btnSubmit').on('click', ()=>{
		const emailInput = $('input[name="email"]').val();
		var confirmSendMail =  alertSuccess("Mật khẩu đã được gửi, vui lòng kiểm tra email của bạn");
		let data = {email : emailInput}
		sendMailAjax(urlSendMail, data);
		confirmSendMail.then((confirmed) => {
		  if (confirmed) {
			  window.location.href = urlSignIn;
		  } 
		});
	});
	
	function sendMailAjax(url, data ){
		$.ajax({
		  url: url,
		  type: 'POST',
		  data: data
		}).then(function (response) {
		    // Request was successful, do something with the response
		
		}).fail(function (xhr, status, error) {
		    // Request failed or had an error, handle it here
		    console.error('Error:', error);
		});
		
	}
	
	
	function alertSuccess(message) {
	  return new Promise((resolve) => {
	    Swal.fire({
	      icon: 'success',
	      text: message,
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
</script>