# Decodificador de display 
contendo diversos arquivos e pastas relacionados ao desenvolvimento de projetos com FPGAs, usando ferramentas como o Xilinx ISE esse repositorio
foi contem o foco em ".vhd" para um decodificador de display.

## Arquivos e Pastas 
- _ngo, _xmsgs, iseconfig, planAhead_run_1, xlnx_auto_0_xdb, xst/work

Essas pastas são típicas do ambiente de desenvolvimento da Xilinx ISE. Contêm arquivos de configuração, logs, e dados intermediários gerados durante o processo de síntese, implementação e simulação do design FPGA.
- _impact.cmd, _impact.log

Arquivos relacionados ao uso da ferramenta iMPACT da Xilinx, que é utilizada para programar e configurar dispositivos FPGA.
- .vhd

Arquivos VHDL que contêm a descrição do hardware que será sintetizado no FPGA.
- .prj, .stx, .xst

Arquivos de projeto e configuração usados pelo Xilinx ISE para gerenciar e compilar o design.
- .bit:

Arquivos binários gerados após a síntese e implementação do design, que são usados para programar o FPGA.
- .html, .xml, .log, .txt

Arquivos de log, relatórios e outros documentos gerados pelo ISE e outras ferramentas associadas, que contêm detalhes sobre o processo de síntese, implementação, erros, warnings, etc.
- .ncd, .ngc, .ngd, .ngr

Arquivos intermediários gerados durante o fluxo de design. *.ncd (Native Circuit Description), *.ngc (Netlist Generation Constraint), *.ngd (Native Generic Database), *.ngr (Netlist Generation Report).
- .tcl

Scripts TCL usados para automatizar tarefas dentro do ambiente de desenvolvimento.
- .cmd_log, .pad, .pcf, .ptwx, .ucf, .ut, .xpi, .xwbt, .xrpt

Diversos arquivos de configuração, logs e relatórios específicos para diferentes etapas e ferramentas do fluxo de design FPGA. 
- uso e estatísticas

Arquivos como usage_statistics_webtalk.html, webtalk.log são usados para coletar e reportar estatísticas de uso das ferramentas.

## dc38.vhd
Este script VHDL implementa um decodificador 3 para 8, onde as entradas p e e controlam quais das 8 saídas serão ativadas.
A lógica interna define as condições específicas para cada bit da saída, utilizando operações lógicas como or e not. 
O uso de VHDL permite que este decodificador seja sintetizado e implementado em um FPGA, possibilitando sua utilização em sistemas digitais.

###### Biblioteca
O script usa a biblioteca IEEE e a package STD_LOGIC_1164, que define tipos e elementos fundamentais como std_logic e std_logic_vector.

### Declaração da Entidade
- A entidade dcd38 possui três portas
- um vetor de entrada de 3 bits (2 downto 0), representando o valor binário a ser decodificado.
- uma entrada de controle, que habilita ou desabilita o decodificador.
- um vetor de saída de 8 bits (7 downto 0), representando a saída decodificada.

### Funcionamento
A arquitetura do tipo Behavioral descreve o comportamento do decodificador. 
Ele mapeia as combinações das entradas p e e para as saídas s.
Para cada bit da saída s, a expressão lógica determina se o bit é 1 ou 0 baseado nas entradas p e e.

## decodd.vhd
Este módulo VHDL decodd integra um decodificador 3 para 8 com um controlador de display de 7 segmentos de 4 dígitos. 
Ele recebe um valor de 3 bits como entrada e um sinal de clock . 
O valor decodificado é exibido no primeiro dígito do display de 7 segmentos, enquanto os outros três dígitos exibem "0". 
As saídas para os segmentos e os anodos do display são conectadas às respectivas portas de saída do módulo.

### Declaração da Entidade
- CLK_50MHz: uma entrada de clock de 50 MHz.
- CA, CB, CC, CD, CE, CF, CG, DP: saídas para os segmentos do display de 7 segmentos e o ponto decimal.
- AN0, AN1, AN2, AN3: saídas para a seleção dos dígitos do display.
- p: uma entrada de 3 bits que representa o valor binário a ser decodificado.
- s: uma saída de 8 bits que representa o valor decodificado.

### Funcionamento
- Mapeia a entrada p para a entrada p do dcd38.
- A saída s é mapeada diretamente para a saída s do dcd38.
- A entrada e do dcd38 é definida como '0', desabilitando a função de habilitação.
- Mapeia os 3 bits da entrada p para os 3 bits menos significativos de N0.
- Define o bit mais significativo de N0 como '0'.
- Define N1, N2 e N3 como "0000".
- Mapeia a entrada CLK_50MHz para a entrada de clock do decod7seg_4dig.
- Mapeia as saídas CA, CB, CC, CD, CE, CF, CG, DP, AN0, AN1, AN2 e AN3 para as correspondentes saídas do decod7seg_4dig.




 




