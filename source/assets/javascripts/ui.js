$(window).resize(function() {
  var more = document.getElementById("js-navigation-more");
  if ($(more).length > 0) {
    var windowWidth = $(window).width();
    var moreLeftSideToPageLeftSide = $(more).offset().left;
    var moreLeftSideToPageRightSide = windowWidth - moreLeftSideToPageLeftSide;

    if (moreLeftSideToPageRightSide < 330) {
      $("#js-navigation-more .submenu .submenu").removeClass("fly-out-right");
      $("#js-navigation-more .submenu .submenu").addClass("fly-out-left");
    }

    if (moreLeftSideToPageRightSide > 330) {
      $("#js-navigation-more .submenu .submenu").removeClass("fly-out-left");
      $("#js-navigation-more .submenu .submenu").addClass("fly-out-right");
    }
  }
});

function menuSetup() {
  var menuToggle = $("#js-mobile-menu").unbind();
  $("#js-navigation-menu").removeClass("show");

  menuToggle.on("click", function(e) {
    e.preventDefault();
    $("#js-navigation-menu").slideToggle(function(){
      if($("#js-navigation-menu").is(":hidden")) {
        $("#js-navigation-menu").removeAttr("style");
      }
    });
  });
}

function slideSetup() {
  $("#slides").superslides({
    animation: 'fade',
    animation_speed: 'slow',
    play: 6000,
    pagination: false,
    margin_top: 0
  });

  $(".slides-navigation .next").on("click", function() {
    $('#slides').superslides("animate", "next");
  });


  $(".slides-navigation .prev").on("click", function() {
    $('#slides').superslides("animate", "prev");
  });
}

function popupSetup() {
  $('.ajax-popup-link').magnificPopup({
    type: 'ajax'
  });
  $('.popup-link').magnificPopup({
    type: 'image'
  });
}

// function gallerySetup() {
//   $(".installation-gallery").each(function() {
//     console.log("function called");
//     $(this).magnificPopup({
//       delegate: "a",
//       type: "image",
//       gallery: {
//         enabled: true
//       }
//     });
//   });
// }
