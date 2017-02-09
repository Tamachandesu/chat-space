$(function() {
  function sendMessage(message) {
    var buildImage = "";

    if(message.image) {
      buildImage = '<img class="chat-message__image" src= ' + message.image +'>'
    } else {
      buildImage = ""
    }

    var html = '<li class="chat-message">' +
                '<div class="chat-message__header clearfix">' +
                  '<p class="chat-message__name">' + message.nickname + '</p>' +
                  '<p class="chat-message__time">' + message.created_at + '</p>' +
                '</div>' +
                '<p class = "chat-message__body">' + message.text + '<br>' + '</p>' +
                'buildImage' +
               '</li>'
    return html;
  }

  $('#new-message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('#message_body');
    var formData = new FormData($("#new_message")[0]);

    $.ajax({
      url: '/message.json',
      data: formData,
      method: 'POST',
      processData: false,
      contentType: false,
      dataType: 'json'
    })

    .done(function(data) {
      var html = sendMessage(data);
      $('.chat-message').append(html);
    })

    .fail(function() {
      alert('エラーが発生しました');
    });
  });
});
