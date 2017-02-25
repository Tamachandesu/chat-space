$(function() {
  function sendMessage(message) {
    var buildImage = "";

    if(message.image) {
      buildImage = `<img class="chat-message__image" src="${message.image}" >`;
    }
    var html =`
            <li class="chat-message">
              <div class="chat-message__header clearfix">
                <p class="chat-message__name">${message.nickname}</p>
                <p class="chat-message__time">${message.created_at}</p>
              </div>
              <p class = "chat-message__body">${message.text}<br></p>${buildImage}
            </li>`;
    return html;
  }

　function moveToBottom() {
    $('.chat-body').animate({
      scrollTop: $('.chat-messages').height() + $('.chat-message').height()
    })
  };

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    $('#submit').removeAttr('data-disable-with');
    var formData = new FormData($("#new_message")[0]);

    $.ajax({
      type: 'POST',
      url: './messages.json',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(data) {
      console.log(data)
      var html = sendMessage(data.message);
      $('.chat-message').html(html);
      $('#message_text').val("");
      moveToBottom();

    })

    .fail(function() {
      alert('エラーが発生しました');
    });
  });

  if(window.location.href.match(/messages/)) {
    setInterval(function(){
      var indexUrl = window.location.href + ".json";
      $.ajax({
        type: 'GET',
        dataType: 'json',
        url: indexUrl
      })

      .done(function(data) {
        var number = data.length;
        var insertHtml = ""
        for (var i = 0; i < number; i++)
        {
          insertHtml += sendMessage(data[i]);
        };
        $('.chat-messages').html(insertHtml);
      })
    },5 * 1000);
  };
});
