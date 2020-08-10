window.addEventListener('turbolinks:load', function() {
  var dashboard = document.getElementsByClassName("dashboard-powerbi")[0]

  if(dashboard != null) {
    var dashboard_style = getComputedStyle(dashboard)
    var dashboard_height = parseInt(dashboard_style.getPropertyValue("height"))
    var dashboard_width = parseInt(dashboard_style.getPropertyValue("width"))

    if(window.innerHeight < window.innerWidth) {
      dashboard_width = dashboard_height * 1.6
      dashboard.style.width = dashboard_width + "px"
    } else {
      dashboard_height = dashboard_width / 1.6
      dashboard.style.height = dashboard_height + "px"
    }
  }
});
