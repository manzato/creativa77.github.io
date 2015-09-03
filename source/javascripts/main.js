$(function() {
$(".work-panel.work-robotics").click(function(){
$('#small').hide();$('#area1').show();;
return false;
});
$('#close').click(function(){
$('#small').show();$('#area1').hide();;
return false;
});

  $('a[href*=#]:not([href=#])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 'slow');
        return false;
      }
    }
  });
});
