# 概要
本リポジトリでは、[Exment](https://exment.net/) と [Mattermost](https://mattermost.com/) を docker 環境でお試しするための環境を提供します。

システム構成は下図の通りです。

![image](https://user-images.githubusercontent.com/164193/196333699-390cf3ad-a86b-4229-8a0c-a4259bd40ee5.png)


# インストール手順

本リポジトリ―をクローンします。

```
git clone --recursive https://github.com/tmori/docker-exment-mattermost.git
```

docker compose をビルドします。

```
cd docker-exment-mattermost
```

```
docker-compose build
```

成功すると、以下の通りのイメージが作成されます。

```
$ docker-compose images
              Container                             Repository                 Tag       Image Id       Size
--------------------------------------------------------------------------------------------------------------
docker-exment-mattermost_exment_php_1   docker-exment-mattermost_exment_php   latest   6decf3079e07   868.1 MB
docker-exment-mattermost_mariadb_1      mariadb                               10.4     c86cca950f78   403.9 MB
docker-exment-mattermost_mattermost_1   docker-exment-mattermost_mattermost   latest   fe7ad5a0eea7   1.446 GB
docker-exment-mattermost_postgres_1     docker-exment-mattermost_postgres     latest   657e8da5bf0c   601.7 MB
docker-exment-mattermost_web_1          nginx                                 latest   51086ed63d8c   141.7 MB
```


