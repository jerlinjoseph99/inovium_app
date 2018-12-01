/* Theme Name: Zairo - Responsive bootsrap 4 Landing Page Template
   Author: Coderthemes
   Version: 1.0.0
   Created: May 2018
   File Description: Main Js file of the template
*/

! function($) {
    "use strict";

    var Zairo = function() {};

    Zairo.prototype.initStickyMenu = function() {
        $(window).scroll(function() {
            var scroll = $(window).scrollTop();

            if (scroll >= 50) {
                $(".sticky").addClass("nav-sticky");
            } else {
                $(".sticky").removeClass("nav-sticky");
            }
        });
    },

    Zairo.prototype.initSmoothLink = function() {
        $('.nav-item a, .mouse-down a').on('click', function(event) {
            var $anchor = $(this);
            $('html, body').stop().animate({
                scrollTop: $($anchor.attr('href')).offset().top - 0
            }, 1500, 'easeInOutExpo');
            event.preventDefault();
        });
    },

    Zairo.prototype.initScrollspy = function() {
        $("#navbarCollapse").scrollspy({
            offset: 70
        });
    },

    Zairo.prototype.initLoader = function() {
        $(window).on('load', function () {
            $('#status').fadeOut();
            $('#preloader').delay(350).fadeOut('slow');
        });
    }

    Zairo.prototype.initMfpvideo = function() {
        $('.video-play-icon').magnificPopup({
            disableOn: 700,
            type: 'iframe',
            mainClass: 'mfp-fade',
            removalDelay: 160,
            preloader: false,
            fixedContentPos: false
        });
    },

    Zairo.prototype.initBacktoTop = function() {
        $(window).scroll(function(){
            if ($(this).scrollTop() > 100) {
                $('.back-to-top').fadeIn();
            } else {
                $('.back-to-top').fadeOut();
            }
        }); 
        $('.back-to-top').click(function(){
            $("html, body").animate({ scrollTop: 0 }, 1000);
            return false;
        });
    },

    Zairo.prototype.initContact = function() {
        
        $('#contact-form').submit(function() {

            var action = $(this).attr('action');

            $("#message").slideUp(750, function() {
                $('#message').hide();

                $('#submit')
                    .before('')
                    .attr('disabled', 'disabled');

                $.post(action, {
                        name: $('#name').val(),
                        email: $('#email').val(),
                        comments: $('#comments').val(),
                    },
                    function(data) {
                        document.getElementById('message').innerHTML = data;
                        $('#message').slideDown('slow');
                        $('#cform img.contact-loader').fadeOut('slow', function() {
                            $(this).remove()
                        });
                        $('#submit').removeAttr('disabled');
                        if (data.match('success') != null) $('#cform').slideUp('slow');
                    }
                );

            });

            return false;

        });
    },

    Zairo.prototype.init = function() {
        this.initStickyMenu();
        this.initSmoothLink();
        this.initScrollspy();
        this.initLoader();
        this.initMfpvideo();
        this.initBacktoTop();
        this.initContact();
    },
    //init
    $.Zairo = new Zairo, $.Zairo.Constructor = Zairo
}(window.jQuery),

//initializing
function($) {
    "use strict";
    $.Zairo.init();
}(window.jQuery);


/*

//Disable cut copy paste
$('body').bind('cut copy paste', function (e) {
    e.preventDefault();
});

//Disable mouse right click
$("body").on("contextmenu",function(e){
    return false;
});
document.onkeydown = function(e) {
    if (e.ctrlKey && 
        (e.keyCode === 67 || 
         e.keyCode === 86 || 
         e.keyCode === 85 ||
         e.keyCode === 117)) {
        alert('This is not allowed');
        return false;
    } else {
        return true;
    }
};

$(document).keydown(function (event) {
    if (event.keyCode == 123) {
        return false;
    }
    else if ((event.ctrlKey && event.shiftKey && event.keyCode == 73) || (event.ctrlKey && event.shiftKey && event.keyCode == 74)) {
        return false;
    }
});
$(window).keydown(function(event) {
  if(event.ctrlKey && event.keyCode == 84) { 
    console.log("Hey! Ctrl+T event captured!");
    event.preventDefault(); 
  }
  if(event.ctrlKey && event.keyCode == 83) { 
    console.log("Hey! Ctrl+S event captured!");
    event.preventDefault(); 
  }
});
*/