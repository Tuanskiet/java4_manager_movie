$(document).ready(function () {
  /*   $('.like-icon').on('click', function () {
        $(this).toggleClass('like-icon-active');
     });  */ 

     $("#file").change(function(){
      $("#file-name").text($(this)[0].files[0].name)
      getImgData(this);
	  });
	  
	  function getImgData(chooseFile) {
	      const files = chooseFile.files[0];
	      if (files) {
	          const fileReader = new FileReader();
	          fileReader.readAsDataURL(files);
	          fileReader.addEventListener("load", function () {
	              const imgUpload = $("#img_upload");
	              const info_default = $(".main_upload .icon_upload");
	              imgUpload.attr("src", this.result);
	              info_default.css( "display", "none" );
	          });    
	      }
	  }
});


