# 党建服务中心

## 1. 项目概述

党建管理系统是基于 FastAdmin 框架开发的党建信息管理平台，提供党员管理、组织活动、学习资源等功能。

- **技术栈**：FastAdmin + ThinkPHP + Bootstrap + MySQL
- **版本信息**：FastAdmin 1.6.1
- **开发框架**：基于 ThinkPHP 5.1，集成 Bootstrap 前端框架

## 2. 系统要求

### 2.1 服务器环境要求

- 操作系统：Linux、Windows、Mac OS
- Web 服务器：Apache、Nginx
- PHP 版本：PHP 7.4+ （推荐 PHP 7.4）
- MySQL 版本：>= 5.6 且 <= 8.0 (需支持 innodb 引擎)

### 2.2 开发环境要求

- Node.js >= 12.0.0
- npm 或 yarn
- Composer

## 3. 安装步骤

### 3.1 获取项目代码

```bash
# 克隆代码仓库
git clone [仓库地址]
cd party-building

# 或下载源码包并解压
```

### 3.2 安装依赖

```bash
# 安装PHP依赖
composer install

# 安装前端依赖
npm install
```

### 3.3 前端资源构建

```bash
# 使用Grunt构建
grunt build

# 或使用npm脚本
npm run build
```

构建完成后，前端资源将被压缩和优化，生成到 public/assets 目录。

## 4. 配置说明

### 4.1 PHP 扩展

确保以下 PHP 扩展已安装并启用：

- 内存限制：>= 256M
- 执行时间限制：>= 60s
- 文件上传大小：>= 50M
- 必需开启的 PHP 扩展：json, curl, pdo, bcmath, gd, mbstring, openssl, fileinfo

**查看当前 PHP 扩展命令：**

```bash
# 查看所有已安装的PHP扩展
php -m

# 查看PHP配置信息
php -i

# 查看特定扩展是否已安装（以curl为例）
# Linux/Mac系统：
php -m | grep curl

# Windows系统：
php -m | findstr curl

# 查看PHP版本
php -v
```

### 4.2 MySQL 配置

- 创建数据库

```sql
-- 登录MySQL
mysql -u root -p

-- 创建数据库
CREATE DATABASE party_building DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

也可使用 phpMyAdmin、Navicat、MySQL Workbench 等图形界面工具创建数据库。

- 导入数据库结构

```bash
# 导入数据库结构文件
mysql -u root -p party_building < party_building.sql
```

也可使用图形界面工具导入 `party_building.sql` 文件。

### 4.3 应用配置

1. 复制环境变量示例文件：

将 `.env.sample` 复制一份，然后重命名为 `.env`。

2. 编辑 `.env` 文件，配置数据库连接参数：

```ini
[app]
debug = true
trace = true

[database]
hostname = 127.0.0.1
database = party_building
username = party_user
password = your_password
hostport = 3306
prefix = party_
```

### 4.4 Web 服务器配置

- **根目录配置**：将 Web 服务器的根目录配置到 `party-building/public` 目录
- **Apache**：确保 mod_rewrite 模块已启用，配置.htaccess 文件
- **Nginx**：配置 URL 重写规则，支持 PATHINFO 模式
- **URL 重写规则**：支持伪静态访问，默认后缀为.html

**访问地址：**

- 前台访问：`http://your-host.com`
- 后台访问：`http://your-host.com/admin.php`

**默认管理员账户：**

- 用户名：`admin`
- 密码：`@admin`

## 快速开始

1. 确保环境满足要求
2. 克隆项目代码
3. 安装依赖：`composer install && npm install`
4. 构建前端资源：`grunt build` 或 `npm run build`
5. 配置数据库连接
6. 访问项目地址进行初始化
