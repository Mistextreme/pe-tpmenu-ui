// Add your options
$("#tp1").click(function() { $.post('https://pe-tpmenu-ui/tpOptions', JSON.stringify({action: 'tp1'})); return;})
$("#tp2").click(function() {$.post('https://pe-tpmenu-ui/tpOptions', JSON.stringify({action: 'tp2'})); return;})
$("#tp3").click(function() {$.post('https://pe-tpmenu-ui/tpOptions', JSON.stringify({action: 'tp3'})); return;})
$("#tp4").click(function() {$.post('https://pe-tpmenu-ui/tpOptions', JSON.stringify({action: 'tp4'})); return;})
$("#tp5").click(function() {$.post('https://pe-tpmenu-ui/tpOptions', JSON.stringify({action: 'tp5'})); return;})
$("#tp6").click(function() {$.post('https://pe-tpmenu-ui/tpOptions', JSON.stringify({action: 'tp6'})); return;})
$("#tp7").click(function() {$.post('https://pe-tpmenu-ui/tpOptions', JSON.stringify({action: 'tp7'})); return;})
$("#tp8").click(function() {$.post('https://pe-tpmenu-ui/tpOptions', JSON.stringify({action: 'tp8'})); return;})
$("#tp9").click(function() {$.post('https://pe-tpmenu-ui/tpOptions', JSON.stringify({action: 'tp9'})); return;})
$("#tp10").click(function() {$.post('https://pe-tpmenu-ui/tpOptions', JSON.stringify({action: 'tp10'})); return;})
//$("#tp11").click(function() {$.post('https://pe-tpmenu-ui/tpOptions', JSON.stringify({action: 'tp11'})); return;}) // Just copy this line and change the action and id to match the html and lua one.

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
let slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(number) {
  showSlides(slideIndex += number);
}

// Thumbnail image controls
function currentSlide(number) {
  showSlides(slideIndex = number);
}

function showSlides(number) {
  let i = undefined;
  const slides = document.getElementsByClassName("mySlides");
  const dots = document.getElementsByClassName("dot");
  if (number > slides.length) {slideIndex = 1}
  if (number < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex - 1].style.display = "block";
  dots[slideIndex - 1].className += " active";
}

// Close with 'Escape' key
document.onkeyup = function(event) {
  if (event.key == 'Escape') {
      $.post('https://pe-tpmenu-ui/close');
  }
};