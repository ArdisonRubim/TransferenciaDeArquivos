#!/usr/bin/env bash

############################################################
# Author: Ardison Rubim        				   #
# Linkedin: https://www.linkedin.com/in/ardison-rubim/     #
# WhatsApp: (98) 98497-6673				   #
#							   #
# Nome: cria_script_transfer_2.0.sh		  	   #
#                              				   #
# Date: 27/02/2024 - Ardison Rubim    			   #
#							   #
# Update02: 17/03/2024 - Ardison Rubim			   #
#							   #
# Description01: Script para gerar script de transferência #
# de arquivos.  					   #
#							   #
# Description02: Foi incluido função de percorrer a pasta  #
# de origem, retirando do técnico o trabalho de validar    #
# a quantidade de pastas.			    	   #
# 				                           #
############################################################


# Comando para gerar script transfer.sh
echo "#!/usr/bin/env bash" > transfer.sh
echo "" >> transfer.sh

echo "echo 'Iniciando a transferencia'" >> transfer.sh
echo "sleep 2" >> transfer.sh

echo "" >> transfer.sh

# Nome da atual do script
SCRIPT="cria_script_transfer_2.0.sh"

echo "Verificando o espaço no diretório atual..."
# Tamanho do diretorio
TOTAL=$(du -sh)

# Especifique o caminho de destino dos arquivo
FILE="/mnt/examesantigos3/2023/1/"

# Caminho de origem, certifique-se de estar no diretorio dos arquivos que deseja transferir.
SOURCE_FILES=$(ls "$PWD" | sort -n)

echo "Total a ser transferido: '$TOTAL'"
sleep 2
echo ""

echo "#Total: "$TOTAL" " >> transfer.sh
echo "" >> transfer.sh
echo "Gerando script de transferencia"
echo ""
echo "" >> transfer.sh

# Loop para percorrer as pastas no diretorio de origem
for PASTE in $SOURCE_FILES; do
    # Verifica se o nome da PASTE é diferente dos scripts gerados
    if [[ $PASTE != "transfer.sh" && $PASTE != "$SCRIPT" ]]; then
        echo "Criando script, PASTE $PASTE "
        sleep 0.3
        echo "rsync -havPuz $PASTE/* $FILE$PASTE/" >> transfer.sh
    fi
done

echo "" >> transfer.sh
echo "echo 'Transferencia Concluida!'" >> transfer.sh

# Apos a execucao, sera gerado um script chamado transfer.sh
# Lembre-se de dar permissao de execucao com o comando abaixo:
# chmod +x transfer.sh

echo ""
echo 'Script transfer.sh criado com sucesso!'
echo 'Por favor, valide antes de executar'
sleep 3

