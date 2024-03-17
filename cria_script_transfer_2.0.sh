#!/bin/bash

##########################################################
# Author: Ardison Rubim        				 #
#                              				 #
# Date: 27/02/2024                                       #
# Update: 17/03/2024                                     #
# Description: Script para gerar#
# script de transferência de ar-#
# quivos.                       #
#################################


echo "Verificando o espaço..."

# Especifique o caminho de destino dos arquivo
FILE="/mnt/examesantigos3/2023/12/"

# Total de arquivos
TOTAL=$(du -sh)

# Caminho de origem
FILEPWD=$(pwd)

echo "Total a ser transferido: '$TOTAL'"
sleep 2
echo ""
# Comando para gerar script
# O laco for vai executar a quantidades de vezes que colocar entre {1..31}
# No exemplo ele vai rodar de 1 a 31 guardando o valor na variavel pasta
# Ou seja vai gerar 31 linhas com as patas de 1 a 31


echo "#!/bin/bash" > transfer.sh
echo "#Total: "$TOTAL" " >> transfer.sh
echo "" >> transfer.sh
echo "Gerando script de transferencia"
echo ""
echo "" >> transfer.sh
#Colque o intervalo de pasta no local mostrado abaixo
#------------------------------------------------------#
#Qtd de pastas↓ a ↓serem criadas 31#
for pasta in "$FILEPWD"; do
	echo "Criando script, pasta $pasta "
	sleep 0.3
        echo "rsync -havPuz $pasta/* $FILE$pasta/" >> transfer.sh
done
echo "" >> transfer.sh
echo "echo 'Transferencia Concluida!'" >> transfer.sh


# Apos a execucao o sera gerado um script chamado transfer.sh
# Lembre-se de dar permissacao de execucao com o comando chmod +x transfer.sh
# Em seguida execute!

echo ""
echo 'Script transfer.sh criado com sucesso!'
echo 'Por favor, valide antes de executar'
sleep 3
