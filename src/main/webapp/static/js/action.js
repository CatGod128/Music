var nowSong = "./mp3/cd.mp3";
var t;
var rt;
var sc = "black";
var jd = 0;
var pt;
var picI = -10

var isStart;
var startX;
var DX;

function Load() {
    chad()

    // 音量滑块控制
    volslider.style.left = "93px";

    document.onmousedown = function (ev) {
        startX = ev.screenX;
        DX = parseInt(volslider.style.left);
    };

    document.onmousemove = function (ev) {
        if (isStart) {
            volslider.style.visibility = "visible";
            var oDiv = document.getElementById('volslider');
            var i = ev.screenX - startX + DX;
            if (i >= 0 & i <= 100) {
                oDiv.style.left = i - 5 + "px";
                volredbar.style.width = i + "px";
                document.getElementById("music").volume = i / 100;
            }
        }
    };

    document.onmouseup = function () {
        isStart = false;
        volslider.style.visibility = "hidden";
    };

    // -----------------------------------

    // 弹跳箭头周期
    pt = setInterval(function () {
        if (picI < 10) {
            pointPic.style.bottom = 150 + picI + "px";
            picI++;
            // console.log(picI);
            // console.log(pointPic.style.bottom);
        } else
            picI = -10;
    }, 30)

    // -----------------------------------
}


function getfocus() {
    if (searchbox.value == "搜索音乐，歌手，专辑") {
        searchbox.value = "";
        searchbox.style.color = "#fafafa";
    }
}

function lostfocus() {
    if (searchbox.value == "") {
        searchbox.style.color = "#414143";
        searchbox.value = "搜索音乐，歌手，专辑";
    }
}

function bdsearch() {
    if (searchbox.value != "搜索音乐，歌手，专辑")
        open("https://www.baidu.com/s?wd=" + searchbox.value);
}

function serMouseOver() {
    search.src = "../static/pic/searchh.png";
}

function serMouseOut() {
    search.src = "../static/pic/search.png";
}

function mailMouseOver() {
    mail.src = "../static/pic/mailh.png";
}

function mailMouseOut() {
    mail.src = "../static/pic/mail.png";
}

function userMouseOver() {
    user.src = "../static/pic/userh.png";
}

function userMouseOut() {
    user.src = "../static/pic/user.png";
}

function skinMouseOver() {
    skin.src = "../static/pic/skinh.png";
}

function skinMouseOut() {
    skin.src = "../static/pic/skin.png";
}

function ilike() {
    if (like.style.color != "lightgray") {
        like.style.color = "lightgray";
    } else {
        like.style.color = "#b02222";
    }
}

function volMouseOver() {
    volume.src = "../static/pic/volumeh.png";
}

function volMouseOut() {
    volume.src = "../static/pic/volume.png";
}

function volbarMouseOver() {
    volslider.style.visibility = 'visible';
}

function volbarMouseOut() {
    volslider.style.visibility = 'hidden';
}

function upMouseOver() {
    up.src = "../static/pic/uph.png";
}

function upMouseOut() {
    up.src = "../static/pic/up.png";
}

function playMouseOver() {

    if (play.src.match("play")) {
        play.src = "../static/pic/playh.png";
    } else {
        play.src = "../static/pic/pauseh.png";
    }

}

function playMouseOut() {
    if (play.src.match("play")) {
        play.src = "../static/pic/play.png";
    } else {
        play.src = "../static/pic/pause.png";
    }
}

function downMouseOver() {
    down.src = "../static/pic/downh.png";
}

function downMouseOut() {
    down.src = "../static/pic/down.png";
}

function iplay() {
    if (play.src.match("play")) {
        play.src = "../static/pic/pause.png";
        if (!music.src.match("./mp3"))
            music.src = nowSong;
        music.play();
        getTime();
    } else {
        play.src = "../static/pic/play.png";
        music.pause();
        clearTimeout(t);
        clearTimeout(rt);
        ct.style.transform = "rotate(-25deg)";
    }
}

function getTime() {
    clearTimeout(rt);
    jpRun();
    t = setInterval(function () {
        chSong();
        w = (music.currentTime / music.duration);
        redbar.style.width = (w * 500) + "px";
        slider.style.left = (w * 500 - 7) + "px";

        if (parseInt(music.currentTime / 60) < 10)
            ti = "0" + parseInt(music.currentTime / 60) + ":";
        else
            ti = parseInt(music.currentTime / 60) + ":";
        if (parseInt(music.currentTime % 60) < 10)
            ti = ti + "0" + parseInt(music.currentTime % 60);
        else
            ti = ti + parseInt(music.currentTime % 60);
        starttime.innerText = ti;

        if (parseInt(music.duration / 60) < 10)
            ti = "0" + parseInt(music.duration / 60) + ":";
        else
            ti = parseInt(music.duration / 60) + ":";
        if (parseInt(music.duration % 60) < 10)
            ti = ti + "0" + parseInt(music.duration % 60);
        else
            ti = ti + parseInt(music.duration % 60);
        if (ti == "NaN:NaN") {
            ti = "00:00"
            play.src = "./pic/play.png";
            music.pause();
            clearTimeout(t);
            alert("此歌曲文件未能成功加载，请重试。")
        }
        endtime.innerText = ti
        if (redbar.style.width == "500px") {
            downSong();
        }
    }, 1000);
}

function chSong() {
    if (nowSong == "../static/mp3/fqxdsws.mp3") {
        songpic.src = "../static/pic/fqxdsws.png";
        lrcSpan.innerHTML = LRCfuqindesanwenshi;
        songname.innerText = "父亲写的散文诗";
        singername.innerText = "Heron";
        hider.style.backgroundImage = "url(./pic/fqxdsws_gs.jpg)";
    }


    if (nowSong == "../static/mp3/sds.mp3") {
        songpic.src = "../static/pic/sds.png";
        lrcSpan.innerHTML = LRCsundasheng;
        songname.innerText = "孙大剩";
        singername.innerText = "白亮,赵静";
        hider.style.backgroundImage = "url(./pic/sds_gs.jpg)";
    }

    if ((nowSong == "./mp3/cd.mp3")) {
        songpic.src = "./pic/cd.png";
        lrcSpan.innerHTML = LRCchengdu;
        songname.innerText = "成都";
        singername.innerText = "赵雷";
        hider.style.backgroundImage = "url(./pic/cd_gs.jpg)";
    }
}

function downSong() {
    clearTimeout(t);
    music.pause();
    if (nowSong == "./mp3/cd.mp3")
        nowSong = "./mp3/sds.mp3";
    else if (nowSong == "./mp3/sds.mp3")
        nowSong = "./mp3/fqxdsws.mp3";
    else if (nowSong == "./mp3/fqxdsws.mp3")
        nowSong = "./mp3/cd.mp3";
    music.src = nowSong;
    play.src = "./pic/pause.png";
    music.play();
    getTime();
}

function upSong() {
    clearTimeout(t);
    music.pause();
    if (nowSong == "./mp3/cd.mp3")
        nowSong = "./mp3/fqxdsws.mp3";
    else if (nowSong == "./mp3/sds.mp3")
        nowSong = "./mp3/cd.mp3";
    else if (nowSong == "./mp3/fqxdsws.mp3")
        nowSong = "./mp3/sds.mp3";
    music.src = nowSong;
    play.src = "./pic/pause.png";
    music.play();
    getTime();
}


function onZk() {
    sszk.style.visibility = 'visible';
    songpic.style.filter = "alpha(opacity=50)";
    songpic.style.opacity = "0.5";
}

function outZk() {
    sszk.style.visibility = 'hidden';
    songpic.style.filter = "alpha(opacity=100)";
    songpic.style.opacity = "1";
}

function chSkin() {
    if (sc == "black") {
        sc = "red"
        header.style.backgroundColor = "#c62f2f";
        searchbox.style.backgroundColor = "#a82828";
        list.style.backgroundColor = "#f5f5f7";
        content.style.backgroundColor = "#fafafa";
        footer.style.backgroundColor = "#f6f6f8";
        bar.style.backgroundColor = "#e1e1e2";
        volbar.style.backgroundColor = "#e1e1e2";
        document.styleSheets[0].addRule('::-webkit-scrollbar-thumb', 'background-color:#e1e1e2;border-radius: 4px;');
    } else {
        sc = "black"
        header.style.backgroundColor = "#222225";
        searchbox.style.backgroundColor = "#161618";
        list.style.backgroundColor = "#191b1f";
        content.style.backgroundColor = "#16181c";
        footer.style.backgroundColor = "#222225";
        bar.style.backgroundColor = "#191b1f";
        volbar.style.backgroundColor = "#191b1f";
        document.styleSheets[0].addRule('::-webkit-scrollbar-thumb', 'background-color:#2c2e32;border-radius: 4px;');
    }
}

function hideHider() {
    playPart.style.display = "none";
    lrcPart.style.display = "none";
    ssPart.style.display = "none";

    hider.style.width = "0px";
    hider.style.height = "0px";
    hider.style.opacity = "0.5";
    hider.style.transition = "0.3s";
    hider.style.visibility = 'hidden';
}

function showHider() {
    hider.style.width = "1100px";
    hider.style.height = "600px";
    hider.style.opacity = "1";
    hider.style.transition = "0s";
    hider.style.visibility = 'visible';

    playPart.style.display = "inline";
    lrcPart.style.display = "inline";
    ssPart.style.display = "inline";

    clearTimeout(pt);
    pointPic.style.display = "none";
}

function jpRun() {
    ct.style.transform = "rotate(0deg)";
    rt = setInterval(function () {
        jd = jd + 1;
        jp.style.transform = "rotate(" + jd + "deg)";
        if (jd == 360)
            jd = 0;
    }, 40);
}

function showUserPage() {
    mailPage.style.visibility = "hidden";
    userPage.style.visibility = "visible";
    event.stopPropagation(); // 阻止点击事件向上冒泡
}

function showMailPage() {
    userPage.style.visibility = "hidden";
    mailPage.style.visibility = "visible";
    event.stopPropagation(); // 阻止点击事件向上冒泡
}

function ifClick() {
    userPage.style.visibility = "hidden";
    mailPage.style.visibility = "hidden";
}

function chVol() {
    isStart = true;
}

function chad() {
    var i = 1;
    setInterval(function () {
        if (i == 1) {
            i = 2;
            ads1.style.left = "0px";
            ads1.style.top = "10px";
            ads1.style.zIndex = "1";
            ads1.style.height = "200px";
            ads1.style.opacity = "0.5";

            ads2.style.left = "120px";
            ads2.style.top = "-10px";
            ads2.style.zIndex = "3";
            ads2.style.height = "220px";
            ads2.style.opacity = "1";

            ads3.style.left = "290px";
            ads3.style.top = "10px";
            ads3.style.zIndex = "2";
            ads3.style.height = "200px";
            ads3.style.opacity = "0.5";
        } else if (i == 2) {
            i = 3;
            ads1.style.left = "290px";
            ads1.style.top = "10px";
            ads1.style.zIndex = "2";
            ads1.style.height = "200px";
            ads1.style.opacity = "0.5";

            ads2.style.left = "0px";
            ads2.style.top = "10px";
            ads2.style.zIndex = "1";
            ads2.style.height = "200px";
            ads2.style.opacity = "0.5";

            ads3.style.left = "120px";
            ads3.style.top = "-10px";
            ads3.style.zIndex = "3";
            ads3.style.height = "220px";
            ads3.style.opacity = "1";
        } else if (i == 3) {
            i = 1;
            ads1.style.left = "120px";
            ads1.style.top = "-10px";
            ads1.style.zIndex = "3";
            ads1.style.height = "220px";
            ads1.style.opacity = "1";

            ads2.style.left = "290px";
            ads2.style.top = "10px";
            ads2.style.zIndex = "2";
            ads2.style.height = "200px";
            ads2.style.opacity = "0.5";

            ads3.style.left = "0px";
            ads3.style.top = "10px";
            ads3.style.zIndex = "1";
            ads3.style.height = "200px";
            ads3.style.opacity = "0.5";
        }
    }, 2000);
}