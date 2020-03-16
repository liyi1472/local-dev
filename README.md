# 本地开发环境快速搭建脚本

> 需要预装以下服务 ——
>
> - **Node.js + NPM**
>   - **browser-sync**
> - **Docker Desktop**



## 提供环境

- **Nginx**

  高性能 Web 服务器。

- **PHP-FPM**

  PHP 脚本解释环境。



## 使用方法

- 将项目目录放入 `~/Code` 目录。

- 将 `local-dev` 文件夹和 `local-dev.sh` 放到项目目录下，添加到 .gitignore 文件中。

- 使用编辑器全局替换 local-dev 和 local-dev.sh 中的 `__PROJECT__` 为项目目录名。

- 执行脚本。

  ```shell
  ./local-dev.sh
  ```

  

