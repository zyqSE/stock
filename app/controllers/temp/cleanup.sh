#!/bin/sh
#获取昨天日期 yyyy-MM-dd 格式
source /etc/profile
yesterday=`date --date='1 days ago' +%Y-%m-%d`
log_path="/root/Stock/stock/log/cleanup.log"

echo ${yesterday}": cleanup executing..." >> $log_path
#删除昨天的json文件
rm -f *${yesterday}.json
if [ $? -ne 0 ]; then
    echo ${yesterday}": clean up json failed." >> $log_path
else
    echo ${yesterday}": clean up json success." >> $log_path
fi
#删除昨天的csv文件
rm -f *${yesterday}.csv
if [ $? -ne 0 ]; then
    echo ${yesterday}": clean up csv failed." >> $log_path
else
    echo ${yesterday}": clean up csv success." >> $log_path
fi

