#!/bin/bash
#
#Mostra os logins e nomes de usuários do sistema
#Obs: Lê dados do arquivo /etc/passwd
#Exemplo para criação de opções...
#
#Davi - 2026

cut -d : -f 1,5 /etc/passwd | tr : \\t
