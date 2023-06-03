// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import $ from "jquery"
//= require materialize
import "materialize"

// Dropdown 
// original => $( document ).ready(function)
// console.log($)
// $(document).on('turbolinks:load', function () {
//     $(".dropdown-trigger").dropdown();
// })
// $(document).ready(function () {
//     $(".dropdown-trigger").dropdown();
// })

