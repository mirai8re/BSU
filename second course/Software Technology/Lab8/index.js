// Получаем элементы формы по их id
var form = document.getElementById("taxi-form");
var address = document.getElementById("address");
var phone = document.getElementById("phone");
var date = document.getElementById("date");
var name = document.getElementById("name");
var button = document.getElementById("submit");

// Добавляем обработчик события на кнопку отправки формы
button.addEventListener("click", function(event) {
// Предотвращаем стандартное поведение формы (перезагрузку страницы)
    event.preventDefault();
// Проверяем, что все поля заполнены
    if (address.value && phone.value && date.value && name.value) {
// Создаем объект заказа такси с данными из формы
        var order = {
            address: address.value,
            phone: phone.value,
            date: date.value,
            name: name.value
        };
// Преобразуем объект заказа в JSON-строку
        var orderJSON = JSON.stringify(order);
// Отправляем JSON-строку на сервер с помощью AJAX-запроса
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "https://taxi-order-mironova.web.app"); // Выдуманный адрес сервера
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.send(orderJSON);
// Обрабатываем ответ от сервера
        xhr.onload = function() {
            if (xhr.status == 200) {
// Если статус ответа 200 (успешно), то выводим сообщение об успешном заказе
                alert("Ваш заказ успешно оформлен!");
// Очищаем поля формы
                form.reset();
            } else {
// Если статус ответа не 200, то выводим сообщение об ошибке
                alert("Произошла ошибка при оформлении заказа. Пожалуйста, попробуйте еще раз.");
            }
        };
    } else {
// Если какое-то поле не заполнено, то выводим сообщение о необходимости заполнить все поля
        alert("Пожалуйста, заполните все поля формы.");
    }
});