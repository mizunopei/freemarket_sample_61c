$(function(){
  $('.is-higher-height img').mouseenter(function(){
    var thisImg = $(this).attr('src');
    var thisAlt = $(this).attr('alt');
  $('.owl-lazy img').attr({src: thisImg,alt: thisAlt});
 });
});