#!/bin/bash
#
#Mostra os logins e nomes de usuários do sistema
#Obs: Lê dados do arquivo /etc/passwd
#Exemplo para criação de opções...
#
#Davi - 2026
#
#V1: Programa normal
#V2: Adiciona opção -h, -V, --help e --version...

MENSAGEM_USO="
Uso: $0 [-h]

  -h   Mostra esta tela de ajuda e sai
"
#Tratamento das opções de linha de comando

if test "$1" = "-h"
then
	echo "$MENSAGEM_USO"
	exit 0
fi

#programa

cut -d : -f 1,5 /etc/passwd | tr : \\t
