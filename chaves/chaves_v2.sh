#!/bin/bash

## Esse script usa uma chave USAR_CORES para validar se o terminal tem suporte ou não para texto colorido, e imprime a mensagem de acordo com a chave.

##Versão 2: Uso de chave robusta, com comparação de string.


#Testes da chave
#
USAR_CORES=1

if test "$TERM" = "vt100"
	then
		USAR_CORES=0
fi

# Verificação do uso da chave

if test "$USAR_CORES" = 1
	then
		echo $(tput setaf 214)primeiro $(tput setaf 202)script
	else
		echo primerio script
fi
