$(function() {
    let xhr = new XMLHttpRequest();
    xhr.open('GET', 'http://localhost:3001/expeditions1.html', true);
    xhr.setRequestHeader('Content-type', 'text/html; charset=utf-8');
    xhr
        .addEventListener('load', (event) => {
            console.log(xhr.responseText);
        });
    xhr
        .addEventListener('error', (event) => {
            console.error(xhr);
        })
    ;
    try {
        xhr.send();
    } catch(e) {
        console.error(e.getMessage());
    }
});