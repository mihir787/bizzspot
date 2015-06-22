$(document).ready(function() {
  L.mapbox.accessToken = 'pk.eyJ1IjoibWloaXI3ODciLCJhIjoiNDE2NDkzNzdlZTA2N2RjMmM4NWNkNjA1MjIwMGMxNDIifQ.3ggS6ol72ln878GzLZnfDQ';
  var map = L.mapbox.map('map', 'mihir787.mfl5ppg2');

  callService(map);

})

function callService(map) {
    // L.mapbox.accessToken = 'pk.eyJ1IjoibWloaXI3ODciLCJhIjoiNDE2NDkzNzdlZTA2N2RjMmM4NWNkNjA1MjIwMGMxNDIifQ.3ggS6ol72ln878GzLZnfDQ';
    // var map = L.mapbox.map('map', 'mihir787.mfl5ppg2');
    // $('#map').addClass('smallmap');
  $("#search_button").on('click', function(){
    event.preventDefault();

    var postParams = { address: $("#address").val() }

    $.ajax({
      type: 'GET',
      url: '/api/v1/coordinates',
      data: postParams,
      success: function(data) {
        var coordinates = parseCoordinate(data.coordinates);
        var start = [parseFloat(coordinates[1]), parseFloat(coordinates[0])];
        map = map.setView(start, 14);
      }
    })
  })
}

function parseCoordinate(stringCoordinates){
  var coord = stringCoordinates;
  return coord.replace("[","").replace("]","").replace(" ","").split(",");
}
