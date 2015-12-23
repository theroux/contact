var contactLite = (function () {
  $(function(){
  	contactLite.init();
  });
  // Private vars
  var $document = $(document),
    contactClass = 'contact',
    selectedClass = 'is-selected',
    $contactsData = $('.data--list'),
    $deleteLink = $('.delete-contact'),
    $filterButtons = $('.show-only--button-group'),
    $allSortButtons = $('.sort-by'),
    $sortButtons = $('.sort-by--button-group'),
    $alphaButtons = $('.alpha--button-group');

  //Private methods
  var _sort = function(param, orderby) {
    var allContacts =  document.getElementsByClassName(contactClass),
    contactsArray = [],
    newHTML = '';

    // getElementsByClassName returns an HTML collection, not a true array, ergo we push to a new array
    for (var i = 0; i < allContacts.length; i++) {
      contactsArray.push(allContacts[i]);
    }

    contactsArray.sort(function(a,b){
      var keyA = $(a).data(param);
      var keyB = $(b).data(param);

      if (keyA < keyB) return -1;
      if (keyA > keyB) return 1;
      return 0;
    });

    // Reverse alphabetize if necessary
    orderby === 'reverse' ? contactsArray.reverse() : null;

    $contactsData.append(contactsArray);
  },
  _getAlphaPref = function() {
    var sortPref = $alphaButtons.find('.' + selectedClass).data('alpha');
    return sortPref;
  },
  _getSortPref = function() {
    var sortPref = $sortButtons.find('.' + selectedClass).data('sort');
    return sortPref;
  },
  _bindings = function() {
    // Ajax delete baked into rails/ -- this just handles the UI change
    $contactsData.on('ajax:success', $deleteLink, function(event, xhr, status, error) {
        //console.log('Deleted contact w/ link');
        $(event.target).closest('.' + contactClass).fadeOut();
    });
    $contactsData.on('ajax:error', $deleteLink, function(event, xhr, status, error) {
        console.log('Error deleting contact w/ link');
    });
    // Filter buttons
    $filterButtons.on('click', 'button', function(event) {
      var attr = $(event.target).data('filter');
      $(event.target).toggleClass(selectedClass);
      // Change the class only once, not on each individual child contact
      // Logic for hiding children is easily handled in the CSS
      $contactsData.toggleClass(attr);
    });
    // Sorting buttons
    $allSortButtons.on('click', 'button', function(event) {
      $(event.target).addClass(selectedClass).prop("disabled", true).siblings().removeClass(selectedClass).prop("disabled", false);
      var attr = _getSortPref(),
      order = _getAlphaPref();
      _sort(attr, order);
    });
  };

  //Public methods
  return {
    init: function () {
      // On page load make sure default button is selected
      // this shows dev intent more clearly than hard coding 'is-selected' on back end
      $document.find('.default').addClass(selectedClass);
      $allSortButtons.find('.' + selectedClass).prop("disabled", true);

      _bindings();
    }
  };
})();
