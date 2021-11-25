# PHP用開発環境
## 使い方
- ~/.bashrcに下記設定を記述します
  - dockerコンテナ内での名前解決に使います。
```bashrc:~/.bashrc
export HOST_IP=$(hostname -I | awk '{print $1}')
```
- make initで余計なファイルの削除 && イメージビルト && 起動までを行う
  - 下記動作を行っている感じ

```
rm -rf 各種.gitkeep
docker-compose build 
docker-compose up -d 
```

## 設定の変更
### vhostsの追加
- ./conf/nginx/vhostsに設定ファイルを配置後再起動

### URL
- ./docker-compose.yml
  - https-portal -> environment -> DOMAINSをserver_nameに合わせて修正
 
## SSLについて
- 開発環境でもSSL化しないといけないときがあるので基本はSSL化してある
  - mixed contentでリソースがブロックされる
  - FacebookのOAuthで設定するredirect URIはhttpsでないと動かない
  - Geolocation APIで位置情報を取得する時にhttpsでないと動かない

- Chromeで警告を無視する
  - Enabledにすると localhost に限り自己署名証明書であっても警告が出なくなる。
```
chrome://flags/#allow-insecure-localhost
```

## PHPコンテナでのxdegub
- .bashrcのデバッグするホストのIPアドレスをexportする処理を書く
```.bashrc
# wsl2でdockerを使いwindowsからデバッグする場合
# 環境変数にwslから見たwindowsのIPを登録
export XDEGUB_CLIENT_HOST=`ip route | grep 'default via' | grep -Eo '[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}'`
```
