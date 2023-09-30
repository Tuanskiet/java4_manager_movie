<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <div id="dashboard" class="col-2">
            <a
              href="#"
              class="dashboard-item d-flex align-items-center text-decoration-none"
            >
              <div
                class="icon d-flex justify-content-center align-items-center"
              >
                <i class="bi bi-speedometer2 fs-5"></i>
              </div>
              <span class="name ps-3">Dashboard</span>
            </a>
            <a
               href="${pageContext.request.contextPath}/admin/videos"
              class="dashboard-item d-flex align-items-center text-decoration-none"
            >
              <div
                class="icon d-flex justify-content-center align-items-center"
              >
                <i class="bi bi-collection-play"></i>
              </div>
              <span class="name ps-3">Videos</span>
            </a>
            <a
               href="${pageContext.request.contextPath}/admin/users"
              class="dashboard-item d-flex align-items-center text-decoration-none"
            >
              <div
                class="icon d-flex justify-content-center align-items-center"
              >
                <i class="bi bi-clock-history"></i>
              </div>
              <span class="name ps-3">Users</span>
            </a>
            <a
               href="${pageContext.request.contextPath}/admin/reports"
              class="dashboard-item d-flex align-items-center text-decoration-none" >
              <div class="icon d-flex justify-content-center align-items-center" >
                <i class="bi bi-hand-thumbs-up"></i>
              </div>
              <span class="name ps-3">Reports</span>
            </a>
            <a
              href="#"
              class="dashboard-item d-flex align-items-center text-decoration-none"
            >
              <div
                class="icon d-flex justify-content-center align-items-center"
              >
                <i class="bi bi-bar-chart"></i>
              </div>
              <span class="name ps-3">Charts</span>
            </a>
            <a
              href="#"
              class="dashboard-item d-flex align-items-center text-decoration-none"
            >
              <div
                class="icon d-flex justify-content-center align-items-center"
              >
                <i class="bi bi-caret-down"></i>
              </div>
              <span class="name ps-3">More</span>
            </a>
            <a
              href="#"
              class="dashboard-item d-flex align-items-center text-decoration-none"
            >
              <div
                class="icon d-flex justify-content-center align-items-center"
              >
                <i class="bi bi-gear"></i>
              </div>
              <span class="name ps-3">Settings</span>
            </a>
            <a
              href="#"
              class="dashboard-item d-flex align-items-center text-decoration-none"
            >
              <div
                class="icon d-flex justify-content-center align-items-center"
              >
                <i class="bi bi-question-circle"></i>
              </div>
              <span class="name ps-3">Help</span>
            </a>
          </div>