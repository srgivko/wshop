// todo show event message
$(function () {
    updateCartItemCount();
});

function addItemToCart(id) {
    $.ajax({
        url: '/cart/items',
        type: "POST",
        dataType: "json",
        contentType: "application/json",
        data: '{"id":"' + id + '"}"',
        complete: function (responseData, status, xhttp) {
            updateCartItemCount();
        }
    });
}

function updateCartItemCount() {
    $.ajax({
        url: '/cart/items/count',
        type: "GET",
        dataType: "json",
        contentType: "application/json",
        complete: function (responseData, status, xhttp) {
            $('#cart-item-count').text('(' + responseData.responseJSON.count + ')');
            $('#cart-item-amount').text(responseData.responseJSON.amount+' б.р.');
            $('#cart-item-amount').addClass('animate-top');
            $('#cart-item-count').addClass('animate');
            setTimeout(function () {
                $('#cart-item-count').removeClass('animate');
                $('#cart-item-amount').removeClass('animate-top');
            }, 3000)
        }
    });
}

function updateCartItemQuantity(id, quantity) {
    $.ajax({
        url: '/cart/items',
        type: "PUT",
        dataType: "json",
        contentType: "application/json",
        data: '{ "product" :{ "id":"' + id + '"},"quantity":"' + quantity + '"}',
        complete: function (responseData, status, xhttp) {
            updateCartItemCount();
            location.href = '/cart'
        }
    });
}

function removeItemFromCart(id) {
    $.ajax({
        url: '/cart/items/' + id,
        type: "DELETE",
        dataType: "json",
        contentType: "application/json",
        complete: function (responseData, status, xhttp) {
            updateCartItemCount();
            location.href = '/cart'
        }
    });
}

function removeProductFromWishlist(id,target) {
    // todo show event message
    $.ajax({
        url: '/wishlist/products/' + id,
        type: 'DELETE',
        dataType: 'json',
        contentType: 'application/json',
        complete: function (responseData, status, xhttp) {
            target.style.display = 'none';
            target.previousElementSibling.style.display  = '';
            console.log('Success remove product with id = '+ id);
        }
    });
}

function addProductToWishlist(id, target) {
    $.ajax({
        url: '/wishlist/products',
        type: 'POST',
        dataType: 'json',
        contentType: 'application/json',
        data: '{"id":"' + id + '"}"',
        complete: function (responseData, status, xhttp) {
            target.style.display = 'none';
            target.nextElementSibling.style.display = '';
            console.log('Success add product with id = '+ id);
        }
    });
}

function subscribe() {
    const email = {
        email: event.target.previousElementSibling.value
    };
    postData('/subscribe', email)
        .then(data => alert(`You are subscribe ${data.email}`))
        .catch(reason => console.log(reason));
}

function postData(url = '', data = {}) {
    // Значения по умолчанию обозначены знаком *
    return fetch(url, {
        method: 'POST', // *GET, POST, PUT, DELETE, etc.
        mode: 'cors', // no-cors, cors, *same-origin
        cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
        credentials: 'same-origin', // include, *same-origin, omit
        headers: {
            'Content-Type': 'application/json',
            // 'Content-Type': 'application/x-www-form-urlencoded',
        },
        redirect: 'follow', // manual, *follow, error
        referrer: 'no-referrer', // no-referrer, *client
        body: JSON.stringify(data), // тип данных в body должен соответвовать значению заголовка "Content-Type"
    })
        .then(response => response.json()); // парсит JSON ответ в Javascript объект
}