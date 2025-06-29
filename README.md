# DisplaySettingAutomation
macOSのlaunchdという仕組みを利用して、USB portへの接続を検知して、「システム環境」のディスプレイ設定画面を自動で開く  
![outline.png](https://github.com/user-attachments/assets/2a6a33eb-a1f4-4398-af7f-07f49f983900)

## Environment
macOS Sequoia 15.1

## Init
本ディレクトリをダウンロードした後、以下を実行し環境構築を行う  
```:zsh
# USB portへの接続を検知するスクリプトを配置
$ sudo cp detect_connection.sh /usr/local/bin/

# ユーザーのLaunchAgentsディレクトリにコピー
cp com.user.notify_display.plist ~/Library/LaunchAgents/

# サービスを登録・開始
launchctl load ~/Library/LaunchAgents/com.user.notify_display.plist

# サービスの停止（必要な場合）
launchctl unload ~/Library/LaunchAgents/com.user.notify_display.plist
```

## other

```
# plistファイルの文法が正しいことを確認する
$ plutil -lint your_file.plist
```
