// $.validator.setDefaults({
//     submitHandler: function (form) {
//         var password = $("#password").val();
//         if (password.trim().length < 32) {
//             password = hex_md5(password);
//             $("#password").val(password);
//             alert("替换成MD5加密后的密码了");
//             console.log(password);
//             // form.submit();
//         }
//     }
// });

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
});