$(document).ready( function() {

  console.log('custom.js')

  $('.delete-contact-form').on('ajax:success', function(event, xhr, status, error) {
      console.log('deleted w/ form');
      $(this).closest('tr').fadeOut();
  });
  $('.delete-contact-form').on('ajax:error', function() {
      console.log('Error deleting contact w form');
  });

  $('.delete-contact').on('ajax:success', function(event, xhr, status, error) {
      console.log('deleted w/ link');
      $(this).closest('tr').fadeOut();
  });
  $('.delete-contact').on('ajax:error', function(event, xhr, status, error) {
      console.log('Error deleting contact w link');
  });

});
