#!/bin/bash

PS3='Valige üks sõna: '

#bash select
select word in "linux" "bash" "python" "PowerShell"
do
echo "Teie valisite: $word"
break
done