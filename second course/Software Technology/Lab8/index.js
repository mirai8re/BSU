// const model = [
//     {type: 'Address', value }
// ]

// Находим форму заказа и добавляем обработчик события submit
const form = document.querySelector('#taxi-form');
form.addEventListener('submit', handleSubmit);

// Обработчик события submit
function handleSubmit(event) {
    event.preventDefault(); // Отменяем стандартное поведение браузера

    // Получаем значения полей формы
    const address = form.elements['address'].value;
    const phone = form.elements['phone'].value;
    const datetime = form.elements['datetime'].value;
    const name = form.elements['name'].value;

    // Отправляем данные на сервер
    const data = {
        address: address,
        phone: phone,
        datetime: datetime,
        name: name
    };
    fetch('/api/order', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
        .then(response => response.json())
        .then(result => {
            console.log(result);
            alert('Заказ успешно оформлен!');
        })
        .catch(error => {
            console.error(error);
            alert('Произошла ошибка при оформлении заказа.');
        });
}


const taxiForm = document.createElement('form');
taxiForm.id = 'taxi-form';

const addressLabel = document.createElement('label');
addressLabel.textContent = 'Адрес:';
const addressInput = document.createElement('input');
addressInput.type = 'text';
addressInput.name = 'address';
addressInput.required = true;
addressLabel.appendChild(addressInput);

const phoneLabel = document.createElement('label');
phoneLabel.textContent = 'Телефон:';
const phoneInput = document.createElement('input');
phoneInput.type = 'tel';
phoneInput.name = 'phone';
phoneInput.required = true;
phoneLabel.appendChild(phoneInput);

const dateTimeLabel = document.createElement('label');
dateTimeLabel.textContent = 'Дата и время:';
const dateTimeInput = document.createElement('input');
dateTimeInput.type = 'datetime-local';
dateTimeInput.name = 'datetime';
dateTimeInput.required = true;
dateTimeLabel.appendChild(dateTimeInput);

const nameLabel = document.createElement('label');
nameLabel.textContent = 'Имя:';
const nameInput = document.createElement('input');
nameInput.type = 'text';
nameInput.name = 'name';
nameInput.required = true;
nameLabel.appendChild(nameInput);

const submitButton = document.createElement('input');
submitButton.type = 'submit';
submitButton.value = 'Заказать';

taxiForm.appendChild(addressLabel);
taxiForm.appendChild(phoneLabel);
taxiForm.appendChild(dateTimeLabel);
taxiForm.appendChild(nameLabel);
taxiForm.appendChild(submitButton);

document.body.appendChild(taxiForm);
