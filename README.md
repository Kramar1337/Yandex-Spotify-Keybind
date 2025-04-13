# Yandex-Spotify-Keybind 🎵⌨️

Расширение для горячих клавиш в Яндекс.Музыке (новый дизайн) и Spotify + фильтры AdBlock + AHK-скрипт

## 🔥 Возможности
- **Горячие клавиши** для управления плеерами
- **Фильтры AdBlock** для чистого прослушивания
- **Автопереключение** между сервисами
- **Кастомизация** кнопок под себя

## ⚙️ Установка

### Браузерное расширение
```bash
git clone https://github.com/Kramar1337/Yandex-Spotify-Keybind.git
```
1. Откройте `chrome://extensions/`
2. Включите "Режим разработчика"
3. Нажмите "Загрузить распакованное" и выберите папку `/extension`

### Фильтры AdBlock
Добавьте в свой блокировщик содержимое файла `Adblock filters.txt`

### AutoHotkey скрипт
1. Установите [Autohotkey.com](https://www.autohotkey.com/download/ahk-install.exe)(прямая ссылка)
2. Запустите `Play.ahk`
3. Настройки в самом файле

```
;Режим по умолчанию 1 - Media_Play, 2 - GUI
PlayMode = 1

;Play - Pause
key_PlayPause = XButton2

;Одиночный клик - Next, двойной клик - Prev
key_Next = XButton1
```

## Disclaimer 
This project is intended solely for educational purposes. 

## License

This project is licensed under the MIT License. For more information, see the [LICENSE] file.
