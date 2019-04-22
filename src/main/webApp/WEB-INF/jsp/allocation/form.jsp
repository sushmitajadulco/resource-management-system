

        <!-- Modal -->
         <div class="modal fade" id="allocationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
           <div class="modal-dialog" role="document">
             <div class="modal-content">
               <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalLabel">Add Project</h5>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
                 </button>
               </div>
               <div class="modal-body">
                   <form class="project-validation" novalidate>
                     <div class="form-group">
                       <label>Project</label>
                        <select class="form-control" id="project"></select>
                       <div class="valid-feedback">
                         Looks good.
                        </div>
                    </div>
                    <div class="form-group">
                       <label>Start Date</label>
                       <input id="startDate" width="276" readonly/>
                       <div class="valid-feedback">
                          Looks good.
                        </div>
                     </div>
                     <div class="form-group">
                       <label>End Date</label>
                       <input id="endDate" width="276" readonly/>
                       <div class="valid-feedback">
                          Looks good.
                       </div>
                     </div>
                     <div class="form-group">
                       <label>Allocation</label>
                       <select class="form-control" id="allocation"></select>
                       <div class="valid-feedback">
                         Looks good.
                       </div>
                    </div>
               </div>
               <div class="modal-footer">
                 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                 <button type="button" class="btn btn-primary" onclick="save()">Save changes</button>
                 <div id="warning-msg" style="display:none">
                    <p style="color: red;">Cannot add project allocation.</p>
                 </div
               </div>
               </form>
             </div>
           </div>
     </div>