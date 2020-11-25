# PHP用開発環境
## 使い方
```
git clone https://github.com/seiyu-nico/laravel8_dev.git
cd laravel8_dev
make init
```

- make initで余計なファイルの削除 && イメージビルト && 起動までを行う
  - 下記動作を行っている感じ

```
rm -rf 各種.gitkeep
docker-compose build 
docker-compose up -d 
```

- 必要がなければsampleは削除しても問題ないです

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
