function send(callback, method, url, params) {
    if (typeof params === "undefined") {
        params = "";
    }

    var request = new XMLHttpRequest();

    request.onreadystatechange = function() {
        /*if (request.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
            console.log("Headers -->");
            console.log(request.getAllResponseHeaders());
            console.log("Last modified -->");
            console.log(request.getResponseHeader ("Last-Modified"));

        }
        else*/ if (request.readyState === XMLHttpRequest.DONE) {
            callback(request.responseText);
        }
    }

    request.open(method, url);
    request.send();
}

function get(callback, url) {
    send(callback, "GET", url);
}
