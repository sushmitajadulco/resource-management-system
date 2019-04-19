<!DOCTYPE html>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html lang="en">
    <jsp:include page="../include/header.jsp"/>

    <body>
        <main role="main">
          <div class="container">
            <div class="card card-list">
                <div class="card-header">
                    <div class="float-left">
                        <c:choose>
                            <c:when test="${isAdd}">
                                <h4>Add Project</h4>
                            </c:when>
                            <c:otherwise>
                                <h4>Edit Project</h4>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="float-right">
                       <button type="button" class="btn btn-primary float-right" onclick="location.href='/project/list/'">Back</button>
                    </div>
                </div>

                <div class="card-body card-content">
                    <form:form id="project-form" method="post" action="/project/add" modelAttribute="project" class="project-validation" novalidate="true">
                     <form:hidden path="id"/>
                     <div class="form-group">
                       <form:label path="name">Name</form:label>
                       <form:input path="name" type="input" class="form-control" placeholder="Project name" required="true"/>
                       <div class="invalid-feedback">
                         Please enter a name.
                       </div>
                     </div>
                    <div class="form-group">
                       <form:label path="description">Description</form:label>
                       <form:input path="description" type="input" class="form-control" placeholder="Some description"/>
                        <div class="valid-feedback">
                           Looks good.
                        </div>
                     </div>
                    <div class="form-group">
                       <form:label path="startDate">Start Date</form:label>
                       <form:input path="startDate" id="startDate" width="276" />
                       <div class="valid-feedback">
                          Looks good.
                       </div>
                     </div>
                     <div class="form-group">
                       <form:label path="endDate">End Date</form:label>
                       <form:input path="endDate" id="endDate" width="276" />
                        <div class="valid-feedback">
                             Looks good.
                        </div>
                     </div>
                     <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                     <button type="submit" class="btn btn-primary" data-dismiss="modal" >Save</button>
                  </form:form>
               </div>
               <div class="card-footer">

               </div>

                </div> <!-- card-body -->
               </div> <!-- card -->
            </div> <!-- container -->
         </main>

        <jsp:include page="../include/script.jsp"/>
     </body>
</html>


    