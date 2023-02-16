const navHeader = $(".nav-header");
const navContent = $(".nav-content");
const wd = $(window);

wd.scroll(() => {
  if (wd.scrollTop() > 50) {
    $("nav").addClass("shadow-md fixed bg-white");
    navHeader.addClass("scrolled");
    navContent.addClass("scrolled");
  } else {
    $("nav").removeClass("shadow-md fixed bg-white");
    navHeader.removeClass("scrolled");
    navContent.removeClass("scrolled");
  }
});
