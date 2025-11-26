# test-service

---

## Инструкция по запуску

1. Склонировать репо
2. Изменить путь в `test_stuk.service`
```bash
ExecStart=/*path*/test_stuk.sh
```
3. Сделать скрипт исполняемым
```bash
chmod +x test_stuk.sh
```
3. Поместить сервис и таймер в `/etc/systemd/system/` (путь отличается в зависимости от дистрибутива)
4. Запустить
```bash
systemctl daemon-reload
systemctl enable --now test_stuk.timer
```

## Проверка

```bash
systemctl status test_stuk.timer
journalctl -u test_stuk.service
```
