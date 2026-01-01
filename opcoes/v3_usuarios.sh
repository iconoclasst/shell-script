#!/bin/bash
#
#Mostra os logins e nomes de usuários do sistema
#Obs: Lê dados do arquivo /etc/passwd
#Exemplo para criação de opções...
#
#Davi - 2026
#
#Versão 1: Programa normal
#Versão 2: Adiciona opção -h
#Versão 3: Adiciona a opção -V, além do uso de case
#Versão 3.2: Atualização de teste e uso de basename
#Versão 3.4: Adição de --help e --version

VERSAO_ATUAL=$(grep '^#Versão ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#)

MENSAGEM_USO="
Uso: $(basename "$0") [-h | -V]

  -h, --help   Mostra esta tela de ajuda e sai
  -V, --version   Mostra a versão atual do programa
"

#Tratamento das opções de linha de comando

case "$1" in
	-h | --help)
		echo "$MENSAGEM_USO"
		exit 0
	;;
	
	-V | --version)
		echo "$VERSAO_ATUAL"
		exit 0
	;;

	*)
		if test -n "$1"
		then
			echo "Opção inválida: $1"
			exit 1
		fi
	;;
esac

#programa

cut -d : -f 1,5 /etc/passwd | tr : \\t
