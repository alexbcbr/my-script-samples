#!/bin/bash

# criar disco de SWAP
# Obs: script deve ser rodado com permissao de root
# Em caso de erro de ativacao do swapon digite: swapoff swap.swp

dd if=/dev/zero of=~/swap.swp bs=1024 count=800k
chdmod 600 swap.swp
mkswap swap.swp
swapon swap.swp

#Caso queira inicializar a instancia com o swap basta configurar o fstab
# /root/swap.swp  /       swap    defaults,barrier=0 1 1

# Pode ser feito swap diretamente para um volume ou particao (instance store)
# swapon /dev/xvdf
# /dev/xvdf  /       swap    defaults

