# 部署说明

## GitHub Secrets 配置

在 GitHub 仓库中配置以下 Secrets（Settings -> Secrets and variables -> Actions -> New repository secret）：

| Secret 名称         | 说明           | 示例              |
| ------------------- | -------------- | ----------------- |
| `SERVER_HOST`     | 服务器 IP 地址 | `192.168.1.100` |
| `SERVER_USERNAME` | SSH 登录用户名 | `root`          |
| `SERVER_PASSWORD` | SSH 登录密码   | `your_password` |
|                     |                |                   |

## 服务器准备

在部署前，请确保目标服务器已安装：

1. **Docker**

   ```bash
   curl -fsSL https://get.docker.com | sh
   ```
2. **Docker Compose**

   ```bash
   apt-get update
   apt-get install docker-compose-plugin
   ```
3. **Git**

   ```bash
   apt-get install git
   ```
4. **创建 Traefik 网络**（如果还没有）

   ```bash
   docker network create traefik-network
   ```
5. **创建应用目录**

   ```bash
   mkdir -p /root/apps
   ```

## 自动部署

当代码推送到 `main` 分支时，GitHub Actions 会自动：

1. SSH 连接到目标服务器
2. 拉取最新代码到 `/root/apps/sndra-link`
3. 使用 Docker Compose 构建并启动服务
4. 清理旧的 Docker 镜像

也可以在 GitHub Actions 页面手动触发部署。

## 手动部署

如需手动部署，在服务器上执行：

```bash
cd /root/apps/sndra-link
git pull origin main
docker compose down
docker compose up -d --build
```

## 查看服务状态

```bash
cd /root/apps/sndra-link
docker compose ps
docker compose logs -f
```

## 环境变量

在 [docker-compose.yml](docker-compose.yml) 中配置环境变量：

- `DATABASE_URL`: SQLite 数据库路径
- `DOMAIN`: 服务域名

## 注意事项

1. 数据持久化：数据库文件存储在 `./data` 目录中，会自动挂载到容器
2. Traefik 路由：确保 Traefik 反向代理已正确配置
3. 首次部署时需要在服务器上配置 Git 访问权限（SSH key 或 token）
