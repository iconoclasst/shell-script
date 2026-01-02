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
#Versão 4: Adição da opção -s e --sort (ordenação)
#Versão 5: Adição das opções -i, --invert e -u, --uppercase 
#Versão 5.2: Adição do uso de shift para multiplas opções
#Versão 5.3: Compactação de trechos do código
#Versão 5.5: Adição de opção com argumento -d, --delimiter

#Variaveis principais
############################################

VERSAO_ATUAL=$(grep '^#Versão ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#)
ORDENAR=0
INVERTER=0
UPPER=0
delim='\t'

MENSAGEM_USO="
Uso: $(basename "$0") [OPÇÕES]

Opções:

  -h, --help   Mostra esta tela de ajuda e sai
  -V, --version   Mostra a versão atual do programa
  -s, --sort   Mostra a saída ordenada
  -i, --invert   Mostra a lista invertida
  -u, --uppercase   Mostra o texto em maiúsculo
  -d, --delimiter   Passa como argumento o delimitador do texto
"

#Tratamento das opções de linha de comando
while test -n "$1"
do
	case "$1" in
		-d | --delimiter)
			shift
			delim="$1"
			
			if test -z "$delim"
			then
				echo "Faltou o argumento para -d"
				exit 1
			fi
		;;

		-h | --help)
			echo "$MENSAGEM_USO"
			exit 0
		;;
		
		-V | --version)
			echo "$VERSAO_ATUAL"
			exit 0
		;;

		-s | --sort) ORDENAR=1 ;;

		-i | --invert) INVERTER=1 ;;

		-u | --uppercase) UPPER=1 ;;

		*)
			if test -n "$1"
			then
				echo "Opção inválida: $1"
				exit 1
			fi
		;;
	esac
	
	shift
done

#programa
####################################################

#Extrair lista

lista=$(cut -d : -f 1,5 /etc/passwd)

#Execução das opções

test "$ORDENAR" = 1 && lista=$(echo "$lista" | sort)

test "$INVERTER" = 1 &&	lista=$(echo "$lista" | tac)

test "$UPPER" = 1 &&	lista=$(echo "$lista" | tr a-z A-Z)

#Impressão da lista processada
echo "$lista" | tr : "$delim"


