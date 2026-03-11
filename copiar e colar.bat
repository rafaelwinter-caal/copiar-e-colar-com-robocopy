@echo off
title Robocopy Simples - Multithread

echo ===========================================
echo        COPIAR E COLAR COM ROBOCOPY
echo ===========================================
echo.

:: Pergunta a pasta de origem
set /p SRC=Digite a pasta ORIGEM: 

:: Pergunta a pasta de destino
set /p DST=Digite a pasta DESTINO: 

echo.
echo Iniciando copia...
echo Origem : %SRC%
echo Destino: %DST%
echo.

:: Robocopy com multithread
robocopy "%SRC%" "%DST%" /E /Z /R:2 /W:2 /FFT /XO /MT:128


echo.
echo Copia finalizada.
pause