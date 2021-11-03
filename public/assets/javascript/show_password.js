$(document).ready(function () {
    var checkbox = $("#checkbox");
    var password = $("#password");
    checkbox.click(function () {
        if (checkbox.prop("checked")) {
            password.attr("type", "text");
        } else {
            password.attr("type", "password");
        }
    });
});
