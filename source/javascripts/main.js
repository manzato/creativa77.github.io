$(function() {
$(".work-panel.work-robotics").click(function(){
$('#small').hide();$('#area1').show();;
if($(window).width() >= 992) {
$("html, body").animate({ scrollTop: 550 }, "slow");
} else {
$("html, body").animate({ scrollTop: 250 }, "slow");
}
  return false;
});
$(".work-panel.work-real-time").click(function(){
$('#small').hide();$('#area2').show();;
if($(window).width() >= 992) {
$("html, body").animate({ scrollTop: 550 }, "slow");
} else {
$("html, body").animate({ scrollTop: 250 }, "slow");
}
return false;
});
$(".work-panel.work-android").click(function(){
$('#small').hide();$('#area3').show();;
if($(window).width() >= 992) {
$("html, body").animate({ scrollTop: 550 }, "slow");
} else {
$("html, body").animate({ scrollTop: 250 }, "slow");
}
return false;
});
$(".work-panel.work-simple").click(function(){
$('#small').hide();$('#area4').show();;
if($(window).width() >= 992) {
$("html, body").animate({ scrollTop: 550 }, "slow");
} else {
$("html, body").animate({ scrollTop: 250 }, "slow");
}
return false;
});

$('#close1').click(function(){
$('#small').show();$('#area1').hide();;
return false;
});
$('#close2').click(function(){
$('#small').show();$('#area2').hide();;
return false;
});
$('#close3').click(function(){
$('#small').show();$('#area3').hide();;
return false;
});
$('#close4').click(function(){
$('#small').show();$('#area4').hide();;
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
