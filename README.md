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

# アンインストール手順

以下のコマンドで作成した docker イメージおよびボリューム/ネットワークを削除します。

```
bash remove-all.bash
```

成功時のログはこうです。

```
Removing docker-exment-mattermost_web_1        ... done
Removing docker-exment-mattermost_mattermost_1 ... done
Removing docker-exment-mattermost_mariadb_1    ... done
Removing docker-exment-mattermost_exment_php_1 ... done
Removing docker-exment-mattermost_postgres_1   ... done
Removing network docker-exment-mattermost_webserver-network
Removing volume docker-exment-mattermost_webserver-www-data
Removing volume docker-exment-mattermost_exment-mariadb-data
Removing volume docker-exment-mattermost_mattermost-postgres-data
Removing image docker-exment-mattermost_exment_php
Removing image nginx:latest
Removing image mariadb:10.4
Removing image docker-exment-mattermost_postgres
Removing image docker-exment-mattermost_mattermost
```

# 初期セットアップ手順

インストール終了後、以下のコマンドで docker 起動します。

```
docker-compose up
```

成功すると、以下のコマンドで docker コンテナ状態を確認できます。

```
docker-compose ps
                Name                               Command                       State                             Ports
-------------------------------------------------------------------------------------------------------------------------------------------
docker-exment-mattermost_exment_php_1   docker-php-entrypoint php-fpm    Up                      9000/tcp
docker-exment-mattermost_mariadb_1      docker-entrypoint.sh mysqld      Up                      0.0.0.0:3306->3306/tcp
docker-exment-mattermost_mattermost_1   /entrypoint.sh /opt/matter ...   Up (health: starting)   8000/tcp
docker-exment-mattermost_postgres_1     /entrypoint.sh postgres          Up (health: starting)   5432/tcp
docker-exment-mattermost_web_1          /docker-entrypoint.sh ngin ...   Up                      0.0.0.0:80->80/tcp, 0.0.0.0:8000->8000/tcp
```

## Mattermostのセットアップ
初期状態では、Mattermostにはユーザ登録されていません。
本リポジトリでは、お試しユーザとして　10 ユーザ、2 チーム、2 チャンネルをセットアップして、手軽にMattermostの操作感を試せるようにしています。

以下、セットアップ手順です。

```
docker-compose exec mattermost /bin/bash
```

```
bash mm-setup-data.bash
```

成功すると以下のように登録ログが出力されます。

```
INFO: add users on db:
Created user root
Created user user-10
Created user user-1
Created user user-2
Created user user-3
Created user user-4
Created user user-5
Created user user-6
Created user user-7
Created user user-8
Created user user-9
INFO: add team:
New team private-room successfully created
INFO: add users on team:
INFO: add channels on team:
New channel pchannel-01 successfully created
INFO: add users on pchannel-01:
INFO: OK
INFO: add team:
New team public-room successfully created
INFO: add users on team:
INFO: add channels on team:
New channel channel-01 successfully created
INFO: add users on channel-01:
INFO: OK
```

ブラウザで `localhost:8000` にアクセスすると、下図のようにログイン画面が出てきます。
任意のユーザID(user-1～10, root)で、ログインします。パスワードはすべて `Password-999` です。

![image](https://user-images.githubusercontent.com/164193/196335160-25767336-894a-4b84-a4ee-1357804a04f5.png)

ログイン成功すると、チャットスペースが現れます。

![image](https://user-images.githubusercontent.com/164193/196335296-a9fa6a59-7078-4d19-b0f1-4ebf8fd13aee.png)
