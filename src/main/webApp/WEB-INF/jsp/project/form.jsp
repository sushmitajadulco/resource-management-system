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
                  <form method="post" action="/project/add" modelAttribute="project" class="project-validation" novalidate>
                     <div class="form-group">
                       <label>Name</label>
                       <input path="name" type="input" class="form-control" placeholder="Awesome Project" required="true"/>
                       <div class="invalid-feedback">
                         Please enter a name.
                       </div>
                     </div>
                    <div class="form-group">
                       <label path="description">Description</label>
                       <input path="description" type="input" class="form-control" placeholder="Some description"/>
                        <div class="valid-feedback">
                           Looks good.
                        </div>
                     </div>
                    <div class="form-group">
                       <label path="startDate">Start Date</label>
                       <input path="startDate" id="startDate" width="276" />
                       <div class="valid-feedback">
                          Looks good.
                       </div>
                     </div>
                     <div class="form-group">
                       <label path="endDate">End Date</label>
                       <input path="endDate" id="endDate" width="276" />
                        <div class="valid-feedback">
                             Looks good.
                        </div>
                     </div>
                  </form>
               </div>
               <div class="modal-footer">
                 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                 <button type="submit" class="btn btn-primary" data-dismiss="modal" >Save</button>
               </div>

             </div>
           </div>
         </div>