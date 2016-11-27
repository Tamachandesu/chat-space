# README

##DB設計

###必要なテーブルとカラム

  1. User
    1. id
    1. name
    1. group_id

  1. Message
    1. id
    1. body
    1. image
    1. group_id
    1. user_id

  1. Group
    1. id
    1. name
    1. detail
    1. user_id
    1. message_id

  1. UserGroup
    1. id
    1. user_id
    1. group_id

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

