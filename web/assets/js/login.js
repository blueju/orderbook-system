$(document).ready(function () {
    $("#login").validate();
});

$("#login").validate({
    // 规则
    rules: {
        //	学号必填
        studentId: {
            required: true,
            // max: 15251101262
        },
        //	密码必填
        password: {
            required: true
        }
    },
    // 错误提示文本
    messages: {
        studentId: {
            required: "请输入学号11",
            // max: "输入值不能大于 15251101262"
        },
        password: {
            required: "请输入密码"
        }
    }
});

$.validator.setDefaults({
    submitHandler: function () {
        // alert("提交事件!");
        form.submit();
    }
});