$(document).ready(function () {
    $("#login").validate();
});

$.validator.setDefaults({
    submitHandler: function () {
        // alert("提交事件!");
        form.submit();
    }
});