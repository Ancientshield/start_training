$(document).on("ready turbolinks:load", function () {
  $("#task_task_tags").select2({
    tags: true,
    maximumInputLength: 10,
    tokenSeparators: [",", " "],
  });
});
