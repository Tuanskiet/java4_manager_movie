<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

        <div id="contents" class="col-10 mt-3">
            <!-- Tabs navs -->
            <ul class="nav nav-tabs mb-3" id="ex1" role="tablist">
              <li class="nav-item" role="presentation">
                <a
                  class="nav-link active"
                  id="ex1-tab-1"
                  data-bs-toggle="tab"
                  data-bs-target="#ex1-tabs-1"
                  href="#ex1-tabs-1"
                  role="tab"
                  aria-controls="ex1-tabs-1"
                  aria-selected="true"
                  >Favorites</a
                >
              </li>
              <li class="nav-item" role="presentation">
                <a
                  class="nav-link"
                  id="ex1-tab-2"
                  data-bs-toggle="tab"
                  data-bs-target="#ex1-tabs-2"
                  href="#ex1-tabs-2"
                  role="tab"
                  aria-controls="ex1-tabs-2"
                  aria-selected="false"
                  >Favorite Users</a
                >
              </li>
              <li class="nav-item" role="presentation">
                <a
                  class="nav-link"
                  id="ex1-tab-3"
                  data-bs-toggle="tab"
                  data-bs-target="#ex1-tabs-3"
                  href="#ex1-tabs-2"
                  role="tab"
                  aria-controls="ex1-tabs-3"
                  aria-selected="false"
                  >Share Friends</a
                >
              </li>
            </ul>
            <!-- Tabs navs -->

            <!-- Tabs content -->
            <div class="tab-content" id="ex1-content">
              <div
                class="tab-pane fade show active"
                id="ex1-tabs-1"
                role="tabpanel"
                aria-labelledby="ex1-tab-1"
              >
                <table  class="table align-middle mb-0">
                  <thead class="">
                    <tr>
                      <th>Video Title</th>
                      <th>Favorite Count</th>
                      <th>Lastest Date</th>
                      <th>Oldest Date</th>
                    </tr>
                  </thead>
                  <tbody>
                   <c:forEach items="${listFavouriteRP}" var="item">
                    <tr>
                      <td>
                        <p class="fw-normal mb-1"><c:out value='${item.videoTitle}'/></p>
                      </td>
                      <td>
                        <p class="fw-normal mb-1"><c:out value='${item.numberOfLikes}'/></p>
                      </td>
                      <td>
                        <p class="fw-normal mb-1">
                        	<fmt:formatDate value='${item.latestDate}' pattern="yyyy-MM-dd" />
                        </p>
                      </td>
                      <td>
                        <p class="fw-normal mb-1">
                        	<fmt:formatDate value='${item.oldestDate}' pattern="yyyy-MM-dd" />
                        </p>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
               
              </div>
              <div
                class="tab-pane fade"
                id="ex1-tabs-2"
                role="tabpanel"
                aria-labelledby="ex1-tab-2"
              >
              <div class="d-flex align-items-center">
                  <div class="float-start"><label>Video Title : </label></div>
                  <select id="favouriteByVideo" class="form-select-custom" aria-label="Default select example">
                    <c:forEach items="${listVideoTitle}" var="item">
                    	<option value="${item.key}">
                    		<c:out value='${item.value}'/>
                    	</option>
                    </c:forEach>
                  </select>
              </div>
              <table id="tblFavouriteByVideo" class="table align-middle mb-0">
                <thead class="">
                  <tr>
                    <th>Username</th>
                    <th>Fullname</th>
                    <th>Email</th>
                    <th>Favorite Date</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${listUserFavouriteByVideo}" var="item">
	                  <tr>
	                    <td>
	                      <p class="fw-normal mb-1">
	                      	<c:out value='${item.user.id}'/>
	                      </p>
	                    </td>
	                    <td>
	                      <p class="fw-normal mb-1">
	                      	<c:out value='${item.user.fullname}'/>
	                      </p>
	                    </td>
	                    <td>
	                      <p class="fw-normal mb-1">
	                      	<c:out value='${item.user.email}'/>
	                      </p>
	                    </td>
	                    <td>
	                      <p class="fw-normal mb-1">
	                      	<fmt:formatDate value='${item.likeDate}' pattern="yyyy-MM-dd" />
	                      </p>
	                    </td>
	                  </tr>
                  </c:forEach>
                </tbody>
              </table>
                
              </div>

              <div
                class="tab-pane fade"
                id="ex1-tabs-3"
                role="tabpanel"
                aria-labelledby="ex1-tab-3"
              >
                <div class="d-flex align-items-center">
                  <div class="float-start"><label>Video Title : </label></div>
                  <select id="shareFriend" class="form-select-custom" aria-label="Default select example">
                    <c:forEach items="${listVideoTitle}" var="item">
                    	<option value="${item.key}">
                    		<c:out value='${item.value}'/>
                    	</option>
                    </c:forEach>
                  </select>
              </div>
                <table id="tblShareFriend" class="table align-middle mb-0">
                  <thead class="">
                    <tr>
                      <th>Sender Name</th>
                      <th>Sender Email</th>
                      <th>Recieve Email</th>
                      <th>Sent Date</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${shares}" var="item">
                    <tr>
                      </td>
                      <td>
                        <p class="fw-normal mb-1">
                        	<c:out value='${item.user.fullname}'/>
                        </p>
                      </td>
                      <td>
                        <p class="fw-normal mb-1">
                        	<c:out value='${item.user.email}'/>
                        </p>
                      </td>
                      <td>
                        <p class="fw-normal mb-1">
                        	<c:out value='${item.email}'/>
                        </p>
                      </td>
                      <td>
                        <p class="fw-normal mb-1">
                        	<fmt:formatDate value='${item.shareDate}' pattern="yyyy-MM-dd" />
                        </p>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
                
              </div>
            </div>
            <!-- Tabs content -->
          </div>
        </div>
        
<script>
$('#favouriteByVideo').on('change', function() {
	var dataTable = $('#tblFavouriteByVideo').DataTable({
	    destroy: true,
	    info: true,
	    autoWidth: false,
	    searching: false,
	    ordering: false,
	    lengthChange: false,
	    paging: false,
	    info: false,
	    columns: [
	        { data: 'user.id' }, 
	        { data: 'user.fullname' },
	        { data: 'user.email' }, 
	        { data: 'likeDate' } 
		    ]
		});
	
	    var videoId = $(this).val();
	    $.ajax({
	        url: '/assignment/admin/reports/favourite-user?videoId=' + videoId,
	        method: 'GET',
	        contentType: 'application/json'
	    }).then(function(data) {
	    	dataTable.clear().rows.add(data).draw();
	    }).fail(()=>{
	    	$('#tblFavouriteByVideo').dataTable().fnClearTable();
	    });
	
	});



 $('#shareFriend').on('change', function() {
	var dataTable = $('#tblShareFriend').DataTable({
	    destroy: true,
	    info: true,
	    autoWidth: false,
	    searching: false,
	    ordering: false,
	    lengthChange: false,
	    paging: false,
	    info: false,
	    columns: [
	        { data: 'user.fullname' }, 
	        { data: 'user.email' },
	        { data: 'email' }, 
	        { data: 'shareDate' } 
		    ]
		});

	    var videoId = $(this).val();
	    $.ajax({
	        url: '/assignment/admin/reports/share-friends?videoId=' + videoId,
	        method: 'GET',
	        contentType: 'application/json'
	    }).then(function(data) {
	    	dataTable.clear().rows.add(data).draw();
	    }).fail(()=>{
	    	$('#tblShareFriend').dataTable().fnClearTable();
	    });
	}); 
</script>