# dd-wrt-auto-login-CHT-Wi-Fi
# dd-wrt 自動連到 CHT Wi-Fi(HiNet)的教學與script


# 使用說明
## 圖文教學 http://www.jikker.net/2017/07/dd-wrt-cht-wi-fi.html
## 將程式放入/opt/script
## 修改 login-cht-wifi.sh 裡面的帳號密碼
## 新增 /opt/log/資料夾
## 新增 cht-wifi.log, cron.log 兩個檔案
## 確定 /opt/usr/bin/curl 有curl程式
## 執行指令 sh /opt/script/start.sh >> /opt/log/cron.log
## 程式每分鐘會執行登入指令一次 5次內沒登入成功 機器會自動重開
## 不想重開的話把 start.sh 換成 start_not_reboot.sh


## 參考資料 
### http://skyboxs.net/2012/06/1343/
### https://gist.github.com/JustinTW/8a04eebe621afcf8098f
