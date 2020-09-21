## 一、项目简介

- 此脚本为Termux或Ubuntu安装之后的初始化脚本   
- 本项目仅为自用，出问题改不负责   
- 项目地址：https://github.com/rentianyu/install   
 
- **如果是要在Termux上运行请注意以下几点**   
(1) 至少授予Termux储存权限（最好是权限全给）   
(2) 如果链接termux类命令到系统请保证termux具有root权限并授予Termux API软件所有权限和自启动权限   
(3) 安卓9自用，其他自测   

## 二、配置安装命令

### 手动模式

```bash
apt update -y && apt install -y wget && bash <(wget -qO- 'https://raw.githubusercontent.com/rentianyu/install/master/start.sh')
```

### 静默模式

```bash
apt update -y && apt install -y wget && bash <(wget -qO- 'https://raw.githubusercontent.com/rentianyu/install/master/start.sh') 参数

# 参数如下
    1. 为 Termux 初始化
    2. 为 Ubuntu 初始化
    3. 为 vps 安装DD系统

```

## 2. Termux有关软件下载地址

- Termux: https://f-droid.org/packages/com.termux
- Termux-API: https://f-droid.org/packages/com.termux.api
