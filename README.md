# Gamp Forest :cake:

## Описание проекта :page_facing_up:
Сайт кондитерской предоставляет возможность пользователям просматривать каталог выпечки, а также делать заказы. Администраторы могут управлять товарами, заказами и пользователями.

## Технологии
- Spring Framework 5
- Hibernate 5
- MySQL
- Java
- Tomcat 9.4

## Как начать :rocket:
### Требования 
- Java Development Kit (JDK) 11 или выше.
- MySQL сервер.
- Apache Tomcat 9.4.
- Apache Maven.
- Git.
### Установка
1. Клонируйте репозиторий:
```
git clone https://github.com/Kozhanov-V/confectionerySite
```
2. Перейдите в каталог проекта:
``` 
cd confectionerySite
```
3. Соберите проект с помощью Maven:
``` 
mvn clean install 
```
### Конфигурация
1. Создайте базу данных MySQL и пользователя с правами доступа к ней.
- В репозитории откройте файл "database.sql" 
- Запустите sql скрипт для создания данной БД
2. Отредактируйте файл src/main/webapp/WEB-INF/application.properties, указав настройки для подключения к базе данных:
``` 
<property name="jdbcUrl" value="jdbc:mysql://localhost:3306/confectionery?useSSL=false&amp;allowPublicKeyRetrieval=true&amp;serverTimezone=UTC" />
<property name="user" value="your_database_username" />
<property name="password" value="your_database_password" />
```
### Запуск
1. Скопируйте собранный .war файл из каталога target в каталог webapps вашего сервера Tomcat.
2. Запустите сервер Tomcat.
3. Откройте веб-браузер и перейдите по адресу http://localhost:8080/.

## Заключение
Спасибо за интерес к моему проекту. Я всегда рад вашим идеям и предложениям! :heart: :star2:
