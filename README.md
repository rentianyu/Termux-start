## 一、项目简介


+ 此脚本为Termux或Ubuntu安装之后的初始化脚本
+ 本项目仅为自用，出问题改不负责
+ 项目地址：https://github.com/rentianyu/install
+ 去广告hosts项目地址：https://github.com/rentianyu/Ad-set-hosts
 
- **如果是要在Termux上运行请注意以下几点**
    - 至少授予Termux储存权限(最好是权限全给)
    - 如果链接termux类命令到系统请保证termux具有root权限、授予Termux API软件所有权限和自启动权限
    - 安卓9、10 自用，其他自测
    - 链接到系统指的是链接到 /system/bin/ 目录下

- 目前实现功能如下
1. 为 Termux 初始化
2. 为 Ubuntu 初始化
3. 为 vps 安装DD系统
4. 只链接已安装的termux开头命令进系统
5. 链接已安装的所有termux命令进系统
6. 删除链接到系统的termux命令
7. 使用小贝塔去广告hosts
8. 解除小米软件机型限制

## 二、使用方法

```bash
apt update -y && apt install -y wget && bash <(wget -qO- 'https://raw.githubusercontent.com/rentianyu/install/master/start.sh')
```

## 三、Termux有关软件下载地址

- Termux: https://f-droid.org/packages/com.termux
- Termux-API: https://f-droid.org/packages/com.termux.api
