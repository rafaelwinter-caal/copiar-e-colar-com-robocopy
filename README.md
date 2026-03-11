📘 Robocopy com Multithread e Barra de Progresso (Batch)
Este projeto fornece um script em Batch (.bat) que aprimora o uso do Robocopy no Windows, adicionando:

Multithread (/MT:128)
Spinner animado enquanto a cópia ocorre
Cronômetro com tempo decorrido
Saída contínua do Robocopy na tela
Log automático em arquivo temporário

O objetivo é tornar a cópia de grandes volumes de dados mais clara, mais rápida e com melhor experiência visual, mantendo compatibilidade total com ambientes Windows.

📂 Funcionalidades
✔️ Cópia com Robocopy utilizando 128 threads
✔️ Recuperação de falhas com /Z
✔️ Somente reescreve arquivos mais recentes
✔️ Spinner animado mostrando atividade
✔️ Tempo total decorrido durante a operação
✔️ Log detalhado salvo automaticamente
✔️ Compatível com Windows 10 / 11 / Server

📸 Demonstração do Funcionamento

        ===========================================
                COPIAR E COLAR COM ROBOCOPY
        ===========================================
        
        Digite a pasta ORIGEM:
        Digite a pasta DESTINO:
        
        ---------- Iniciando copia ----------
        Copiando... |  Tempo decorrido: 00:03:42


⚙️ Como usar

Baixe o arquivo robocopy_multithread_progress.bat.
Execute com duplo clique ou via CMD.
Informe:

Pasta origem
Pasta destino

Aguarde enquanto o spinner e o cronômetro indicam progresso.
Ao final, o script exibirá:

“Cópia finalizada”
Caminho do arquivo de log
