
>Libaroma是一个用纯C写的控件库，支持Linux、X86、QNX等不同平台。针对不同平台API做了一层封装，可以很快的移植到不同平台，参照Android的材料设计风格实现控件库，已经写好了Fragment、ViewPager、Button、ProgressBar、ListView、Dialog等控件，开发者可以实现自己的控件。目前Libaroma框架只绝对布局，控件的开发基本和Android类似，也有Window，WindowManagr、EventHub等概念，支持Window转场动画。

现在可以运行在Linux平台使用SDL实现HAL层,也同样可以运行Android 上,在MTK平台上由于TP上报的协议不同导致触屏不能使用,不过本人粗略调整,已经可以使用了,同样本人也添加FreeRTOS的支持,现实了MT2523 HAL层的对接,现在TP和屏幕都可以工作,整个GUI框架主体部分已经全部工作,libaroma 已经验证过了,可以在主频208M ,RAM 4M  ROM 4M 屏幕360x360, 和 主频48M RAM256K 屏幕160x64 ROM 1M

#### works:
  1. FreeType work on MT2523,支持从ROM中加载ttf 字体和文件系统加载ttf字体，支持emoji表情。
  2. png decode Support。
  3. 大部分内置控件都在2523 上面可以使用。
  4. window 专场动画支持,支持平移,覆盖等多种形式的动画。
  5. 文字排版支持居中方式和CSS标签，加粗，下划线等效果。
  6. 支持565的屏幕和888的屏幕。
  7. 支持内存监控，可以检测出来内存泄漏，泄漏位置。
  8. 转场特效。
  
#### 内置控件列表

  1. label 文本框。
  2. image 图片框,支持帧动画。
  3. progress 进度条,长方形和圆形进度条,loading。
  4. viewpager。
  5. listview 列表。
  6. fragment。
  7. scroller。
  8. qrcode 二维码。
  9. button。
  
#### Features 

  1. Lua脚本引擎支持，可以通过脚本自定义绘制流程。
  2. svg png jpeg decode。
  3. Freetype字体引擎，支持emoji字体，混合排版，加粗，下划线，居中方式。
  4. 基本的绘制能力，方块、原形、椭圆、点、折线、直线、贴图。
  5. 模拟器支持，底层通多SDL实现。

 
  
#### build

只是支持GCC编译,keil下编译请自行参考makefile添加文件

    cd project/mt2523_hdk/apps/gdi_display_helloworld/GCC
    make


#### 截图

![](https://github.com/Ever-Never/Embedded-GUI-for-MT2523/blob/master/pics/2018-10-11%2013-08-45.png)
![](https://github.com/Ever-Never/Embedded-GUI-for-MT2523/blob/master/pics/2018-10-11%2013-11-44.png)
![](https://github.com/Ever-Never/Embedded-GUI-for-MT2523/blob/master/pics/2018-10-11%2013-11-28.png)
![](https://github.com/Ever-Never/Embedded-GUI-for-MT2523/blob/master/pics/2018-10-11%2013-09-59.png)
![](https://github.com/Ever-Never/Embedded-GUI-for-MT2523/blob/master/pics/2018-10-11%2013-10-47.png)



  SDK:https://labs.mediatek.com/zh-cn/download/Cobne0ON

  libaroma: https://github.com/amarullz/libaroma
  
  libaroma GUI 分析请参考本人博客:http://ever-never.github.io/2016/08/28/Libaroma-GUI/
