# Social network for travelers - System Design

### Functional requirements:

- публикация постов из путешествий с фотографиями, небольшим описанием и привязкой к конкретному месту путешествия;
- оценка и комментарии постов других путешественников;
- подписка на других путешественников, чтобы следить за их активностью;
- поиск популярных мест для путешествий и просмотр постов с этих мест в виде ТОПа мест по странам и городам;
- общение с другими путешественниками в личных сообщениях;
- просмотр ленты других путешественников;
- CRUD постов; 
- оценка - создать/удалить лайк
- комментарии - создать
- показываем 10 постов в выдаче



### Non-functional requirements:

- Количество пользователей: 10 000 000 DAU
- Доступность: availability 99,95% (5 часов может быть не доступным)
- среднее кол-во созданий постов пользователем в день - 1 пост
- среднее кол-во просмотров ленты пользователем в день - 10 раз
- нет сезенности
- расположение пользователей: СНГ
- данные храним всегда
- максимальное кол-во фотографий к посту - 5
- максимальный размер каждой фотографии -  500 KБ
- среднее кол-во подписок у пользователя - 200 (среднее в инсте по статистике из инета). Максимально 1 млн
- среднее кол-во подписчиков у пользователя - 200. Максимально 1 млн
- latency на создание поста - 5 секунд
- latency на чтение ленты - 1 секунда
- Пример объекта создания поста:
```json
  {
    "description" : "string| 2000 sym",
    "images": []object(500 KБ),
    "lon": string,
    "lat": string,
    "userID": int
  }
```

### Расчет нагрузки:

| **Описание**                  | **Значение**                        |
|-------------------------------|-------------------------------------|
| **RPS на создание поста**     |                                     |
| - RPS                         | 10 000 000 * 1 / 86 400 = 116       |
| - Размер запроса              | 2 550 КБ                            |
| - Traffic                     | 296 МБ                              |
| **RPS на чтение ленты**       |                                     |
| - RPS                         | 10 000 000 * 10 / 86 400 = 1 160    |
| - Размер ответа               | 600 КБ (в ответе отправляем ссылки на картинки) |
| - Traffic                     | 696 МБ                              |
| **Connections**               | 10 000 000 * 0.1 = 1 000 000        |
