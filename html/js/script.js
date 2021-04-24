// Add your options
$("#tp1").click(function() { $.post('https://pe-tpmenu-ui/tpOptions', JSON.stringify({action: 'tpone'})); return;})
$("#tp2").click(function() {$.post('https://pe-tpmenu-ui/tpOptions', JSON.stringify({action: 'tptwo'})); return;})
$("#tp3").click(function() {$.post('https://pe-tpmenu-ui/tpOptions', JSON.stringify({action: 'tpthree'})); return;})

window.addEventListener("message", function (event) {
  switch (event.data.action) {
    case "show":
      $("#slideshow").fadeIn();
      $("#dots").fadeIn();
    break;
    
    case "hide":
      $("#slideshow").fadeOut();
      $("#dots").fadeOut();
    break;
  };
});
    

// Do not touch below this unless you know what your doing
var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
}

// Close with 'Escape' key
document.onkeyup = function(event) {
  if (event.key == 'Escape') {
      $.post('https://pe-tpmenu-ui/close');
  }
};