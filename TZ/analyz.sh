#!/bin/bash
### Парсер для лог файла.

awk -F " " '{ print $1 }' logs/access.log | sort| uniq > logs/uniqIP.txt
