// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs


Table users {
  id integer [primary key]
  username varchar
  email varchar
  password varchar [note: 'hash']
  created_at timestamp
}

Table follows {
  following_user_id integer
  followed_user_id integer
  created_at timestamp
}

Table posts {
  id integer [primary key]
  description text [note: 'Content of the post']
  tags jsonb
  photos jsonb [note: 'keys from s3']
  user_id integer
  status varchar
  latitude PostGIS
  longitude PostGIS
  created_at timestamp
}

Table likes {
  user_id integer [note: 'подумать над агрегацией данных']
  post_id integer
  created_at timestamp
}

Table comments {
  user_id integer [note: 'подумать над агрегацией и кэшированием данных']
  post_id integer
  comment varchar
  created_at timestamp
}

Table chats {
  id integer [primary key]
}

Table chat_users {
  chat_id integer
  user_id integer
}

Table messages {
  id integer [primary key]
  user_id integer
  chat_id integer
  message varchar
  status varchar
  created_at timestamp
}

Table notifications {
  id integer [primary key]
  user_id integer
  message varchar
  deeplink varchar
  created_at timestamp
}

Ref: posts.user_id > users.id // many-to-one

Ref: users.id < follows.following_user_id

Ref: users.id < follows.followed_user_id

Ref: users.id < likes.user_id

Ref: posts.id < likes.post_id

// логи, метрики, кэши, полнотекстовый поиск