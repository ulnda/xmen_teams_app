$(document).ready ->
  $("button.close").click ->
    $(this).closest(".alert").hide()