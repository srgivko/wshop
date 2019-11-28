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
    // todo show event message
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