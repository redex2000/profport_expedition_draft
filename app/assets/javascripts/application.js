// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require popper
//= require bootstrap-sprockets

$(function() {
    var CallbackRegistry = {};

    function testJSONP(url, onSuccess, onError) {
        console.log('Привет, JSONP');

        var scriptOK = false;
        var callbackName = 'callbackName'; //`cb${String(Math.random()).slice(-6)}`;
        url += ~url.indexOf('?') ? '&' : '?';
        url += `callback=CallbackRegistry.${callbackName}`;

        CallbackRegistry[callbackName] = function(data) {
            scriptOK = true;
            delete CallbackRegistry[callbackName];
            onSuccess(data);
        };

        function checkCallback() {
            if (scriptOK) return;
            delete CallbackRegistry[callbackName];
            onError(url);
        }

        var script = document.createElement('script');

        script.onload = script.onerror = checkCallback;
        script.src = url;

        document.body.appendChild(script);
    }

    function onOk(data) {
        console.log(`Данные загружены ${data}`);
    }

    function onFail(url) {
        console.log(`Некорректный URL ${url}`);
    }

    $('#test_jsonp').click(() => {
        testJSONP('/expeditions/jsonp.js', onOk, onFail);
    });

});