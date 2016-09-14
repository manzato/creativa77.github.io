$('.contactInfo').affix({
  offset: {
    top: 100,
    bottom: 200
  }
});

// Set to affixed sidebar the width of the parent (col-md-6)
$('.contactInfo').on('affixed.bs.affix', function() {
  $('.contactInfo').width($('.contactInfo').parent().width());
});


// Leaflet map setup
mapboxgl.accessToken = 'pk.eyJ1IjoiZWt1bWVuIiwiYSI6ImNpZXZqcW9nejB4ejM5MW0zcnBsZmhoa3MifQ.Tjix9jwmkT-gGbD1g8OvBg';
var map = new mapboxgl.Map({
  container: 'ekumenOfficeMap',
  style: 'mapbox://styles/mapbox/streets-v8',
  center: [-58.44627857208252, -34.5830864007996],
  zoom: 12
});

var tooltip = new mapboxgl.Popup({
    closeButton: false,
    closeOnClick: false
  })
  .setLngLat([-58.44627857208252, -34.5830864007996])
  .setHTML('<img src="/images/logo-small.png"/>')
  .addTo(map);
