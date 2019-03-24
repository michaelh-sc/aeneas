#!/bin/bash

nik="$1"
vag="$2"
sut="$3"
rm ./"$sut".po
wget https://raw.githubusercontent.com/suttacentral/sc-data/master/po_text/pli-en/"$nik"/"$vag"/"$sut".po
python -m aeneas.tools.execute_task "$sut"-en.flac "$sut".po "task_language=eng|os_task_file_format=ffmpeg|is_text_type=po|is_unicode=true" map.sh
chmod +x ./map.sh
cat map.sh
read -p "Press enter to run split"
./map.sh
