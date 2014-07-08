// Animation for removing div

var animatedRemoval = function () {
  $(this).animate({height: 0}, 2000, "linear", function() {
    $(this).remove();
  });
};

var deleteButton = function (current_client_id, app_id) {
  // Prevent reload
  event.preventDefault();
  // Build Params hash in guise of token
  var authParam = $('meta[name=csrf-param]').attr('content');
  var authToken = $('meta[name=csrf-token]').attr('content');
  var data = {};
  // Add prebuilt authentication and passed in function arguments
  // to params hash (data)
  data[authParam] = authToken;
  data.current_client = current_client_id.toString();
  data.id = app_id.toString();
  // Create ajax call to delete object and remove containing div from the page
  // without refresh
  $.ajax({
    type: "delete",
    url: "/clients/" + current_client_id + "/appointments/" + app_id + '.json',
    data: data
  }).success(function (response) {
    var a = response;
    console.log(response);
    var id1 = response.id.toString();
    var ele = document.getElementById(id1);
    // ele.remove();
    // ele.animatedRemoval();
    $("#"+id1).animate({
      height:0
    }, 2000, "linear", function () {
      $(this).remove();
    });
  });
};