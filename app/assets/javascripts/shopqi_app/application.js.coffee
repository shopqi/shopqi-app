#= require jquery
#= require jquery_ujs
#= require_tree .

#= require twitter/bootstrap/dropdown.js

$(document).ready ->
  $('#shop').focus()
  $('.dropdown-toggle').dropdown()
