var conctactLite = (function () {
  $(function(){
  	conctactLite.init();
  });

  var _bindings = function() {
    console.log('bindings');
    var $deleteLink = $('.delete-contact');
    $deleteLink.on('ajax:success', function(event, xhr, status, error) {
        console.log('deleted w/ link');
        $(this).closest('tr').fadeOut();
    });
    $deleteLink.on('ajax:error', function(event, xhr, status, error) {
        console.log('Error deleting contact w link');
    });
  };

  //Public methods
  return {
    init: function () {
      console.log('init');
      _bindings();
    }
  };
})();
