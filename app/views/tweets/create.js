
 
// $("button").click(function(){
//   $.ajax({url:"/tweets",success:function(result){
//     $('#posts').html("<%= escape_javascript(render(:partial => 'tweets')).html_safe %>");
//   }});
// });

//$("form").submit(function(){
  $('#posts').html("<%= escape_javascript(render(:partial => 'tweets')).html_safe %>");
