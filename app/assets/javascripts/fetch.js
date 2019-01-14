$(function() {
    const URL = "https://api.hh.ru/vacancies?text=rails";
    let ul = document.createElement('ul');
    document.body.appendChild(ul);
    fetch(URL)
        .then((response) => {
            return response.json();
        })
        .then((result) => result.items.forEach((item) => {
            let li = document.createElement('li');
            li.innerHTML = `<a href="${item.alternate_url}">${item.name}</a>`;
            ul.appendChild(li);
        }))
        .catch((err) => console.error(`ошибка запроса ${err}`));
    ;
});