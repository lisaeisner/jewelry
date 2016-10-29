//= require smoothstate.min
//= require jquery.superslides.min
//= require video.min
//= require jquery.magnific-popup.min
//= require ui


$(document).ready(function() {
  menuSetup();
  slideSetup();
  popupSetup();
  // gallerySetup();

  // smoothState init
  $("#main").smoothState({
    onStart: {
      duration: 400,
      render: function($container) {
        $container.animate('fadeOut', { duration: 200 });
      }
    },
    onReady: {
      duration: 400,
      render: function($container, $newContent) {
        $container.html($newContent);
        $container.animate('fadeIn', { duration: 100 });
      }
    },
    onAfter: function($container, $newContent) {
      menuSetup();
      slideSetup();
      popupSetup();
      // gallerySetup();
    }
  });
});
