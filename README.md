# flutter-router

android 以activity

ios 以UIViewController 为基础跳转


1. flutter_router_demo  依赖本地tj_flutter_router_plugin 插件，暂时没放到远程


2. FluttterRouterDemo_iOS 运行
(1)需要先使用进入flutter_router_demo 文件夹，运行 flutter run 命令
(2)进入 FluttterRouterDemo_iOS 文件夹，运行pod install 或者 pod update
(3)如果需要模块化，即团队其他人不需要安装flutter也能运行，需要把  ../flutter_router_demo/.ios/Flutter 文件夹下的主要文件拷贝到工程中，最好编写脚本自动化完成

3.  FluttterRouterDemo_android 运行

(1)需要先使用进入flutter_router_demo 文件夹，运行 flutter run 命令