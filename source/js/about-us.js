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
var map = L.map('ekumenOfficeMap', {
  center: [-34.58306, -58.44619],
  zoom: 12
});

L.tileLayer('https://{s}.tiles.mapbox.com/v3/{id}/{z}/{x}/{y}.png', {
  maxZoom: 18,
  id: 'examples.map-i875mjb7',
  attribution: "<small><a href='https://www.mapbox.com/about/maps/' target='_blank'>&copy; Mapbox &copy; OpenStreetMap</a> <a class='mapbox-improve-map' href='https://www.mapbox.com/map-feedback/' target='_blank'>Improve this map</a></small>"
}).addTo(map);
map.attributionControl.setPrefix(false);

L.Icon.Default.imagePath = '/img/leaflet';

L.marker([-34.58320, -58.44620]).addTo(map)
.bindPopup('Ekumen Labs')
.openPopup();
