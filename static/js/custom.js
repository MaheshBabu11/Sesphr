(function($) {

  // Add smooth scrolling to all links in navbar
  $(".navbar a,a.btn-appoint, .quick-info li a, .overlay-detail a").on('click', function(event) {

    var hash = this.hash;
    if (hash) {
      event.preventDefault();
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function() {
        window.location.hash = hash;
      });
    }

  });

  $(".navbar-collapse a").on('click', function() {
    $(".navbar-collapse.collapse").removeClass('in');
  });

  //jQuery to collapse the navbar on scroll
  $(window).scroll(function() {
    if ($(".navbar-default").offset().top > 50) {
      $(".navbar-fixed-top").addClass("top-nav-collapse");
    } else {
      $(".navbar-fixed-top").removeClass("top-nav-collapse");
    }
  });

})(jQuery);$(".form")
.find("input, textarea")
.on("keyup blur focus", function (e) {
  var $this = $(this),
    label = $this.prev("label");

  if (e.type === "keyup") {
    if ($this.val() === "") {
      label.removeClass("active highlight");
    } else {
      label.addClass("active highlight");
    }
  } else if (e.type === "blur") {
    if ($this.val() === "") {
      label.removeClass("active highlight");
    } else {
      label.removeClass("highlight");
    }
  } else if (e.type === "focus") {
    if ($this.val() === "") {
      label.removeClass("highlight");
    } else if ($this.val() !== "") {
      label.addClass("highlight");
    }
  }
});

$(".tab a").on("click", function (e) {
e.preventDefault();

$(this).parent().addClass("active");
$(this).parent().siblings().removeClass("active");

target = $(this).attr("href");

$(".tab-content > div").not(target).hide();

$(target).fadeIn(600);
});

