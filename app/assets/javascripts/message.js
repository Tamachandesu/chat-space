$(function() {
  function sendMessage(message) {
    var html = $('<li class="chat-message">').append(message);
    return html;
  }

  $('.new-message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('#message_body');
    var message = textField.val();
    var text = message =>{
                text: textField.val()
              }
    $.ajax({
      type: 'POST',
      url: '/message.json',
      data: text,
      dataType: 'json'
    })
    .done(function(data) {
      var html = sendMessage(data);
      $('.chat-message').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
