'use strict';

function removeSaleProduct(saleId, saleProductId) {
    const targetTr = event.target.closest('tr');
    deleteData(`/sales/${saleId}/saleProduct/${saleProductId}`)
        .then(data => {
            targetTr.remove();
        })
        .catch(error => console.error(error));
}

function removeSubscriber(id) {
    const targetTr = event.target.closest('tr');
    deleteData(`/subscribers/${id}`)
        .then(data => {
            targetTr.remove();
        })
        .catch(error => console.error(error));
}

function deleteData(url = '') {
    // Значения по умолчанию обозначены знаком *
    return fetch(url, {
        method: 'DELETE', // *GET, POST, PUT, DELETE, etc.
        mode: 'cors', // no-cors, cors, *same-origin
        cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
        credentials: 'same-origin', // include, *same-origin, omit
        redirect: 'follow', // manual, *follow, error
        referrer: 'no-referrer', // no-referrer, *client
    });
       // .then(response => response.json()); // парсит JSON ответ в Javascript объект
}