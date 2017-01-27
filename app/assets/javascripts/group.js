$(function(){

  function buildAddUserHTML(user) {
    var html =
      '<div class="chat-group-user clearfix">' +
      '<p class="chat-group-user__name">' +
      user.nickname +
      '</p>' +
      '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="' + user.id + '" data-user-nickname="' + user.nickname + '">追加' +
      '</a>' +
      '</div>';
    return html
  }

  function buildUserHTML(id, name) {
    var html =
      '<div class="chat-group-user clearfix" id="chat-group-user-' + id +  '">' +
      '<input type="hidden" name="group[user_ids][]" value="' + id + '">' +
      '<p class="chat-group-user__name">' +
      name +
      '</p>' +
      '<a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove" data-user-id="' + id + '">削除' +
      '</a>' +
      '</div>';
    return html
  }

  function searchUsers() {
    $.ajax('/users.json', {
      method: 'GET',
      data: {
        nickname: $('#user-search-field').val()
      },
      dataType: 'json',
      success: function(json) {
        var insertHTML = '';

        json.forEach(function(user){
          insertHTML += buildAddUserHTML(user);
        });

        $('#user-search-result').html(insertHTML);
      },
      error: function(json) {
        alert('エラーが発生しました');
      }
    });
  }

  $('#user-search-field').on('change keyup', searchUsers);

  $('#user-search-result').on('click', '.user-search-add', function(){
    var $this = $(this);
    var id = $this.data('userId');
    var name = $this.data('userNickname');

    var insertHTML = buildUserHTML(id, name);

    $('#chat-group-users').append(insertHTML);

    $this.parent('.chat-group-user').remove();
  });

  $('#chat-group-users').on('click', '.user-search-remove', function(){
    var $this = $(this);
    var id = $this.data('userId');

    $('#chat-group-user-' + id).remove();
  })
});
