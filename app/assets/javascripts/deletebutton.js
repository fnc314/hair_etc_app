

var deleteButton = function (current_client_id, app_id) {
  event.preventDefault();
  
  var authParam = $('meta[name=csrf-param]').attr('content');
  var authToken = $('meta[name=csrf-token]').attr('content');
  var data = {};
  
  data[authParam] = authToken;
  data.current_client = current_client_id.toString();
  data.id = app_id.toString();
  
  $.ajax({
    type: "delete",
    url: "/clients/" + current_client_id + "/appointments/" + app_id + '.json',
    data: data
  }).success(function (current_client_id, app_id) {
    console.log('#'+current_client_id+'_'+app_id);
  });
};