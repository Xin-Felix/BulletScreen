<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>弹幕墙</title>
    <meta charset="UTF-8">
    <script src="static/js/jquery.js" type="text/javascript"></script>
    <link href="static/js/swiper.min.css" rel="stylesheet" type="text/css"/>
    　
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
    <script src="static/js/swiper.min.js" type="text/javascript"></script>

    <style>

        body {

            background-color: #e74c3c;

            animation: bg-color 10s infinite;

            -webkit-animation: bg-color 10s infinite;

        }

        @-webkit-keyframes bg-color {

            0% {
                background-color: #e74c3c;
            }

            20% {
                background-color: #f1c40f;
            }

            40% {
                background-color: #1abc9c;
            }

            60% {
                background-color: #3498db;
            }

            80% {
                background-color: #9b59b6;
            }

            100% {
                background-color: #e74c3c;
            }

        }

        @keyframes bg-color {

            0% {
                background-color: #e74c3c;
            }

            20% {
                background-color: #f1c40f;
            }

            40% {
                background-color: #1abc9c;
            }

            60% {
                background-color: #3498db;
            }

            80% {
                background-color: #9b59b6;
            }

            100% {
                background-color: #e74c3c;
            }

        }

        #audio_btn {
            position: absolute;
            top: 0px;
            left: 0px;
            z-index: 999999;
        }

        input {
            display: block;
            width: 100%;
            border: none;
            font-size: 1em;
            line-height: 1.5em;
            margin: 0;
            padding: 0.5em;
            resize: none;
            font-family: inherit;
            color: inherit;
            box-sizing: border-box;
        }

        .send-btn {
            float: left;
        }

        ul {
            padding: 0px;
            margin: 0px;
        }

        li {
            list-style: none;
            padding: 0px;
            margin: 0px;
            width: 100%;
        }

        #conts p {
            width: 100%;
            word-break: break-all;
            padding: 3px 0px 3px 0px;
            margin: 0px;
        }

        .dm .d_screen .d_del {
            width: 38px;
            height: 38px;
            background: #600;
            display: block;
            text-align: center;
            line-height: 38px;
            text-decoration: none;
            font-size: 20px;
            color: #fff;
            border-radius: 19px;
            border: 1px solid #fff;
            position: absolute;
            top: 10px;
            right: 20px;
            z-index: 3;
            display: none;
        }

        .dm .d_screen .d_del:hover {
            background: #f00;
        }

        .dm .d_screen .d_mask {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            opacity: 0.5;
            filter: alpha(opacity=50);
            z-index: 1;
        }

        .dm .d_screen .d_show {
            position: relative;
            z-index: 2;
        }

        .dm .d_screen .d_show div {
            font-weight: 500;
            color: #fff;
            position: absolute;
            left: 0;
            top: 0;
        }

        #showmeg p {
            font-weight: bold;
            text-align: center;
        }

        .d_show div {
            width: 230px;
            heigth: 50px;
        }

        .d_show p {
            heigth: 50px;
            text-overflow: ellipsis;
        }

        #audio_btn {
            position: absolute;
            top: 0px;
            left: 0px;
            z-index: 999999;
        }

        .masked {
            text-align: center;
            background-image: -webkit-linear-gradient(left, #147B96, #E6D205 25%, #147B96 50%, #E6D205 75%, #147B96);
            -webkit-text-fill-color: transparent;
            -webkit-background-clip: text;
            -webkit-background-size: 200% 100%;
            -webkit-animation: masked-animation 4s infinite linear;
        }

        @-webkit-keyframes masked-animation {
            0% {
                background-position: 0 0;
            }
            100% {
                background-position: -100% 0;
            }
        }


    </style>
</head>

<body style="position:fixed;padding:0px;margin:0px;left:0;right:0;top:0;bottom:0;">
<audio id="music" src="static/BeTheBest.mp3" autoplay="autoplay" loop="loop"></audio>
<a id="audio_btn"><img src="static/play.png" width="40" height="45" id="music_btn" border="0"></a>
<div class="swiper-container">
    <div id="conts"
         style="color:#fff000;margin:0 auto;padding-bottom:130px;padding-left:2%;padding-right:2%;padding-bottom:230px;height:80%;">
        <div style="position:absolute;height:160px;background:rgba(0,0,0,0);z-index:99999;width:260px;top:20%;left:30%;display:none;"
             id="showmeg" class="swing">
            <p style="color:#6F81BD;">欢迎来到</p>
            <p style="color:#8064A2;">尽情的吐槽吧~</p>
            <p style="color:#C0504D;">祝大家玩的开心！</p>
            <p style="color:#9BBB59;">哈哈哈哈哈哈哈哈哈哈哈哈~~~</p>
        </div>
        <div class="dm">
            <!--d_screen start-->
            <div class="d_screen" style="height:100%;">
                <a href="#" class="d_del">X</a>
                <div class="d_mask"></div>
                <div class="d_show">

                </div>
            </div>
        </div>
    </div>
</div>
<div style="position:fixed;left:0%;bottom:0px;height:100px;width:100%;z-index:99999;background:rgba(0,0,0,0)">

    <div id="reply-form2" style="padding-top:8px;padding-bottom:30px;margin:0 auto;">
        <div class="input" style="width:65%;float:left;margin-left:5%;">
            <input id="reply-write" name="content" type="text" value="" placeholder="输入文字">
        </div>
        <div class="send-btn">
            <a style="background-color:#00CCCC;color:#fff;width: 4em;height: 2.5em;display: inline-block;text-align: center;line-height: 2.5em;cursor:pointer"
               onClick="send_reply2()">发送</a>
        </div>
    </div>
</div>
<script>

    lengthId = 50;

    //随机获取颜色值
    function getRandomColor() {
        return '#' + (function (h) {
            return new Array(7 - h.length).join("0") + h
        })((Math.random() * 0x1000000 << 0).toString(16))
    }


    //随机大小
    function getRandomSize() {
        //x上限，y下限
        var x = 65;
        var y = 20;
        return parseInt(Math.random() * (x - y + 1) + y);
    }

    $(function () {
        $.ajax({
            type: 'post',
            url: '/getNewData',
            dataType: 'json',
            success: function (data) {
                var html = "";
                for (var i = 0; i < data.length; i++) {
                    html = "<div id=" + data[i].id + " style='font-size:" + getRandomSize() + ";color:" + getRandomColor() + "'><p class='masked'>" + data[i].content + "</p></div>";
                    lengthId = data[0].id;
                    $(".d_show").append(html);

                    var _left = $(window).width() - $("#" + data[i].id).width() + 220;

                    $("#" + data[i].id).css({
                        left: _left,
                        top: parseInt(Math.random() * (window.screen.height - 200 - 10 + 1) + 10)
                    });

                    $("#" + data[i].id).animate({
                        left: "-" + _left + "px"
                    }, parseInt(Math.random() * (25000 - 10000 + 1) + 10000), function () {
                    });

                    setTimeout(function () {
                    }, parseInt(Math.random() * (3000 - 1000 + 1) + 1000));
                }

            },
        })
        ;
    })
    $(function () {
        $("#audio_btn").click(function () {
            var music = document.getElementById("music");
            if (music.paused) {
                music.play();
                $("#music_btn").attr("src", "static/play.png");
            } else {
                music.pause();
                $("#music_btn").attr("src", "static/pause.png");
            }
        });

        $("span [class='swiper-pagination-bullet swiper-pagination-bullet-active']").index();

    })

    function send_reply2() {
        var content = $("#reply-write").val();
        if ($.trim(content) == "") {
            alert("亲，请输入你的想说的话！");
            return false;
        }

        var text = $("#reply-write").val();
        $.ajax({
            type: 'post',
            url: '/save/' + text,
            success: function (data) {
                if (data == 200) {
                    $("#reply-write").val("");
                } else {
                    alert("出现错误，请稍后再试~");
                }
            },
        });


    }

    //弹幕一会显示一会消失
    window.onload = function () {
        setTimeout(show, 10000);
    }

    //显示
    function show() {
        document.getElementById('showmeg').style.display = "block";
        $("#showmeg").animate({
            top: '40%'
        }, 3000);
        $("#showmeg").animate({
            top: '20%'
        }, 3000);
        $("#showmeg").animate({
            left: '10%'
        }, 3000);
        setTimeout(hide, 10000);
    }

    //隐藏
    function hide() {
        document.getElementById('showmeg').style.display = "none";
        setTimeout(show, 10000);
    }


    //考虑数据的交互，多久请求一下数据库
    $(document).ready(function () {
        setInterval("startRequest()", 1000);
    });

    function startRequest() {
        $.ajax({
            type: 'post',
            url: '/getData/' + lengthId,
            dataType: 'json',
            success: function (data) {
                var aaa = "";
                for (var i = 0; i < data.length; i++) {
                    aaa = "<div id=" + data[i].id + " style='font-size:" + getRandomSize() + ";color:" + getRandomColor() + "'><p class='masked'>" + data[i].content + "</p></div>";
                    lengthId = data[i].id;
                    $(".d_show").append(aaa);

                    var _left = $(window).width() - $("#" + data[i].id).width() + 220;

                    $("#" + data[i].id).css({
                        left: _left,
                        top: parseInt(Math.random() * (window.screen.height - 100 - 10 + 1) + 10)
                    });

                    $("#" + data[i].id).animate({
                        left: "-" + _left + "px"
                    }, parseInt(Math.random() * (25000 - 10000 + 1) + 10000), function () {
                    });

                    setTimeout(function () {
                    }, parseInt(Math.random() * (4000 - 1000 + 1) + 1000));
                }
            },
        });
    }

</script>


</body>

</html>