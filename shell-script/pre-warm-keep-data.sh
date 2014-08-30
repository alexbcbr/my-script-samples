# copia os dados do volume original e copia sobre o mesmo volume tocando no disco inteiro

dd if=/dev/xvdf of=/dev/xvdf conv=notrunc bs=1M

