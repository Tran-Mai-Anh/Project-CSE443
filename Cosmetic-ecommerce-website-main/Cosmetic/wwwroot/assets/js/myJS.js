


function showLoginPopup(modalType) {
    const modal = new bootstrap.Modal(document.getElementById('loginRequiredModal' + modalType));
    modal.show();
}

function redirectToLogin(extraParams = {}) {
    const currentUrl = window.location.pathname;
    const queryParams = new URLSearchParams(extraParams);

    const fullReturnUrl = currentUrl + (queryParams.toString() ? '?' + queryParams.toString() : '');

    window.location.href = `/Home/Login?returnUrl=${encodeURIComponent(fullReturnUrl)}`;
}



function notLoginInProductDetail() {
    const size = document.getElementById('size').value;
    const quantity = document.getElementById('quantity').value;
    redirectToLogin({
        size: size,
        quantity: quantity
    });
}

function showMessage(text) {
    var message = document.getElementById('messageContainer');

    if (message) {
        message.innerText = text;
        message.style.display = 'block';

        setTimeout(function () {
            message.style.display = 'none';
        }, 3000);
    }
}


function addToCart(productId) {
    const sizeElement = document.getElementById("size");
    const quantityElement = document.getElementById("quantity");

    const size = sizeElement ? sizeElement.value : null;
    const quantity = quantityElement ? parseInt(quantityElement.value) : 1;

    $.ajax({
        url: '/Carts/AddProductToCart',
        method: 'POST',
        data: { productId: productId, productSize: size, quantity: quantity },
        success: function (data) {
            if (data.success) {
                $.ajax({
                    url: '/Carts/ReloadMiniCart',
                    method: 'POST',
                    success: function (html) {
                        $("#miniCartContainer").html(html);
                    },
                    error: function (xhr, status, error) {
                        console.error('AJAX Error reloading MiniCart:', error);
                    }
                });

                showMessage(data.message);
            }
        },
        error: function (xhr, status, error) {
            console.error('AJAX Error:', error);
        }
    });
}

function changeQuantityCartItem(cartItemId, productSize, newQuantity) {
    const inputElement = document.getElementById(`quantity-${cartItemId}`);
    const isChecked = document.getElementById(`cartItem-checkbox-${cartItemId}`).checked;
    if (newQuantity == null) {
        newQuantity = Math.min(100, Math.max(1, inputElement.value));
    }

    inputElement.value = Math.min(100, Math.max(1, newQuantity));

    $.ajax({
        url: "/Carts/ChangeQuantityCartItem",
        method: "POST",
        data: {
            cartItemId: cartItemId,
            newQuantity: newQuantity,
            productSize: productSize
        },
        success: function (data) {
            if (data.success) {
                if (isChecked) {
                    changeTotalPriceText(data.newFinalPrice, data.newTotalPrice);
                }
                changePriceTextInCartItem(cartItemId, data.finalPrice, data.totalPrice, data.productPriceAfterDiscount, data.productDiscount, data.productPrice);

            }
        },
        error: function (xhr, status, error) {
            console.error("AJAX Error for change quantity cart item ", error);
        }
    });
}

function handleToggleCheckBoxCartItem(checkbox, productSize) {
    var isChecked = checkbox.checked;
    var cartItemId = checkbox.getAttribute("data-cartItemCheckBoxId");
    console.log(isChecked, " hehe");
    $.ajax({
        url: "/Carts/toggleCheckBoxCartItem",
        method: "POST",
        data: {
            cartItemId: cartItemId,
            isChecked: isChecked,
            productSize: productSize
        },
        success: function (data) {
            if (data.success) {

                changeTotalPriceText(data.newFinalPrice, data.newTotalPrice);

                changePriceTextInCartItem(cartItemId, data.finalPrice, data.totalPrice, data.productPriceAfterDiscount, data.productDiscount, data.productPrice);
            }
        },
        error: function (xhr, status, error) {
            console.error("AJAX Error for change quantity cart item ", error);
        }
    });
}

function changePriceTextInCartItem(cartItemId, finalPrice, totalPrice, productPriceAfterDiscount, productDiscount, productPrice) {
    const finalPriceElement = document.querySelector(`#finalPrice-${cartItemId}`);
    const totalPriceElement = document.querySelector(`#totalPrice-${cartItemId}`);
    const productPriceAfterDiscountElement = document.querySelector(`#productPriceAfterDiscount-${cartItemId}`);
    const productPriceElement = document.querySelector(`#productPrice-${cartItemId}`);

    finalPriceElement.innerText = `$${finalPrice.toFixed(2)}`;
    productPriceAfterDiscountElement.innerText = `$${productPriceAfterDiscount.toFixed(2)}`
    if (totalPriceElement) {
        totalPriceElement.innerText = `$${totalPrice.toFixed(2)}`;
    }
    if (productPriceElement) {
        productPriceElement.innerText = `$${productPrice.toFixed(2)}`;
    }
    if (productDiscount == 0) {
        if (totalPriceElement) totalPriceElement.style.display = "none";
        if (productPriceElement) productPriceElement.style.display = "none";
    } else {
        if (totalPriceElement) totalPriceElement.style.display = "block";
        if (productPriceElement) productPriceElement.style.display = "block";
    }
}

function changeTotalPriceText(newFinalPrice, newTotalPrice) {
    const finalPriceFromAllCartItems = document.querySelector(`#finalPriceFromAllCartItems`);
    const totalPriceFromAllCartItems = document.querySelector(`#totalPriceFromAllCartItems`);
    const discountPriceFromAllCartItems = document.querySelector(`#discountPriceFromAllCartItems`);
    var prevFinalPriceAll = parseFloat(finalPriceFromAllCartItems.innerText.replace('$', ''));
    var prevTotalPriceAll = parseFloat(totalPriceFromAllCartItems.innerText.replace('$', ''));
    var newFinalPriceAll = newFinalPrice + prevFinalPriceAll;
    var newTotalPriceAll = newTotalPrice + prevTotalPriceAll;
    finalPriceFromAllCartItems.innerText = `$${(newFinalPriceAll).toFixed(2)}`;
    totalPriceFromAllCartItems.innerText = `$${(newTotalPriceAll).toFixed(2)}`;
    discountPriceFromAllCartItems.innerText = `$${(newTotalPriceAll - newFinalPriceAll).toFixed(2)}`;
}

function updatePriceInProductDetail(discount) {
    const selectedOption = document.getElementById('size').options[document.getElementById('size').selectedIndex];
    const quantity = document.getElementById("quantity").value;

    const price = parseFloat(selectedOption.getAttribute('data-price')) * quantity;
    if (discount != 0) {
        const originalPriceElement = document.getElementById('original-price');
        const discountPriceElement = document.getElementById('discount-price');

        const discountedPrice = price * ((100 - discount) / 100);

        originalPriceElement.textContent = '$' + price.toFixed(2);
        discountPriceElement.textContent = '$' + discountedPrice.toFixed(2);
    } else {
        document.getElementById('discount-price').textContent = '$' + price.toFixed(2);
    }
}



function loadUserSection(section) {
    $.ajax({
        url: `/Customer/LoadSection?section=${section}`,
        type: 'GET',
        success: function (html) {
            document.getElementById('customerAllInformation').innerHTML = html;
        },
        error: function () {
            alert('Error loading content.');
        }
    });
}

function successFunc(response) {
    if (response.success) {
        loadUserSection('customerProfile');
    } else {
        // Clear all old validation errors
        $(".text-danger").text('');

        if (response.fieldErrors) {
            for (var field in response.fieldErrors) {
                var errorMessage = response.fieldErrors[field];
                $("[data-valmsg-for='" + field + "']").text(errorMessage);
            }
        } else {
            alert('Đã xảy ra lỗi, vui lòng thử lại.');
        }
    }
}

function errorFunc(errorMessage) {
    alert('Có lỗi khi gửi dữ liệu: ' + errorMessage);
}

function submitFormData(formId, successCallback, errorCallback) {
    var form = document.getElementById(formId);
    if (!form) {
        console.error('Form not found: ' + formId);
        if (typeof errorCallback === 'function') errorCallback('Form not found');
        return;
    }

    var formData = $(form).serialize();
    var actionUrl = form.getAttribute('action');

    if (!actionUrl) {
        console.error('Action URL not found.');
        if (typeof errorCallback === 'function') errorCallback('Action URL missing');
        return;
    }

    $.ajax({
        url: actionUrl,
        type: 'POST',
        data: formData,
        success: function (response) {
            if (typeof successCallback === 'function') successCallback(response);
        },
        error: function (xhr) {
            console.error('AJAX Error:', xhr.responseText);
            if (typeof errorCallback === 'function') errorCallback(xhr.responseText);
        }
    });
}

