$(document).on('turbolinks:load', function() {
  $('#js-items').bind('cocoon:after-insert', function(e, item) {
    $('.js-meal-fields a.js-add-item').
      data('association-insertion-position', 'after').
      data('association-insertion-node', 'this');
    $(this).find('.js-meal-fields').bind('cocoon:after-insert', function() {
      $(this).find('.js-item-from-list').remove();
      $(this).find('a.add_fields').hide();
    });
  });
});
