# README

##DB設計

###必要なテーブルとカラム

  1. Usersテーブル
    1. name(string)
    1. group_id(references)

  1. Messagesテーブル
    1. body(text)
    1. image(text)
    1. group_id(references)
    1. user_id(references)

  1. Groupsテーブル
    1. name(string)
    1. detail(text)

  1. UserGroupsテーブル
    1. user_id(references)
    1. group_id(references)

###Relation設定
  - User hasMany Message
  - User hasMany Group through UserGroup
  - Message belongsTo User
  - Message belongsTo Group
  - Group hasMany User through UserGroup
  - Group hasMany Message

###制約

  1. NOT NULL
    - Usersテーブル
      - name
    - Messagesテーブル
      - body
      - group_id
      - user_id
    - Groupsテーブル
      - name
      - user_id
      - message_id
    - UserGroupsテーブル
      - user_id
      - group_id

  1. 外部キー制約
    - Usersテーブル
      -group_id
    - Messagesテーブル
      -group_id
      -user_id
    - Groupsテーブル
      -user_id
      -message_id
    - UserGroupsテーブル
      -user_id
      -group_id

###INDEX設定
  - Usersテーブル
    - name
  - Messagesテーブル
    - body
  - Groupsテーブル
    - name

