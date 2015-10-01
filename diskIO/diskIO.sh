#!/bin/bash

ev="/path/to/folder"

function file_1k {
	sayi=$1
	sayi=$(($sayi-1))
	dd if=/dev/zero of=${ev}/diskIO/5MB/1k_${sayi}.file bs=1024 count=1 oflag=direct 2> /dev/null
	if [ "$sayi" -ne 0 ]; then
		file_1k $sayi
	fi
}

mkdir -p ${ev}/diskIO/5MB

echo "1G tek atiyorum"
time dd if=/dev/zero of=${ev}/diskIO/1G.file bs=1G count=1 oflag=direct 2> /dev/null

echo "her biri 1kB'tan 1MB'lik dosya gonderiyorum"
time file_1k $((1*1024)) 2> /dev/null

echo "tek 1MB dosya yaptik"
time dd if=/dev/zero of=${ev}/diskIO/1M.file bs=1M count=1 oflag=direct 2> /dev/null
echo "-----------------------------------------------"

echo "1G tek dosyanin kopyasini aliyorum"
time cp ${ev}/diskIO/1G.file ${ev}/diskIO/1G.copy
echo "1M tek dosyanin kopyasini aliyorum"
time cp ${ev}/diskIO/1M.file ${ev}/diskIO/1M.copy
echo "1024 ogeli 1 MB dizini kopyaliyoruz"
time cp -ar ${ev}/diskIO/5MB ${ev}/diskIO/5MB_copy

rm -r ${ev}/diskIO
