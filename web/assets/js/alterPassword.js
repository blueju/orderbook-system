$().ready(function () {
    $("#alterPasswordForm").validate({
        // 提交操作
        submitHandler: function (form) {
            var beforeMD5_password = $("#newPassword").val();
            if (beforeMD5_password.trim().length < 32) {
                var afterMD5_password = hex_md5(beforeMD5_password);
                $("#newPassword").val(afterMD5_password);
                form.submit();
            }
        },
        errorPlacement: "span",
        errorPlacement: function (error, element) {
            $(element)
                .closest("form")
                .find("label[for='" + element.attr("id") + "']")
                .append(error);
        },
        // 规则
        rules: {
            //	学号必填
            oldPassword: {
                required: true,
                rangelength: [4, 10]
            },
            //	密码必填
            newPassword: {
                required: true,
                rangelength: [4, 10]
            }
            ,
            //	确认密码必填
            againConfirmPassword: {
                required: true,
                equalTo:
                    "#newPassword"
            }
        },
        // 错误提示文本
        messages: {
            oldPassword: {
                required: "（旧密码不能为空）",
                rangelength:
                    "（密码长度必须介于 4 和 10 之间）",
                remote: "旧密码错误"
            }
            ,
            newPassword: {
                required: "（新密码不能为空）",
                rangelength:
                    "（密码长度必须介于 4 和 10 之间）"
            }
            ,
            againConfirmPassword: {
                required: "（确认密码不能为空）",
                equalTo:
                    "（两次密码输入不一致）"
            }
        }
    })
});