// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .

//On logout - update the users table

$(document).ready(function() {
  $('#logout').click(function() {});

  setTimeout(() => {
    $('#notice_alert').fadeOut('slow', function() {
      $(this).remove;
    });
  }, 1500);

  setTimeout(() => {
    $('#notice_wrapper').fadeOut('slow', function() {
      $(this).remove;
    });
  }, 1500);
  // $('#msg_send_btn').click(function() {
  //   $('#message_content').val('');
  // });
});
