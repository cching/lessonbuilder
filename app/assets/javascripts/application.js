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
//= require jquery.ui.all
//= require jquery_ujs
//= require chosen-jquery
//= require jquery.turbolinks
//= require turbolinks
//= require bootstrap.min
//= require jquery.ui.datepicker
//= require flatui-checkbox
//= require flatui-radio
//= require jquery.purr
//= require nprogress
//= require nprogress-ajax
//= require_tree .


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

function printDiv(divName) {
     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
}

window.setInterval(function() {
    $('form[data-remote].edit_select').submit(); // this will trigger the form to submit and save
  }, 5000);

window.setInterval(function() {
    $('#xquestion_content').submit(); // this will trigger the form to submit and save
  }, 5000);

window.setInterval(function() {
    $('#xvocab_content_english').submit(); // this will trigger the form to submit and save
  }, 5000);


