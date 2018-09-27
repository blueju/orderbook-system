$().ready(function () {
    $("#login").validate({
        // 提交操作
        submitHandler: function (form) {
            var password = $("#password").val();
            if (password.trim().length < 32) {
                password = hex_md5(password);
                $("#password").val(password);
                form.submit();
            }
        },
        // 规则
        rules: {
            //	学号必填
            studentId: {
                required: true,
                checkStudentId: true
            },
            //	密码必填
            password: {
                required: true,
                rangelength: [4, 10]
            }
        },
        // 错误提示文本
        messages: {
            studentId: {
                required: "学号不得为空",
                checkStudentId: "学号非法"
            },
            password: {
                required: "密码不得为空",
                rangelength: "密码长度必须介于 4 和 10 之间"
            }
        }
    });
});