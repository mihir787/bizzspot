
$(document).ready(function() {
  L.mapbox.accessToken = $('#map-data').data('token');
  var map = L.mapbox.map('map', 'mihir787.mfl5ppg2').setView([45.52086, -122.679523], 14)
  $.ajax({
    dataType: 'text',
    url: 'coordinates/happening_now.json',
    success: function(data) {
      var geojson;
      geojson = $.parseJSON(data);
      return map.setGeoJSON(geojson);
    }
  });
});
