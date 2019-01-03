$(document).ready(function() {

  $("#items a.add_fields").
    data("association-insertion-position", 'before').
    data("association-insertion-node", 'this');

  $('#items').bind('cocoon:after-insert',
    function(e, item) {
    console.log('inserting new item ...');
    $(".meal-fields a.add-item").
      data("association-insertion-position", 'after').
      data("association-insertion-node", 'this');
    $(this).find('.meal-fields').bind('cocoon:after-insert',
      function() {
        console.log('insert new item ...');
        console.log($(this));
        $(this).find(".item_from_list").remove();
        $(this).find("a.add_fields").hide();
      });
    });

});
