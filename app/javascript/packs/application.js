// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery3
//= require popper
//= require bootstrap
//= require font-awesome
//= require bootstrap-tokenfield
//= require jquery.tagsinput
//= require bootstrap-tagsinput

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
// require("channels");
require("bootstrap");
require("jquery");
require("popper.js");
require("bootstrap-tagsinput");

import "../src/style.scss";
import "bootstrap";
import "../stylesheets/application";
import "@fortawesome/fontawesome-free/js/all";
import "../stylesheets/tagsinput.css";
import "select2";
import "select2/dist/css/select2.css";

$(document).on("ready turbolinks:load", function () {
  $("#task_task_tags").select2({
    tags: true,
    //移到 webpack 打包， maximumInputLength 屬性會失效
    maximumInputLength: 10,
    tokenSeparators: [",", " "],
  });
});
