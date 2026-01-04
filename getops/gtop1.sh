#!/bin/bash
#
#Shell Script de exemplo para uso do getopts
#Loop que processa as opções de linha de comando
#Opções válidas ficam numa string ":saa:"
#Os dois pontos : no inicio da string válida ativam o modo silencioso
#Os dois pontos : após um opt representam um argumento
#

while getopts ":sa:" opcao
do
	case $opcao in
		s) echo "OK Opção simples (-s)" ;;
		a) echo "OK Opção com argumento (-a), recebeu $OPTARG" ;;
		\?) echo "ERRO Opção inválida: $OPTARG" ;;
		:) echo "ERRO Faltou argumento para: $OPTARG" ;;
	esac
done

echo
shift $((OPTIND - 1))
echo "INDICE: $OPTIND"
echo "RESTO: $*"
echo
