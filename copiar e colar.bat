@echo off
setlocal enabledelayedexpansion
title Robocopy - Multithread

echo ===========================================
echo        COPIAR E COLAR COM ROBOCOPY
echo ===========================================
echo.

:: Pergunta a pasta de origem
set /p SRC=Digite a pasta ORIGEM: 
echo.

:: Pergunta a pasta de destino
set /p DST=Digite a pasta DESTINO: 
echo.

echo ---------- Iniciando copia ----------
echo Origem : %SRC%
echo Destino: %DST%
echo.

:: Inicia o robocopy em uma nova janela com /ETA (progresso por arquivo) e gera log
set LOGPATH=%TEMP%\robocopy_%RANDOM%.log
start "ROBOCOPY_JOB" /b cmd /c ^
    robocopy "%SRC%" "%DST%" /E /Z /R:2 /W:2 /FFT /XO /MT:128 /ETA /TEE /LOG:"%LOGPATH%" ^& exit /b

:: Spinner + cronômetro enquanto o processo estiver ativo
set "spin=\|/-"
set start=%time%

:waitloop
rem Verifica se ainda existe um robocopy ativo (no job que abrimos)
rem /FI por imagem é o que funciona de forma geral
for /f "skip=1 tokens=1 delims= " %%p in ('tasklist /FI "IMAGENAME eq robocopy.exe" ^| find /i "robocopy.exe"') do (
  set running=1
)

if defined running (
  set running=
  for /l %%i in (0,1,3) do (
    <nul set /p "=Copiando... !spin:~%%i,1!  Tempo decorrido: "
    call :elapsed %start%
    <nul set /p ="      `r"
    ping -n 2 127.0.0.1 >nul
  )
  goto :waitloop
)

:: Limpa a linha do spinner
echo                                            

echo.
echo Copia finalizada.
echo Log: %LOGPATH%
pause
exit /b

:elapsed
rem Calcula tempo decorrido HH:MM:SS a partir de %time% inicial
set "t0=%~1"
set "t1=%time%"

for /f "tokens=1-4 delims=:.," %%a in ("%t0%") do (
  set /a s0=(((1%%a%%100)*3600)+((1%%b%%100)*60)+(1%%c%%100))
)
for /f "tokens=1-4 delims=:.," %%a in ("%t1%") do (
  set /a s1=(((1%%a%%100)*3600)+((1%%b%%100)*60)+(1%%c%%100))
)

set /a diff=s1-s0
if %diff% lss 0 set /a diff=diff+24*3600

set /a hh=diff/3600, mm=(diff%%3600)/60, ss=diff%%60
set "hh=0%hh%" & set "mm=0%mm%" & set "ss=0%ss%"
echo %hh:~-2%:%mm:~-2%:%ss:~-2%
exit /b