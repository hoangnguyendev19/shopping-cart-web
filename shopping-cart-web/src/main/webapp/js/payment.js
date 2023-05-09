$(document).ready(function () {
  $('.card-selected').click(function (event) {
    event.preventDefault();
    $('.card-selected').removeClass('active');
    $('.tab-pane').removeClass('active');

    $(this).addClass('active');
    let className = $(this).attr('href').slice(1);
    $(`#${className}`).addClass('active');
  });
});
