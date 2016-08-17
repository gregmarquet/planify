$(document).ready(function(){
  $('.task_form_link').on('click', function(){
    var categoryId = this.id;
    $('input[name = category_id]').val(categoryId);
  })
})