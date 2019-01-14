$(function() {
    let coin = new Promise((resolve, reject) => {
        let res = Math.round((Math.random()*100));
        if (res > 50)
            reject(`Сдаём сессию`);
        else
            resolve(`Летим в космос`);
    });
    coin
        .then((result) => console.log(result))
        .catch((err) => console.error(err))
    ;
});