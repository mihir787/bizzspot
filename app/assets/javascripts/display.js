$(document).ready(function() {
  L.mapbox.accessToken = 'pk.eyJ1IjoibWloaXI3ODciLCJhIjoiNDE2NDkzNzdlZTA2N2RjMmM4NWNkNjA1MjIwMGMxNDIifQ.3ggS6ol72ln878GzLZnfDQ';
  var map = L.mapbox.map('map', 'mihir787.mfl5ppg2', {attributionControl: false});
  $("#search_button").on('click', function(event){
    event.preventDefault();
    var postParams = { address: $("#address").val() }
    $.get("/api/v1/coordinates", postParams, function(data,status,xhr){
        $(".demographic-data").prepend(data["lat"])


        map.setView([data["lat"], data["long"]], 14);
        var marker = L.marker([data["lat"], data["long"]], {
          icon: L.mapbox.marker.icon({
            'marker-size': 'large',
            "marker-symbol": "star",
            'marker-color': '#ffff00'
          })
        }).addTo(map);
        marker.bindPopup(formatContent(data)).closePopup();
        generateChart(data);

    });
  });

});

var formatContent = function(data) {
  var content = ("<p> <b>Walkscore:</b> " + data.walkscore + "</p><p><b>Latitude:</b> " +
  data.lat + "</p><p><b>Longitude:</b> " +
  data.long + "</p><p><b>Median Income:</b> $" +
  data.median_income + "</p><p><b>High School Grad Rate:</b> " +
  generatePercentage(data.education_high_school_graduate) + "%</p><p><b>Higher Education Grad Rate:</b> " +
  generatePercentage(data.education_bachelor_or_greater) + "%</p>");
  return content;
}

var generateChart = function(data) {
  var chart = c3.generate({
      data: {
          columns: [
              ['Below Poverty', generatePercentage(data.income_below_poverty)],
              ['>25,000', generatePercentage(data.income_less_than_25)],
              ['25,000-50,000', generatePercentage(data.income_between_25_to_50)],
              ['50,000-100,000', generatePercentage(data.income_between_50_to_100)],
              ['$100,000-200,000', generatePercentage(data.income_between_100_to_200)],
              ['>$200,000', generatePercentage(data.income_greater_200)],
          ],
          type : 'donut'
      },
      donut: {
          title: "Community Income",
      }
  });
};

var generatePercentage = function(demographicData) {
  return (demographicData * 100.0);
};
