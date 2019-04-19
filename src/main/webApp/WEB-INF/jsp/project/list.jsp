<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" import="java.util.*" %>


<html lang="en">
    <jsp:include page="../include/header.jsp"/>

     <script>
            function post(path, params, method) {
            	method = method || "post";

            	var form = document.createElement("form");
            	form.setAttribute("method", method);
            	form.setAttribute("action", path);

            	for ( var key in params) {
            		if (params.hasOwnProperty(key)) {
            			var hiddenField = document.createElement("input");
            			hiddenField.setAttribute("type", "hidden");
            			hiddenField.setAttribute("name", key);
            			hiddenField.setAttribute("value", params[key]);

            			form.appendChild(hiddenField);
            		}
            	}

            	document.body.appendChild(form);
            	form.submit();
            }

            $('#addProjectModal').submit(function(e){
                e.preventDefault();
                $.post("project/add", sentData, function(receivedData){
                    useTheResponseData(receivedData);
                });
            });


     </script>

    <body>
        <main role="main">
          <div class="container">
            <div class="card card-list">
              <div class="card-header">
                <div class="float-left">
                    <h4>List of Projects</h4>
                </div>
                <div class="float-right">
                   <button type="button" class="btn btn-primary float-right" onclick="location.href='/project/form'">Add Project</button>
                </div>
              </div>

              <div class="card-body card-content">
                <div class="table-responsive">
                    <table id="project-table" class="table table-striped table-bordered" style="width:100%">
                      <thead class="custom-table-head">
                         <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Action</th>
                         </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${projects}" var ="project">
                            <tr>
                              <th scope="row">${project.id}</th>
                              <td>${project.name}</td>
                              <td>${project.description}</td>
                              <td>${project.startDate}</td>
                              <td>${project.endDate}</td>
                              <td>
                                 <button type="button" class="btn btn-primary btn-sm" data-toggle="tooltip" data-placement="top" title="View" onclick="location.href='/project/profile/${project.id}/'"><i class="fas fa-envelope-open-text"></i></button>
                                 <button type="button" class="btn btn-warning btn-sm" onclick="location.href='/project/edit/${project.id}/'"><i class="fas fa-pencil-alt" style="color: white"></i></button>
                                 <button type="submit" class="btn btn-danger btn-sm" onclick="post('/project/delete/${project.id}/')"><i class="far fa-trash-alt"></i></button>
                               </td>
                            </tr>
                         </c:forEach>
                      </tbody>
                    </table>
                   </div> <!-- table reponsive -->
                 </div> <!-- card-body -->
               </div> <!-- card -->
            </div> <!-- container -->
         </main>

        <jsp:include page="../include/script.jsp"/>
     </body>
</html>