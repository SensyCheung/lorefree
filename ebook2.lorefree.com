<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>LoreFree-去中心化免费电子书共享社区</title>
        <meta name="keywords" content="电子书,免费电子书,电子书下载,电子书免费下载,lorefree,lorefree下载,mobi电子书,txt电子书,pdf电子书,epub电子书,电子图书,图书下载">
<meta name="description" content="Lorefree,专业的免费电子书下载网站,支持mobi,epub,pdf,txt,azw3等阅读格式的电子书免费下载">
<meta name="csrf-param" content="_csrf-frontend">
    <meta name="csrf-token" content="yEfl7xEIVwGgnBwxLNkGmEHoJ8bMopOS-iG3tmBHgOSBF6GORmkHTpDmchxznEnrG6tDhJ_GxOPLa4PeNBHL0w==">

<link href="/assets/98969d24/css/bootstrap.css" rel="stylesheet">
<link href="/css/site.css" rel="stylesheet">    <link rel="shortcut icon" href="/favicon.ico">
    <style>
        .book-img {
            display: inline-block;
            width: 35%;
            /*min-width: 25%;*/
            /*height: 90%;*/
            overflow-y: hidden;
            padding: 4px;
            position: absolute;
            left: 0;
            top: 0;
        }

        .book-content {
            display: inline-block;
            overflow-wrap: break-word;
            width: 65%;
            height: 100%;
            padding: 4px;
            position: absolute;
            right: 0;
            top: 0;
        }
        .book-card {
            height: 157px;
            margin-bottom: 15px;
            position: relative;
            padding: 0;
        }
        .col-md-3{
            padding-left:0px;
        }
        @media screen and (min-width: 920px) {
            .book-img {
                display: inline-block;
                width: 35%;
                overflow-y: hidden;
                padding: 4px;
                position: absolute;
                left: 0;
                top: 0;
            }
            .book-content {
                display: inline-block;
                overflow-wrap: break-word;
                width: 65%;
                height: 100%;
                padding: 4px;
                position: absolute;
                right: 0;
                top: 0;
            }
            .book-card {
                height: 137px;
                margin-bottom: 15px;
                position: relative;
                padding: 0;
            }
        }
        .book-cont{

            min-height: 20px;
            padding: 19px;
            margin-bottom: 20px;
            border: 1px solid #e3e3e3;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,0.05);
            -moz-box-shadow: inset 0 1px 1px rgba(0,0,0,0.05);
            box-shadow: inset 0 1px 1px rgba(0,0,0,0.05);

        }
        pre {
            display: block;
            padding: 9.5px;
            margin: 0 0 10px;
            font-size: 13px;
            line-height: 20px;
            word-break: break-all;
            word-wrap: break-word;
            white-space: pre;
            white-space: pre-wrap;
            background-color: #f5f5f5;
            border: 0px solid #ccc;
            border: 0px solid rgba(0,0,0,0.15);
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            background-color: #FFFFFF;
        }

        .book-tag{ display: none;}
        .book-contnet > .active{ display: block;}
        .hr{
            margin: 20px 0;
            border: 0;
            border-top: 1px solid #eee;
            border-bottom: 1px solid #fff;
        }
         .db-book {border-top:1px dashed #ddd;padding: 12px 0 10px;}
        .loading{
            width: 80px;
            height: 40px;
            margin: 0 auto;
            margin-top:100px;
        }
        .loading span{
            display: inline-block;
            width: 8px;
            height: 100%;
            border-radius: 4px;
            background: lightgreen;
            -webkit-animation: load 1s ease infinite;
        }
        @-webkit-keyframes load{
            0%,100%{
                height: 40px;
                background: lightgreen;
            }
            50%{
                height: 70px;
                margin: -15px 0;
                background: lightblue;
            }
        }
        .loading span:nth-child(2){
            -webkit-animation-delay:0.2s;
        }
        .loading span:nth-child(3){
            -webkit-animation-delay:0.4s;
        }
        .loading span:nth-child(4){
            -webkit-animation-delay:0.6s;
        }
        .loading span:nth-child(5){
            -webkit-animation-delay:0.8s;
        }
        .collection_status1{
            display: none;
        }
        .collection_status2{
            display: none;
        }
    </style>
</head>
<body>
<div class="wrap" id="app">
    <nav id="w0" class="navbar-inverse navbar-fixed-top navbar">
        <div class="container"><div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#w0-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">EBOOK</a>
                <a class="navbar-brand" href="http://paper.lorefree.com/" target="_blank">PAPER</a>
            </div>
            <div id="w0-collapse" class="collapse navbar-collapse">
                <ul id="w1" class="navbar-nav navbar-right nav">

                    <li><a href="http://www.lorefree.com">首页</a></li>
                    <li  class="active"><a href="/">搜书</a></li>
                    <li ><a href="/charts">排行榜</a></li>
                    <li ><a href="/site/notice">奖励规则</a></li>
                    <li ><a href="/site/gonglue">攻略</a></li>
                    <li ><a href="/upload" v-if="account != ''">上传</a></li>
                    <li><a href="#" v-if="account == ''" @click="login">登录</a></li>
                    <li class="dropdown " v-if="account != ''" >
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{{account}} <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#" @click="userCollectionList">我的收藏</a></li>
                            <li><a href="#" @click="userhome">个人中心</a></li>
                            <li><a href="#" @click="viphome">会员中心</a></li>
                            <li><a href="#" @click="logoutWallet">退出</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
                        <div class="site-index" >
    <!-- <div class="alert alert-info" role="alert" style="text-align: center">
        <p style="font-size: 20px; padding-bottom: 12px;">上传资源挖矿启动测试，马上登陆上传资源</p>
        <a href="/site/notice"  target="_blank"><<奖励规则>></a>
    </div> -->
    <div style="margin:50px"></div>
    <div class="body-content">
        <div class="row" style="padding-bottom: 12px;">
            <div class="col-lg-6 col-lg-offset-3">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="书名|作者|译者|出版社|文件名" name="s" value="">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button" id="sobookBtn">搜书</button>
                    </span>
                </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->
            <div class="col-lg-3" style="font-size: 18px;">
                <span style="font-size: 12px">收录书:</span>73576   <span style="font-size: 12px">资源:</span>172272                <!--<span style="font-size: 12px">DAU:</span>0  <span style="font-size: 12px">收录书:</span>73576   <span style="font-size: 12px">资源:</span>172272-->
            </div>
        </div><!-- /.row -->
<!--        <div class="row" style="margin-top: 12px;">-->
<!--            <ul class="nav nav-pills">-->
<!--                <li role="presentation" class="active"><a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a></li>-->
<!--                <li role="presentation"><a href="#"><span class="glyphicon glyphicon-random" aria-hidden="true"></span>偶遇</a></li>-->
<!--                <li role="presentation"><a href="#"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span>精华</a></li>-->
<!--                <li role="presentation"><a href="#"><span class="glyphicon glyphicon-fire" aria-hidden="true"></span>热门</a></li>-->
<!--                <li role="presentation"><a href="#"><span class="glyphicon glyphicon-open-file" aria-hidden="true"></span>贡献</a></li>-->
<!--                <li role="presentation"><a href="#"><span class="glyphicon glyphicon-tags" aria-hidden="true"></span>标签</a></li>-->
<!--            </ul>-->
<!--        </div>-->
<!--        <div class="row" style="margin-top: 12px;">-->
<!--            <form class="form-inline">-->
<!--                <div class="form-group">-->
<!--                    <label for="exampleInputName2">评分:</label>-->
<!--                    <select class="form-control" name="minscore">-->
<!--                        <option value="" selected="">全部</option>-->
<!--                        <option value="9.5">&gt;=9.5</option-->
<!--                        <option value="9.0">&gt;=9.0</option>-->
<!--                        <option value="8.5">&gt;=8.5</option>-->
<!--                        <option value="8.0">&gt;=8.0</option>-->
<!--                        <option value="7.5">&gt;=7.5</option>-->
<!--                        <option value="7.0">&gt;=7.0</option>-->
<!--                    </select>-->
<!--                </div>-->
<!--                <div class="form-group">-->
<!--                    <label for="exampleInputEmail2">语言</label>-->
<!--                    <select name="lang" class="form-control">-->
<!--                        <option value="" selected="">全部</option>-->
<!--                        <option value="zh">中文</option>-->
<!--                        <option value="en">英文</option>-->
<!--                    </select>-->
<!--                </div>-->
<!--                <div class="form-group">-->
<!--                    <label for="exampleInputEmail2">排序</label>-->
<!--                    <select name="ordering" class="form-control">-->
<!--                        <option value="upload" selected="">上传</option>-->
<!--                        <option value="score">评分</option>-->
<!--                        <option value="popular">热度</option>-->
<!--                    </select>-->
<!--                </div>-->
<!--                <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>-->
<!--            </form>-->
<!--        </div>-->
        <div class="row" style="margin-top: 12px;">
                        <div class="col-sm-6 col-md-3">
                <div class="thumbnail book-card" style="padding-top: 12px; padding-bottom: 24px;">
                    <a href="/book?account=&bookid=73561">
			                        <img alt="..." class="book-img lazy"  data-original="/images/books/a05d01d119be5ce50a3ce977a417a120.jpg" src="https://lorefree.com/static/images/logo.png">
			                    </a>
                    <div class="caption book-content">
                        <a  href="/book?account=&bookid=73561" ><h4>What Ever Happen</h4></a>
                        <p>Farrell, Henry; Doug</p>
                        <p>
                            <span>
                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span><span>0</span>
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span><span>10</span>
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span><span>0</span>
                            </span>
                            <span class="label label-primary">0</span>
                        </p>
                    </div>
                </div>
            </div>
                        <div class="col-sm-6 col-md-3">
                <div class="thumbnail book-card" style="padding-top: 12px; padding-bottom: 24px;">
                    <a href="/book?account=&bookid=73560">
			                        <img alt="..." class="book-img lazy"  data-original="/images/books/3cf963257fcf9fe4620a1ae8c1efd1d1.jpg" src="https://lorefree.com/static/images/logo.png">
			                    </a>
                    <div class="caption book-content">
                        <a  href="/book?account=&bookid=73560" ><h4>The Son</h4></a>
                        <p>Philipp Meyer</p>
                        <p>
                            <span>
                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span><span>0</span>
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span><span>10</span>
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span><span>0</span>
                            </span>
                            <span class="label label-primary">0</span>
                        </p>
                    </div>
                </div>
            </div>
                        <div class="col-sm-6 col-md-3">
                <div class="thumbnail book-card" style="padding-top: 12px; padding-bottom: 24px;">
                    <a href="/book?account=&bookid=73559">
			                        <img alt="..." class="book-img lazy"  data-original="/images/books/7e7eb7f10c3deb57fea4e1186ea1ac85.jpg" src="https://lorefree.com/static/images/logo.png">
			                    </a>
                    <div class="caption book-content">
                        <a  href="/book?account=&bookid=73559" ><h4>The Switch</h4></a>
                        <p>Sandra Brown</p>
                        <p>
                            <span>
                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span><span>0</span>
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span><span>7</span>
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span><span>0</span>
                            </span>
                            <span class="label label-primary">0</span>
                        </p>
                    </div>
                </div>
            </div>
                        <div class="col-sm-6 col-md-3">
                <div class="thumbnail book-card" style="padding-top: 12px; padding-bottom: 24px;">
                    <a href="/book?account=&bookid=73558">
			                        <img alt="..." class="book-img lazy"  data-original="/images/books/33b88c24ec5169753c8ed27bf7a85c53.jpg" src="https://lorefree.com/static/images/logo.png">
			                    </a>
                    <div class="caption book-content">
                        <a  href="/book?account=&bookid=73558" ><h4>The Travelling C</h4></a>
                        <p>Hiro Arikawa</p>
                        <p>
                            <span>
                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span><span>0</span>
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span><span>14</span>
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span><span>0</span>
                            </span>
                            <span class="label label-primary">8.2</span>
                        </p>
                    </div>
                </div>
            </div>
                        <div class="col-sm-6 col-md-3">
                <div class="thumbnail book-card" style="padding-top: 12px; padding-bottom: 24px;">
                    <a href="/book?account=&bookid=73557">
			                        <img alt="..." class="book-img lazy"  data-original="/images/books/49cf4cd054d173f627ee29c3927becaf.jpg" src="https://lorefree.com/static/images/logo.png">
			                    </a>
                    <div class="caption book-content">
                        <a  href="/book?account=&bookid=73557" ><h4>国际关系史（全套共十卷）</h4></a>
                        <p>王绳祖</p>
                        <p>
                            <span>
                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span><span>0</span>
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span><span>335</span>
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span><span>0</span>
                            </span>
                            <span class="label label-primary">9.1</span>
                        </p>
                    </div>
                </div>
            </div>
                        <div class="col-sm-6 col-md-3">
                <div class="thumbnail book-card" style="padding-top: 12px; padding-bottom: 24px;">
                    <a href="/book?account=&bookid=73556">
			                        <img alt="..." class="book-img lazy"  data-original="/images/books/6746d2380422f3afa18e0fdb100071f7.jpg" src="https://lorefree.com/static/images/logo.png">
			                    </a>
                    <div class="caption book-content">
                        <a  href="/book?account=&bookid=73556" ><h4>在乎</h4></a>
                        <p></p>
                        <p>
                            <span>
                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span><span>0</span>
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span><span>42</span>
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span><span>0</span>
                            </span>
                            <span class="label label-primary">0</span>
                        </p>
                    </div>
                </div>
            </div>
                        <div class="col-sm-6 col-md-3">
                <div class="thumbnail book-card" style="padding-top: 12px; padding-bottom: 24px;">
                    <a href="/book?account=&bookid=73555">
			                        <img alt="..." class="book-img lazy"  data-original="/images/books/80fc547204df9c5ca351f78dd22400aa.jpg" src="https://lorefree.com/static/images/logo.png">
			                    </a>
                    <div class="caption book-content">
                        <a  href="/book?account=&bookid=73555" ><h4>在乎</h4></a>
                        <p>周保松</p>
                        <p>
                            <span>
                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span><span>0</span>
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span><span>126</span>
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span><span>0</span>
                            </span>
                            <span class="label label-primary">9.2</span>
                        </p>
                    </div>
                </div>
            </div>
                        <div class="col-sm-6 col-md-3">
                <div class="thumbnail book-card" style="padding-top: 12px; padding-bottom: 24px;">
                    <a href="/book?account=&bookid=73554">
			                        <img alt="..." class="book-img lazy"  data-original="/images/books/07a2d64fe8e8d878650f7da0d65efb43.jpg" src="https://lorefree.com/static/images/logo.png">
			                    </a>
                    <div class="caption book-content">
                        <a  href="/book?account=&bookid=73554" ><h4>我的青春恋爱物语果然有问题 13</h4></a>
                        <p>渡航</p>
                        <p>
                            <span>
                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span><span>0</span>
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span><span>28</span>
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span><span>0</span>
                            </span>
                            <span class="label label-primary">8</span>
                        </p>
                    </div>
                </div>
            </div>
                        <div class="col-sm-6 col-md-3">
                <div class="thumbnail book-card" style="padding-top: 12px; padding-bottom: 24px;">
                    <a href="/book?account=&bookid=73553">
			                        <img alt="..." class="book-img lazy"  data-original="/images/books/61d0683a35e99d25db17c744188ed56b.jpg" src="https://lorefree.com/static/images/logo.png">
			                    </a>
                    <div class="caption book-content">
                        <a  href="/book?account=&bookid=73553" ><h4>骑士的献祭</h4></a>
                        <p>那多</p>
                        <p>
                            <span>
                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span><span>0</span>
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span><span>103</span>
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span><span>0</span>
                            </span>
                            <span class="label label-primary">7.7</span>
                        </p>
                    </div>
                </div>
            </div>
                        <div class="col-sm-6 col-md-3">
                <div class="thumbnail book-card" style="padding-top: 12px; padding-bottom: 24px;">
                    <a href="/book?account=&bookid=73552">
			                        <img alt="..." class="book-img lazy"  data-original="/images/books/56b382c59ceb08c293e30247286b2435.jpg" src="https://lorefree.com/static/images/logo.png">
			                    </a>
                    <div class="caption book-content">
                        <a  href="/book?account=&bookid=73552" ><h4>别名格雷斯</h4></a>
                        <p>玛格丽特·阿特伍德</p>
                        <p>
                            <span>
                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span><span>0</span>
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span><span>41</span>
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span><span>0</span>
                            </span>
                            <span class="label label-primary">8.2</span>
                        </p>
                    </div>
                </div>
            </div>
                        <div class="col-sm-6 col-md-3">
                <div class="thumbnail book-card" style="padding-top: 12px; padding-bottom: 24px;">
                    <a href="/book?account=&bookid=73551">
			                        <img alt="..." class="book-img lazy"  data-original="/images/books/535ad10e1376c7e0135fbabbd093cf6a.jpg" src="https://lorefree.com/static/images/logo.png">
			                    </a>
                    <div class="caption book-content">
                        <a  href="/book?account=&bookid=73551" ><h4>深渊居民</h4></a>
                        <p>[美] 杰克·伦敦</p>
                        <p>
                            <span>
                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span><span>0</span>
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span><span>75</span>
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span><span>0</span>
                            </span>
                            <span class="label label-primary">8.1</span>
                        </p>
                    </div>
                </div>
            </div>
                        <div class="col-sm-6 col-md-3">
                <div class="thumbnail book-card" style="padding-top: 12px; padding-bottom: 24px;">
                    <a href="/book?account=&bookid=73550">
			                        <img alt="..." class="book-img lazy"  data-original="/images/books/67555bf81e5a26ca56d59fd0cedaf25a.jpg" src="https://lorefree.com/static/images/logo.png">
			                    </a>
                    <div class="caption book-content">
                        <a  href="/book?account=&bookid=73550" ><h4>莱特兄弟</h4></a>
                        <p>【美】戴维·麦卡洛</p>
                        <p>
                            <span>
                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span><span>0</span>
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span><span>58</span>
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span><span>0</span>
                            </span>
                            <span class="label label-primary">7.9</span>
                        </p>
                    </div>
                </div>
            </div>
                        <div class="col-sm-6 col-md-3">
                <div class="thumbnail book-card" style="padding-top: 12px; padding-bottom: 24px;">
                    <a href="/book?account=&bookid=73549">
			                        <img alt="..." class="book-img lazy"  data-original="/" src="https://lorefree.com/static/images/logo.png">
			                    </a>
                    <div class="caption book-content">
                        <a  href="/book?account=&bookid=73549" ><h4>The Unquiet Dead</h4></a>
                        <p>Longworth, Gay</p>
                        <p>
                            <span>
                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span><span>0</span>
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span><span>7</span>
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span><span>0</span>
                            </span>
                            <span class="label label-primary">0</span>
                        </p>
                    </div>
                </div>
            </div>
                        <div class="col-sm-6 col-md-3">
                <div class="thumbnail book-card" style="padding-top: 12px; padding-bottom: 24px;">
                    <a href="/book?account=&bookid=73548">
			                        <img alt="..." class="book-img lazy"  data-original="/images/books/0b4a4516356bab8c915bead07c88c3b8.jpg" src="https://lorefree.com/static/images/logo.png">
			                    </a>
                    <div class="caption book-content">
                        <a  href="/book?account=&bookid=73548" ><h4>治字百方</h4></a>
                        <p>左佐</p>
                        <p>
                            <span>
                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span><span>0</span>
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span><span>127</span>
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span><span>0</span>
                            </span>
                            <span class="label label-primary">8.4</span>
                        </p>
                    </div>
                </div>
            </div>
                        <div class="col-sm-6 col-md-3">
                <div class="thumbnail book-card" style="padding-top: 12px; padding-bottom: 24px;">
                    <a href="/book?account=&bookid=73547">
			                        <img alt="..." class="book-img lazy"  data-original="/images/books/37d0d3690a01bf1574361df1f0746b77.jpg" src="https://lorefree.com/static/images/logo.png">
			                    </a>
                    <div class="caption book-content">
                        <a  href="/book?account=&bookid=73547" ><h4>概率导论（第2版·修订版）</h4></a>
                        <p>Dimitri P. Bertsekas</p>
                        <p>
                            <span>
                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span><span>0</span>
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span><span>245</span>
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span><span>0</span>
                            </span>
                            <span class="label label-primary">9.3</span>
                        </p>
                    </div>
                </div>
            </div>
                        <div class="col-sm-6 col-md-3">
                <div class="thumbnail book-card" style="padding-top: 12px; padding-bottom: 24px;">
                    <a href="/book?account=&bookid=73546">
			                        <img alt="..." class="book-img lazy"  data-original="/images/books/f5bad6e8bb253c1943249921fc72ef8d.jpg" src="https://lorefree.com/static/images/logo.png">
			                    </a>
                    <div class="caption book-content">
                        <a  href="/book?account=&bookid=73546" ><h4>逍遥游</h4></a>
                        <p>班宇</p>
                        <p>
                            <span>
                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span><span>0</span>
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span><span>333</span>
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span><span>0</span>
                            </span>
                            <span class="label label-primary">8.1</span>
                        </p>
                    </div>
                </div>
            </div>
                    </div>
    </div>
</div>
<input type="hidden" value="1" ref="ipStatus" />
<div class="modal fade" id="ipStatusModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="max-width:400px;margin:0 auto">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">
                    安全提示
                </h5>
            </div>
            <div class="modal-body" style="line-height:25px">
                <div>
                    <p>LoreFree是去中心化平台，不接触用户账号私钥；</p>

                    <p>需要您通过第三方钱包的授权，才能进行交易；</p>

                    <p>授权是为了获取您的EOS账户名，并验证账户的所有权；</p>

                    <p>第三方钱包不会将私钥传给LoreFree，请您放心授权。</p>
                </div>
                <div>
                    <div style="width:140px;margin:0 auto">
                        <input type=checkbox id="checkStatus"/> <label style="font-weight: normal " for="checkStatus">不再提示</label><br />
                        <button style="width:140px;" class="btn btn-primary" @click="updateIPStatus">我已了解</button>
                    </div>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<ul class="pagination"><li class="prev"><a href="/?p=1" data-page="0">&laquo;</a></li>
<li><a href="/?p=1" data-page="0">1</a></li>
<li class="active"><a href="/?p=2" data-page="1">2</a></li>
<li><a href="/?p=3" data-page="2">3</a></li>
<li><a href="/?p=4" data-page="3">4</a></li>
<li><a href="/?p=5" data-page="4">5</a></li>
<li><a href="/?p=6" data-page="5">6</a></li>
<li><a href="/?p=7" data-page="6">7</a></li>
<li><a href="/?p=8" data-page="7">8</a></li>
<li><a href="/?p=9" data-page="8">9</a></li>
<li><a href="/?p=10" data-page="9">10</a></li>
<li class="next"><a href="/?p=3" data-page="2">&raquo;</a></li></ul><script>
// 回车搜索
document.onkeydown = function (e) {
    var theEvent = window.event || e; 
    var code = theEvent.keyCode || theEvent.which; 
    if (code == 13) { 
        var s = $('input[name="s"]').val();
        window.location.href =  '/site/index?s='+s;
    } 
};
</script>

    </div>
</div>
<div class="modal fade" id="titleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h5 class="modal-title" id="myModalLabel">
                    提示
                </h5>
            </div>
            <div class="modal-body">
                
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="loading" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop='static' >
    <div class="modal-dialog" role="document" style="width: 100px;">
        <div class="loading">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
</div>
<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; LoreFree 2020 </p>

        <p class="pull-right"></p>
        <p class="pull-left">&nbsp;&nbsp;&nbsp;&nbsp;本站所有资源来源于用户自发分享，若侵犯到版权方，请发邮件至lorefree@pm.me，并附书面权利通知，我们核实后移除处理。</p>
    </div>
</footer>

<script src="/assets/d1ed0440/jquery.js"></script>
<script src="/assets/a1e3c14d/yii.js"></script>
<script src="/assets/98969d24/js/bootstrap.js"></script><script src="https://cdn.bootcss.com/jquery.form/4.2.2/jquery.form.js"></script>
<script src="/js/scatterjs-core2.min.js"></script>
<script src="/js/scatterjs-plugin-eosjs2.min.js"></script> 
<script src="/js/eos.min.js"></script>


    <!--<script src="https://cdn.scattercdn.com/file/scatter-cdn/js/latest/scatterjs-core.min.js"></script>
    <script src="https://cdn.scattercdn.com/file/scatter-cdn/js/latest/scatterjs-plugin-eosjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/eosjs@16.0.9/lib/eos.min.js"></script>-->

<script src="https://cdn.bootcss.com/vue/2.6.10/vue.min.js"></script>
<!--<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>-->
<script src="https://cdn.bootcss.com/axios/0.19.0-beta.1/axios.min.js"></script>
<script src="https://cdn.bootcss.com/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdn.bootcss.com/moment.js/2.24.0/locale/zh-cn.js"></script>
<script src="/js/main.js?date=0425"></script>
<script src="/js/config.js"></script>

<script src="https://cdn.bootcss.com/jquery_lazyload/1.9.7/jquery.lazyload.min.js"></script>

<script type="text/javascript" charset="utf-8">
    $(function() {
        $("img.lazy").lazyload({effect: "fadeIn"});
    });
</script>

<script>

console.log(networkConfig)
    var app = new Vue({
        el: '#app',
        data: {
            message: 'Hello Vue!',
            account: '',
            scatter: null,
            network: null,
            apiUrl: '',
            eos: null,
            bookId: '',
            fileId: '',
        },
        mounted: function () {
            this.network = networkConfig;
            this.apiUrl = config.apiUrl;
            $('#loading').modal('hide');
            this.connEos();
            this.alertIPStatus();
        },
        methods: {
            alertIPStatus(){
                if(this.$refs.ipStatus.value == 0){
                    $('#ipStatusModal').modal('show');
                }
            },
            connEos(){
                ScatterJS.plugins( new ScatterEOS() );



                ScatterJS.scatter.connect('My-App').then(connected => {

                    if(!connected) return false;

                    const scatter = ScatterJS.scatter;
                    this.scatter = scatter;

                    const requiredFields = { accounts:[this.network] };
                    this.scatter.getIdentity(requiredFields).then(() => {

                        const account = this.scatter.identity.accounts.find(x => x.blockchain === 'eos');

                        const eosOptions = { expireInSeconds:60 };

                        const eos = this.scatter.eos(this.network, Eos, eosOptions);

                        var logintime = localStorage.logintime;
                        var nowtime = moment().format('YYYY-MM-DD');
                        if(logintime == nowtime){
                            this.account = account.name;
                        }

                        this.eos = eos;

                    }).catch(error => {
                            console.error(error);
                    });
                });
            },
            logoutWallet(){
                this.scatter.forgetIdentity();
                this.scatter.logout().then(res => {
                    this.account = "";
                    localStorage.logintime = "";
                    localStorage.account = "";
                })
            },
            login(){

		try {

                	$('#loading').modal('show');
                	const requiredFields = { accounts:[this.network] };
                	this.scatter.getIdentity(requiredFields).then(() => {

                	const account = this.scatter.identity.accounts.find(x => x.blockchain === 'eos');

                	const eosOptions = { expireInSeconds:60 };

                	const eos = this.scatter.eos(this.network, Eos, eosOptions);
//                        localStorage.account=account.name;
//                        console.log(localStorage);
			localStorage.account = account.name;
                        localStorage.logintime = moment().format('YYYY-MM-DD');
                        this.account = account.name;
                        this.eos = eos;
                        $('#loading').modal('hide');
                         
                        location.href="/site/index?back="+result.data.msg+'&account='+account.name;

                }).catch(error => {
                        console.error(error);
                });
	      } catch (e) {
                    $('.modal-body').text('请打开scatter并保持scatter处于运行中状态');
                    $('#titleModal').modal('show');
                    $('#loading').modal('hide');
              }
            },
            login2(){
		console.log('login2...');
                try {

                $('#loading').modal('show');
                const requiredFields = { accounts:[this.network] };

                this.scatter.getIdentity(requiredFields).then(() => {

//
                    const account = this.scatter.identity.accounts.find(x => x.blockchain === 'eos');
    //
                    const eosOptions = { expireInSeconds:60 };
    //
                    const eos = this.scatter.eos(this.network, Eos, eosOptions);
			console.log( account.name + '@' + account.authority);
                    eos.contract('lorefreecom2', this.network).then(ct =>{
			console.log('ct====',ct)
                        ct.login({
                            'user': account.name,
                            'date': '2020-08-02 10:15:45'
                        }, {
                            authorization: account.name + '@' + account.authority
                        }).then(trx => {

                                axios.post(this.apiUrl + '/api/login', {
                                    'trx_id': trx.transaction_id,
                                    'account': account.name
                                }).then(result => {
                                     if(result.data.code == 1){
                                        localStorage.account = account.name;
                                        localStorage.logintime = moment().format('YYYY-MM-DD');
                                        this.account = account.name;
                                        this.eos = eos;
                                        $('#loading').modal('hide');
                                
                                        location.href="/site/index?back="+result.data.msg+'&account='+account.name;

                                    }else{
                                        alert('登录失败请联系管理员');
                                        $('#loading').modal('hide');
                                    }
                                });

                        }).catch(error => {
			   console.log('hello1');
                            $('#loading').modal('hide');

                            console.error(error);
                        });
                    }).catch(function (error) {
			   console.log('hello2');
                            $('#loading').modal('hide');
                        console.error(error);

                    })

                }).catch(error => {
                    $('#loading').modal('hide');

			   console.log('hello3');
                    console.error(error);
                });
                } catch (e) {
                    $('.modal-body').text('请打开scatter并保持scatter处于运行中状态');
                    $('#titleModal').modal('show');
                    $('#loading').modal('hide');

                }
            },
            /**
             * 评论提交
             */
            commentBtn(fileid) {
                if(this.account == ''){
                    alert('请登录');
                    return ;
                }

                const requiredFields = { accounts:[this.network] };

                this.scatter.getIdentity(requiredFields).then(() => {

                    const account = this.scatter.identity.accounts.find(x => x.blockchain === 'eos');
                const eosOptions = { expireInSeconds:60 };
//
                const eos = this.scatter.eos(this.network, Eos, eosOptions);
                var data = $('#form'+fileid).serializeArray();


                var obj = [];
                for(var i = 0; i < data.length; i++){
                    obj[data[i]['name']] = data[i]['value'];
                }

                if(obj['report'] == undefined){
                    obj['report'] = 0;
                }
                obj['account'] = account.name;
                $('#loading').modal('show');
                eos.contract('lorefreecom2', this.network).then(ct =>{
                    ct.comment({
                        'user': account.name,
                        'date': '2020-08-02 10:15:45',
                        'file': obj['fileid'],
                        'detail': obj['comment'],
                        'report': obj['report'],
                    }, {
                        authorization: account.name + '@' + account.authority
                    }).then(trx => {

                        obj['trx_id'] = trx.transaction_id;

                        $.ajax({
                            type: 'POST',
                            data: {'account':obj['account'],'date':obj['date'],'fileid':obj['fileid'],'comment':obj['comment'],'report':obj['report'],'trx_id':obj['trx_id'],'bookid':obj['bookid']},
                            url: "/book/comment",
                            dataType:"json",
                            success: function(res){
                                if(res.status == 1){
                                    window.location.href = "#"+res.data;
                                    window.location.reload();
                                }else{
                                    alert(res.message);
                                }
                                console.log(rest);
                            }
                        });

                    }).catch(error => {
                        $('#loading').modal('hide');
                        console.error(error);
                    });
                }).catch(function (error) {
                    $('#loading').modal('hide');
                    console.error(error);
                })
            })
            },
            getFileName(o){
                var pos=o.lastIndexOf("\\");
                return o.substring(pos+1);  
            },
            /**
             * 上传图书
             */
            bookSubmit() {
//        setTimeout(fetch_progress,100);
                if(this.account == ''){
                    alert('请登录');
                    return ;
                }
                $('#loading').modal('show');

                nc = networkConfig;
                scatter = this.scatter;
                var file = $("#file").val();
                var dbid = $("#dbid").val();
                var fileName = this.getFileName(file);
                $.ajax({
                    type: 'POST',
                    data:{
                        'account':this.account,
                        'fileName': fileName,
                        'dbid': dbid,                        
                    },
                    url: "/user/upload?account="+this.account,
                    dataType:"json",
                    success: function(res){

                        if(res.status == 1){                        


                            $('#booksubmit').ajaxSubmit({
                                type:'post',
                                dataType:'json',
                                contentType: "application/json; charset=utf-8",
                                beforeSubmit:function () {
                                },
                                xhr:function(){
                                    myXhr = $.ajaxSettings.xhr();
                                    if(myXhr.upload){
                                        myXhr.upload.addEventListener('progress',function(e){
                                            var loaded = e.loaded;
                                            var total = e.total;
                                            var percent = Math.floor(100*loaded/total);
                                            $('.progress').css('display' , 'block');
                                            $('.progress > .progress-bar').css('width' ,percent+"%" )
                                            $('.progress > .progress-bar').html(percent+"%" )
                                            $('.progress > .progress-bar').attr('aria-valuenow',percent )

                                        }, false);
                                    }
                                    return myXhr;
                                },

                                success:function(result){

                                    if(result.code <= 0){
                                        alert(result.message);
                                        $('#loading').modal('hide');

                                        return;
                                    }

                                    ScatterJS.plugins( new ScatterEOS() );

                                    const account = scatter.identity.accounts.find(x => x.blockchain === 'eos');
                                    const eosOptions = { expireInSeconds:60 };
                                    const eos = scatter.eos(nc, Eos, eosOptions);
                                    eos.contract('lorefreecom2', nc).then(ct =>{
                                        ct.upload({
                                            'user': account.name,
                                            'file': result.data.file,
                                            'date': '2020-08-02 10:15:45'
                                        }, {
                                            authorization: account.name + '@' + account.authority
                                        }).then(trx => {
                                        alert(result.message);
                                        $('.progress').css('display' , 'none');
                                        $('form')[0].reset();
                                        $('#url').attr('value','');

                                        var bookid = $("#bookid").val();
                                        if(bookid > 0){
                                            window.location.href = "/book?bookid="+bookid;
                                        }
                                        $('#loading').modal('hide');

                                        }).catch(error => {
                                                $('#loading').modal('hide');
                                                alert(error);
                                            console.error(error);
                                        });
                                    });

                                },
                                error:function(){

                                }
                            });
                        }else{
                            alert(res.msg);
                            $('#loading').modal('hide');
                            return;
                        }
                    }
                });
            },
            userhome(){
                location.href = "/user/index?account="+this.account;
            },
            viphome(){
                location.href = "/user/vip?account="+this.account;
            },
            mortgage() {
                if(this.account == ''){
                    alert('请登录');
                    return ;
                }

                const requiredFields = { accounts:[this.network] };
                console.log(requiredFields)
                this.scatter.getIdentity(requiredFields).then(() => {
                    const account = this.scatter.identity.accounts.find(x => x.blockchain === 'eos');
                    const eosOptions = { expireInSeconds:60 };
                    const eos = this.scatter.eos(this.network, Eos, eosOptions);


                    $('#loading').modal('show');


                    var mortgageValue = $("#mortgageTxt").val();
                    var num = new Number(mortgageValue);

                    mortgageValue = num.toFixed(4);
                    if(mortgageValue <= 0){
                        alert('输入数量有误');
                        $('#loading').modal('hide');
                        return;
                    }

//                eos.transfer(account.name, 'lorefreecom1', mortgageValue + " LFEE", 'LEFF抵押', {

                   eos.transaction({
                           actions: [
                               {
                                   account: 'lorefreelfee',
                                   name: 'transfer',
                                   authorization: [{
                                       actor: account.name,
                                       permission: account.authority,
                                   }],
                                   data: {
                                       from: account.name,
                                       to: 'lorefreelock',
                                       quantity: mortgageValue + " LFEE",
                                       memo: "LFEE抵押",
                                   }
                               }
                           ]
                       }
                   ).then(trx => {
                        //trx.transaction_id
                       axios.post(this.apiUrl + '/api/mortgage', {
                                   'trx_id': trx.transaction_id,
                                   'account': account.name
                               }).then(result => {

                                    if(result.data.code == 1){
                                        alert('抵押成功');
                                        location.reload();
                                    }else{
                                        alert('抵押失败请联系管理员');
                                        $('#loading').modal('hide');
                                    }
                            });
                    }).catch(function (error) {
                        $('#loading').modal('hide');
                        console.error(error);
                    })
                })
            },
            redeem(){
                if(this.account == ''){
                    alert('请登录');
                    return ;
                }

                var redeemTxt = $('#redeemTxt').val();

                $.ajax({
                    type: 'POST',
                    data: {
                        'coin': redeemTxt,
                        'account': this.account
                    },
                    url: "/user/redeem?account="+this.account,
                    dataType:"json",
                    success: function(res){
                        if(res.status == 1){
                            alert(res.msg);
                            window.location.href = "#"+res.data;
                            window.location.reload();
                        }else{
                            alert(res.msg);
                        }
                    }
                });

            },

            downloadCaptche(bookId,fileId){
                this.bookId = bookId
                this.fileId = fileId
                $('#captchaModal').modal('show');
            },

            download(){
                var captchCode = $('#captchCode').val()
                var bookId = this.bookId
                var fileId = this.fileId
                if(bookId == '' || fileId == ''){
                    alert('下载ID错误')
                    return;
                }

                if(this.account == ''){
                    var str = '/book/down?bookid='+bookId+'&fileid='+fileId+'&captchCode='+captchCode;
                    window.open(str);
                    location.reload()
                }else{
                    // var account = this.account
                    // $.ajax({
                    //     type: 'POST',
                    //     data:{
                    //         'account':account
                    //     },
                    //     url: "/user/download?account="+account,
                    //     dataType:"json",
                    //     success: function(res){
                    //         if(res.status == 1){
                    var str = '/book/down?bookid='+bookId+'&captchCode='+captchCode+'&fileid='+fileId+'&account='+this.account;
                    window.open(str);
                    location.reload()
                    //         }else{
                    //             alert(res.msg);
                    //             location.reload()
                    //         }
                    //     }
                    // });
                }
            },
                    // try {
                    // $('#loading').modal('show');
                    // const requiredFields = { accounts:[this.network] };
                    // this.scatter.getIdentity(requiredFields).then(() => {
                    //     const account = this.scatter.identity.accounts.find(x => x.blockchain === 'eos');
                    //     const eosOptions = { expireInSeconds:60 };
                    //     const eos = this.scatter.eos(this.network, Eos, eosOptions);
                    //     eos.contract('lorefreecom2', this.network).then(ct =>{
                    //         ct.download({
                    //             'user': account.name,
                    //             'date': '2020-08-02 10:15:45',
                    //             'file': fileId
                    //         }, {
                    //             authorization: account.name + '@' + account.authority
                    //         }).then(trx => {
                    //                 axios.post(this.apiUrl + '/api/login', {
                    //                     'trx_id': trx.transaction_id,
                    //                     'account': account.name
                    //                 }).then(result => {
                    //                      if(result.data.code == 1){
                    //                         $('#loading').modal('hide');
                    //                         $.ajax({
                    //                             type: 'POST',
                    //                             data:{
                    //                                 'account':account.name
                    //                             },
                    //                             url: "/user/download?account="+account.name,
                    //                             dataType:"json",
                    //                             success: function(res){
                    //                                 if(res.status == 1){
                    //                                     var str = '/book/down?bookid='+bookId+'&captchCode='+captchCode+'&fileid='+fileId+'&account='+account.name;
                    //                                     window.open(str);
                    //                                     location.reload()
                    //                                 }else{
                    //                                     alert(res.msg);
                    //                                     location.reload()
                    //                                 }
                    //                             }
                    //                         });
                    //                     }else{
                    //                         alert('登录失败请联系管理员');
                    //                         $('#loading').modal('hide');
                    //                         location.reload()
                    //                     }
                    //                 });
                    //         }).catch(error => {
                    //             $('#loading').modal('hide');
                    //             alert('用户签名失败');
                    //             location.reload()
                    //         });
                    //     }).catch(function (error) {
                    //         $('#loading').modal('hide');
                    //         alert('调用合约失败');
                    //         location.reload()
                    //     })
                    // }).catch(error => {
                    //     $('#loading').modal('hide');
                    //     alert('启动钱包失败');
                    //     location.reload()
                    // });
                    // } catch (e) {
                    //     //$('.modal-body').text('请打开scatter并保持scatter处于运行中状态');
                    //     // $('#titleModal').modal('show');
                    //     // $('#loading').modal('hide');
                    //     alert('请打开scatter并保持scatter处于运行中状态');
                    //     location.reload()
                    // }
                    //     }
                    // },
            updateIPStatus(){
                var status = 0;
                if($('#checkStatus').is(':checked')) {
                    status = 1;
                }
                $.ajax({
                    type: 'POST',
                    url: "/site/updatestatus",
                    dataType:"json",
                    data: {
                        'status':status
                    },
                    success: function(res){
                        if(res.status == 1){
                            //window.location.reload();
                            $('#ipStatusModal').modal('hide');
                            return;
                        }else{
                            //$('#ipStatusModal').modal('hide');
                            alert(res.msg);
                            return;
                        }
                    }
                })
            },
            userCollection(status, bookid){
                if(this.account == ''){
                    alert('请登录');
                    return ;
                }
                if(bookid == ''){
                    alert('书籍ID错误');
                    return ;
                }
                if(status == ''){
                    alert('状态异常');
                    return ;
                }
                $.ajax({
                    type: 'POST',
                    url: "/book/usercollection",
                    dataType:"json",
                    data: {
                        'account': this.account,
                        'bookid': bookid,
                        'status': status,
                    },
                    success: function(res){
                        if(res.status == 1){
                            var collection_count = parseInt($('.collection_count').text());
                            if(status == 1){
                                $('.collection_status1').css('display','block');
                                $('.collection_status2').css('display','none');
                                $('.collection_count').text(collection_count - 1);
                            }else{
                                $('.collection_status1').css('display','none');
                                $('.collection_status2').css('display','block');
                                $('.collection_count').text(collection_count + 1);
                            }
                            // window.location.reload();
                            // return;
                        }else{
                            alert(res.msg);
                            return;
                        }
                    }
                })
            },
            userCollectionList(){
                location.href = "/site/usercollectionlist"
            }
        }
    })

</script>
<div style="display:none"><script type="text/javascript" src="https://s5.cnzz.com/z_stat.php?id=1277142538&web_id=1277142538"></script></div>
</body>
</html>

