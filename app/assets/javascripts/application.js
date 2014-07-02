// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap
//= require prettify
//= require application
//= require bootstrap-select
//= require bootstrap-switch
//= require flatui-checkbox
//= require flatui-radio
//= require jquery-1.8.3.min
//= require jquery-1.10.2.min
//= require jquery-2.0.3.min
//= require jquery-ui-1.10.3.custom.min
//= require jquery.placeholder
//= require jquery.tagsinput
//= require jquery.ui.touch-punch.min
//= require respond.min
//= require typeahead
//= require jquery.purr
//= require_tree .
//= require best_in_place
//= require turbolinks

$(document).ready(function() {
  $('.best_in_place').best_in_place();
})

$('.dropdown-toggle').dropdown()  

$(document).ready(function() {
  $("a").click(function() {
    link_host = this.href.split("/")[2];
    document_host = document.location.href.split("/")[2];

    if (link_host != document_host) {
      window.open(this.href);
      return false;
    }
  });
});

