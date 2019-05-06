<!DOCTYPE html>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html lang="en">
    <jsp:include page="../include/header.jsp"/>
    <script>
        var isEdit = false;
        var id;

        $(document).ready(function() {
             var url = window.location.toString();
             id = url.substring(url.lastIndexOf('/') + 1);
             console.log("ID: " + id);
             if(isNaN(id)) {
                $('.title').append("Add Project");
             } else {
                $('.title').append("Edit Project");
                getProject();
                isEdit = true;
             }
        });

        function getProject() {
            var url = window.location.toString();
                        var id = url.substring(url.lastIndexOf('/') + 1);
                        $.ajax({
                           url: "/api/project/" + id ,
                           type: "get",
                           success: function (project) {
                              console.log("project: " + project);
                              $('#name').val(project.name);
                              $('#description').val(project.description);
                              $('#startDate').val(project.startDate);
                              $('#endDate').val(project.endDate);
                           }, error: function (jqXHR, textStatus, errorThrown) {},
             });

        }

       function save() {

       		var modelObj = {
       				name: $("#name").val(),
       				description: $("#description").val(),
       				startDate: $("#startDate").val(),
       				endDate: $("#endDate").val()
       		};

       		console.log("post data:"+modelObj.name);
             var method, endPoint;
             if( isEdit == true) {
                method = "PUT";
                console.log("id in save(): ", id);
                endPoint = "/api/project/edit/" + id;
             } else {
                method = "POST";
                endPoint = "/api/project/add";
             }
       		 $.ajax({
       	            type: method,
       	            url: endPoint,
       	            headers: {
       	                "Content-Type": "application/json"
       	            },
       	            data: JSON.stringify(modelObj),
       	            success: function (data) {
                        localStorage.setItem("modalId", "#successModal");
       	            },
       	            error: function (jqXHR, textStatus, errorThrown) {
       	                localStorage.setItem("modalId", "#errorModal");
       	            },
       	            complete: function() {
       	                location.href="/project/list";
       	            }

       	        });
       	}

    </script>

    <body>
        <main role="main">
          <div class="container">
            <div class="card card-list">
                <div class="card-header">
                    <div class="float-left">
                       <h4 class="title"></h4>
                    </div>
                    <div class="float-right">
                       <button type="button" class="btn btn-primary float-right" onclick="location.href='/project/list/'">Back</button>
                    </div>
                </div>

                <div class="card-body card-content">
                    <form id="projectForm" class="project-validation"  novalidate="true">

                     <div class="form-group">
                       <label>Name</label>
                       <input id="name" type="input" class="form-control" placeholder="Project name" required="true"/>
                       <div class="invalid-feedback">
                         Please enter a name.
                       </div>
                     </div>
                    <div class="form-group">
                       <label>Description</label>
                       <input id="description" type="input" class="form-control" placeholder="Some description"/>
                        <div class="valid-feedback">
                           Looks good.
                        </div>
                     </div>
                    <div class="form-group">
                       <label>Start Date</label>
                       <input id="startDate" id="startDate" width="276" readonly/>
                       <div class="valid-feedback">
                          Looks good.
                       </div>
                     </div>
                     <div class="form-group">
                       <label>End Date</label>
                       <input id="endDate" id="endDate" width="276" readonly/>
                        <div class="valid-feedback">
                             Looks good.
                        </div>
                     </div>
                     <button type="button" class="btn btn-primary" onclick="save()" >Save</button>
                  </form>
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


