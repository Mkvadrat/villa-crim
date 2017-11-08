<form action="" method="post" name="select">
    <?php foreach ($filter_groups as $filter_group) { ?>

      <div class="col-md-2 text-right">
        

      <select class="form-control" >
<option value="" disabled selected><?php echo $filter_group['name']; ?></option>
        <?php foreach ($filter_group['filter'] as $filter) { ?>

       
           
          <option name="filter[]" value="<?php echo $filter['filter_id']; ?>"  />
          <?php echo $filter['name']; ?>
      
     
       
        <?php } ?>
         </select>

         
<!--       </div>
    </div> -->
    
<!--   </div>
  <div class="panel-footer text-right">
    <button type="button" id="button-filter" class="btn btn-primary"><?php echo $button_filter; ?></button>
  </div>
</div> -->
</div>
<?php } ?>
</form>


<script type="text/javascript">
h = document.getElementById ('content').offsetHeight;
window.onload = function(){
  document.getElementById('mar').style.height = document.getElementById ('rowp').offsetHeight+100 + "px";
    var select = document.forms['select'].elements, i = select.length, filter = [];
    while(i--){
        select[i].onchange = function(){
            filter.push(this.value);
           
            $('#button-filter').on('click', function() {

  location = '<?php echo $action; ?>&filter=' + filter.join(',');
});
             };
            }  
        };      
 
  // $('option[name^=\'filter\']:checked').each(function(element) {
  //   filter.push(this.value);
  // });

//  window.select_change = function() {
//  filter = [];
  
//  $('option[name^=\'filter\']:checked').each(function(element) {
//    filter.push(this.value);
//  });
  
//  location = window.location.href + filter.join(',')+',';
// };

</script> 