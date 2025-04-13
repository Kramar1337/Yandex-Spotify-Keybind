# Yandex-Spotify-Keybind 🎵⌨️

Описание писал Дипсик. Чтобы с кайфом слушать треки в Яндексе и Спотифае, вместе с Дипсиком слепил расширение которое перехватывает кнопки в браузере(плей-пауза, некст, пред), конфиг с фильтрами для Юблока чистит рекламу, АХК скрипт переназначает кнопки в винде

Расширение для горячих клавиш в Яндекс.Музыке (новый дизайн) и Spotify + фильтры AdBlock + AHK-скрипт

## 🔥 Возможности
- **Горячие клавиши** для управления плеерами
- **Фильтры AdBlock** для чистого прослушивания
- **Автопереключение** между сервисами
- **Кастомизация** кнопок под себя

## ⚙️ Установка

### Браузерное расширение

Скачать репозиторий (Code > [Download Zip👌](https://github.com/Kramar1337/Yandex-Spotify-Keybind/archive/main.zip))
1. Откройте `chrome://extensions/`
2. Включите "Режим разработчика"
3. Нажмите "Загрузить распакованное" и выберите папку `EXT-music-keys-last`
4. Сделать все клавиши глобальными в настройках расширения

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
