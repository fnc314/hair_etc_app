// Animation for removing div

var animateRemoval = function (response) {
  var id = response.id.toString();
  $("#" + id).animate({
    height: 15,
    padding: 15
  }, 800, "linear", function () {
    $(this).fadeOut();
  });
};

var confirmation = function () {
  var answer = confirm("Are you SURE you want to delete this appointment?");
  return answer;
}

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
  if (confirmation()) {
    $.ajax({
      type: "delete",
      url: "/clients/" + current_client_id + "/appointments/" + app_id + '.json',
      data: data
    }).success( function (response) {
      animateRemoval(response);
    });
  } else {
    null;
  }
};