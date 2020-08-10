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
//= require activestorage
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require popper
//= require bootstrap.min
//= require jasny-bootstrap.min
//= require cocoon
//= require_tree .

document.addEventListener("turbolinks:load", function() {
  setScrollbarWidth();

  //Definindo scroll e transparencia da barra
  var navbar = document.getElementsByClassName("header-navbar")[0]

  if(navbar != null) {
    window.addEventListener('scroll', function(e) {
      var scrollNow = window.scrollY;
      if (scrollNow == 0) {
        navbar.style.backgroundColor = 'rgba(100%, 100%, 100%, 0)'
      } else if (scrollNow <= 300) {
        navbar.style.backgroundColor = 'rgba(100%, 100%, 100%, 0.01)'.replace(/[^,]+(?=\))/, scrollNow/375);
      } else {
        navbar.style.backgroundColor = 'rgba(100%, 100%, 100%, 0.8)'
      }
    })
  }

  //Fazendo o flash desaparecer aos poucos
  $(document).ready(function() {
    var flashbar = document.getElementsByClassName("alert")
    for (var i = 0; i < flashbar.length; i++) {
      $(flashbar[i]).delay(2000).fadeOut(800)
    }
  });

  //Planos
  var links = document.getElementsByClassName("plan-link")
  for (var j = 0; j < links.length; j++) {
      links[j].addEventListener("click", function (){
          addPlanEvent(this);
      }, false);
  }
})

function setScrollbarWidth() {
  var element = document.querySelector(':root');
  var width = window.innerWidth - element.offsetWidth;
element.style.setProperty('--scrollbar-width', width + 'px');
}

function addPlanEvent(e){
  var plans = document.getElementsByClassName("plan-label")
  for (var i = 0; i < plans.length; i++){
      var innerPlan = plans[i].innerHTML.substr(0, plans[i].innerHTML.indexOf('<'))
      if (e.innerHTML === innerPlan) {
          checkbox = document.getElementById(innerPlan)
          if (checkbox.checked) {
              e.classList.add("link-unchecked")
              e.classList.remove("link-checked")
              checkbox.checked = false
          } else {
              e.classList.add("link-checked")
              e.classList.remove("link-unchecked")
              checkbox.checked = true
          }
          checkbox.addEventListener("click", function() {
              e.classList.remove("link-checked")
              e.classList.add("link-unchecked")
          }, false);
      }
  }
}

//Gráficos

window.addEventListener('turbolinks:load', function() {
  var dashboard = document.getElementById("cobertura-powerbi")

  if(dashboard != null) {
    var dashboard_style = getComputedStyle(dashboard)
    var dashboard_height = parseInt(dashboard_style.getPropertyValue("height"))
    var dashboard_width = parseInt(dashboard_style.getPropertyValue("width"))

    dashboard_width = window.innerWidth * 0.67
    dashboard_height = dashboard_width / 1.6
    dashboard.style.width = dashboard_width + "px"
    dashboard.style.height = dashboard_height + "px"
  }

  var plans_field = document.getElementById("plans-field")

  if(plans_field != null) {
    var plans_field_style = getComputedStyle(plans_field)
    var plans_field_width = parseInt(plans_field_style.getPropertyValue("width"))

    plans_field_width = plans_field_width - 2
    plans_field.style.width = plans_field_width + "px"
  }
});
