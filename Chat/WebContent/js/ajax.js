//网页加载完成时调用
$(function () {
    //发送ajax请求
    $.ajax({
        url: "http://localhost:8080/RJSZ/index",
        type: "get",
        dataType: "json",
        cache: false,
        async: false,

        success:function (data) {
            if (data.code==200) {
                var data1=data.data;
                for (let i in data1) {
                    str +="<span> <img>"  +"<tr><td><img src='"  +data1[i].img1+"' /></td> <td>"+data1[i].pname+"</td>   </tr>"+"</span><br/>";
                }
                $("#showimg").html(str);
            }
        }
    })
})