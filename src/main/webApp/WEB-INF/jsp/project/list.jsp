    <!DOCTYPE html>

    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page contentType="text/html" import="java.util.*" %>

    <html lang="en">
    <jsp:include page="../include/header.jsp"/>
    <script>

        $(document).ready(function() {
            var modalId = localStorage.getItem('modalId');
            if (modalId != null) {
                $(modalId).modal('show');
                setTimeout(function() { $(modalId).modal('hide'); }, 2000);
                localStorage.removeItem('modalId');
            }

            var table = $('#projectsTable').DataTable({
                "sAjaxSource": "/api/project/list",
                "sAjaxDataProp": "",
                "order": [[ 0, "desc" ]],
                "aoColumns": [
                { "mData": "id"},
                { "mData": "name" },
                { "mData": "description" },
                { "mData": "startDate" },
                { "mData": "endDate" },
                {"defaultContent": "<button id='view' type='button' class='btn btn-primary btn-sm'><i class='fas fa-envelope-open-text'></i></button>" +
                "<button id='edit' type='button' class='btn btn-warning btn-sm'><i class='fas fa-pencil-alt' style='color: white'></i></button>" +
                "<button id='delete' type='button' class='btn btn-danger btn-sm'><i class='far fa-trash-alt'></i></button>"
                }
                ]
            });


            $('#projectsTable tbody').on( 'click', 'button#view', function () {
               var data = table.row( $(this).parents('tr') ).data();
               location.href="/project/profile/" + data.id;
           } );

            $('#projectsTable tbody').on( 'click', 'button#edit', function () {
               var data = table.row( $(this).parents('tr') ).data();
               location.href="/project/edit/" + data.id;
           } );

            $('#projectsTable tbody').on( 'click', 'button#delete', function () {
             var data = table.row( $(this).parents('tr') ).data();
             deleteProject('/api/project/delete/' + data.id);
           });
       });

        function deleteProject(endPoint) {
            $.ajax({
               url: endPoint,
               type: "post",
               success: function (data) {
                    location.href="/project/list";
                    $("#success-alert").show().delay(2000).fadeIn(500, 0).slideUp(500, function(){
                        $("#success-alert").fadeOut(500);
                    });

               }, error: function (jqXHR, textStatus, errorThrown) {}
            });
        }
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
            <div class="alert alert-success" id="success-alert" style="display: none">
                <button type="button" class="close" data-dismiss="alert">x</button>
                <strong>Success!</strong> Project has been deleted.
            </div>
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

<!-- Modal -->
<div class="modal fade" id="successModal" role="dialog">
      <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Success</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div>
                <p class="modal-body">Project Successfully Saved!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="errorModal" role="dialog">
   <div class="modal-dialog">

     <!-- Modal content-->
     <div class="modal-content">
       <div class="modal-header">
         <h4 class="modal-title">Error</h4>
         <button type="button" class="close" data-dismiss="modal">&times;</button>
     </div>
     <div>
         <p class="modal-body">Oops. Error Saving Project</p>
     </div>
     <div class="modal-footer">
         <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
     </div>
 </div>
</div>
</div>

<jsp:include page="../include/script.jsp"/>
</body>
</html>