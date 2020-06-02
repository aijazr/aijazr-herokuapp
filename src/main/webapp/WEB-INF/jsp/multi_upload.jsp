<%--
  Created by IntelliJ IDEA.
  User: Dhaval
  Date: 27-09-2017
  Time: 04:22 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="ui" tagdir="/WEB-INF/tags" %>

<ui:templete>
    <jsp:attribute name="head_area"/>
    <jsp:attribute name="body_area">
	                    <c:choose>
	                        <c:when test='${empty(user)}'>
        <section class="dashboard-counts no-padding-bottom center">
            <div class="container-fluid">
                <div class="row bg-white has-shadow">
                	<div class="col-xl-12" style="text-align:center">
	                <p style="font-size: 20px; color: #ed3424">You need to Login First</p>
			<img src="https://developers.google.com/identity/images/btn_google_signin_dark_normal_web.png" title="Sign in with Google" onclick="location.href = '${pageContext.request.contextPath}/api/oauth/google/redirect'"><br><br><br>
                    </div>
                </div>
            </div>
        </section>
				</c:when>
                        	<c:otherwise>
        <ul class="breadcrumb">
            <div class="container-fluid">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">New Upload</li>
            </div>
        </ul>
          <!-- Forms Section-->
          <section class="forms">
            <style>
   .divarea {
            position: relative;
        }

.showcount {
            position: absolute;
            top: 3px;
            right: 7px;
            color: #0f5b79;
            font-size: 11px;
            border-radius: 3px;
            background-color: #f2f2f2;
        }
        textarea {
            height: 140px!important;
        }
 </style>
              <div class="container-fluid">
                  <div class="row">
                      <div class="col-lg-12">
                          <div class="card">
                              <div class="card-header d-flex align-items-center">
                                  <h3 class="h4">Enter Information</h3>
                              </div>
                              <div class="card-body">
                                  <form method="post" id="uploadform" action="${pageContext.request.contextPath}/api/drive/upload">
                                      <div class="form-group">
                                          <label class="form-control-label">URL(s)</label>
                               <div class="form-group divarea">
                            <textarea id="lks" class="form-control" onkeyup="getcount(this,true)" onpaste="getcount(this,true)" oncut="getcount(this,true)"
                                placeholder="Enter File Url(s).."></textarea>
                            <b class="showcount"></b>
                        </div>
                                      </div>
                                      <div class="form-group">
                                          <label class="form-control-label">Filename(s)</label>
                                          <div class="form-group divarea">
                            <textarea id="nms" class="form-control" onkeyup="getcount(this,false)" onpaste="getcount(this,false)" oncut="getcount(this,false)"
                                placeholder="Enter File Names(s).."></textarea>
                            <b class="showcount"></b>
                        
                        </div>
                                          <span class="help-block-none">File name is optional.</span>
                                      </div>
                                      <div class="form-group row">
                                          <div class="col-sm-12 offset-sm-5">
                                              <input type="button" onclick="check(this)" value = "Check" class="btn btn-primary">
                                              <button type="submit" id="submit" class="ml-1 btn btn-primary">Upload</button>
                                       </div>
                                      </div>
                                              <div class="mt-4 overflow-auto " style="font-size: 12px;" id="checkurls"></div>
                                  </form>
                                  
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </section>
	                        </c:otherwise>
	                    </c:choose>
    </jsp:attribute>
    <jsp:attribute name="javascript">
        <script src="${pageContext.request.contextPath}/js/submit_mupload.js"></script>
    </jsp:attribute>
</ui:templete>
