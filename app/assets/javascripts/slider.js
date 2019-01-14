window.addEventListener('load', main);

const PREFIX = "/assets/slider/";
let slides = ['slide1.jpg', 'slide2.jpg', 'slide3.jpg', 'slide4.jpg'];
let currentSlide = 0;

function main() {
    document.querySelector('#slide-right').addEventListener('click', moveRight);
}

function moveRight(event) {
    event.preventDefault();
    currentSlide = ++currentSlide % slides.length;
    document.querySelector('#slide').setAttribute('src', `${PREFIX}${slides[currentSlide]}`);
}