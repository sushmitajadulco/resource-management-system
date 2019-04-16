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
                   <button class="btn btn-primary float-right" data-toggle="modal" data-target="#addProjectModal" type="submit">Add Project</button>
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
                                 <button type="button" class="btn btn-primary btn-sm" onclick="location.href='/project/profile/${project.id}'"><i class="fas fa-envelope-open-text"></i></button>
                                 <button type="button" class="btn btn-warning btn-sm"><i class="fas fa-pencil-alt" style="color: white"></i></button>
                                 <button type="button" class="btn btn-danger btn-sm" onclick="post('/project/delete/${project.id}')"><i class="far fa-trash-alt"></i></button>
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

         <!-- Modal -->
         <div class="modal fade" id="addProjectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
           <div class="modal-dialog" role="document">
             <div class="modal-content">
               <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalLabel">Add Project</h5>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
                 </button>
               </div>
               <div class="modal-body">
                  <form:form method="post" action="/project/add-project" modelAttribute="project" class="project-validation" novalidate>
                     <form:hidden path="id" />
                     <div class="form-group">
                       <form:label>Name</form:label>
                       <form:input path="name" type="input" class="form-control" placeholder="Awesome Project" required/>
                       <div class="invalid-feedback">
                         Please enter a name.
                        </div>
                     </div>
                    <div class="form-group">
                       <form:label>Description</form:label>
                       <form:input path="description" type="input" class="form-control" placeholder="Some description"/>
                        <div class="valid-feedback">
                                                  Looks good.
                                               </div>
                     </div>
                    <div class="form-group">
                       <form:label>Start Date</form:label>
                       <form:input path="startDate" id="startDate" width="276" />

                         <div class="valid-feedback">
                                                  Looks good.
                                               </div>
                     </div>
                     <div class="form-group">
                       <form:label>End Date</form:label>
                       <form:input path="endDate" id="endDate" width="276" />
                        <div class="valid-feedback">
                              Looks good.
                        </div>
                     </div>
                  </form:form>
               </div>
               <div class="modal-footer">
                 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                 <button type="submit" class="btn btn-primary" data-dismiss="modal" >Save</button>
               </div>

             </div>
           </div>
         </div>

        <jsp:include page="../include/script.jsp"/>
     </body>
</html>