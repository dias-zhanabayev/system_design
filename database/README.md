# Модель хранения данных

В качестве технологии БД для хранения всех данных (кроме статики) выбираю *PostgreSQL*. Она обладает хорошей производительностью и масштабируемостью, а также поддерживает JSON-поля, что позволит хранить сложные структуры данных в одной таблице.
Статика (изображения в моем случае) будут храниться в BLOB-хранилище (S3).

Планируется в отдельных БД хранить:
* Пользователей
* Посты
* Чаты

## Модель хранения
![image info](./diagrams.png)