<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" import="java.util.*" %>

<html lang="en">
    <jsp:include page="../include/header.jsp"/>



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
                    <table id="projectsTable" class="table table-striped table-bordered">
                        <thead>
                           <tr>
                              <th>Id</th>
                           <th>Name</th>
                           <th>Description</th>
                           <th>Start Date</th>
                           <th>End Date</th>
                           <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                     </table>
                   </div> <!-- table reponsive -->
                 </div> <!-- card-body -->
               </div> <!-- card -->
            </div> <!-- container -->
         </main>

        <jsp:include page="../include/script.jsp"/>
     </body>
</html>