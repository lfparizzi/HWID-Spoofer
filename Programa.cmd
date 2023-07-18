@echo off
REM passo 2 GUID CHANGE
@echo ================== Carregando GUID Changer ==================

powershell.exe -File "%~dp0_\guidchanger.ps1"

cls



@echo off

REM passo 4 HD HWID CHANGE

@echo ================== Carregando HD HWID Changer ==================

copy /b "%~dp0\_\Volumeid.exe" "C:\" >nul
copy /b "%~dp0\_\Volumeid64.exe" "C:\" >nul
@echo Volume ID Files foram movidos para C: drive
@Echo Off
Setlocal EnableDelayedExpansion
Set _RNDLength=8
Set _Alphanumeric=0123456789ABCDEF
Set _Str=%_Alphanumeric%987654321
:_LenLoop
IF NOT "%_Str:~18%"=="" SET _Str=%_Str:~9%& SET /A _Len+=9& GOTO :_LenLoop
SET _tmp=%_Str:~9,1%
SET /A _Len=_Len+_tmp
Set _count=0
SET _RndAlphaNum=
:_loop
Set /a _count+=1
SET _RND=%Random%
Set /A _RND=_RND%%%_Len%
SET _RNDZ=%Random%
Set /A _RNDZ=_RNDZ%%%_Len%
SET _RndAlphaNum=!_RndAlphaNum!!_Alphanumeric:~%_RND%,1!
SET _RndAlphaNumz=!_RndAlphaNumz!!_Alphanumeric:~%_RNDZ%,1!
If !_count! lss %_RNDLength% goto _loop
@echo off
@echo ----------------------------------------------------------------------------------------------------------------
@echo IMPORTANTE: A troca do HD ID so funciona com discos no formato NTFS, FAT ou FAT32
@echo IMPORTANTE: Caso seu disco esteja em exFAT voce deve utilizar o software "AOMEI Partition Assistant Professional" para trocar seu HD ID
@echo IMPORTANTE: Caso sua situacao seja a do exFAT e voce ja tenha realizado a mudanca pelo "AOMEI", selecione a letra do drive exFAT normalmente aqui para seguir com a execucao do script (o ID do HD exFAT NAO SERA ALTERADO!)
@echo IMPORTANTE: Apos execucao total do codigo voce deve REINICIAR o computador, lembrarei voce disso ao final
echo:
@echo Abaixo voce consegue visualizar uma lista completa com todos os seus drives:

fsutil fsinfo drives
@echo ----------------------------------------------------------------------------------------------------------------
set /p drive= Qual drive ID voce quer alterar?(Apenas digite a letra do drive):  
cd c:\
vol %drive%:
@echo SN/IDs serao alterados no proximo passo
pause
@echo Drive %drive% id sera alterado para !_RndAlphaNum!-!_RndAlphaNumz!
pause
volumeid64.exe %drive%: !_RndAlphaNum!-!_RndAlphaNumz!
echo:
@echo Drive %drive% id foi alterado com SUCESSO para !_RndAlphaNum!-!_RndAlphaNumz!
pause
cls



@echo off
REM passo 5 HWID de tudo
@echo ================== Carregando Outros HWID changers ==================
echo:
Setlocal EnableDelayedExpansion
Set _RNDLength=2
Set _Alphanumeric=0123456789ABCDEF
Set _Str=%_Alphanumeric%987654321
:_LenLoop
IF NOT "%_Str:~18%"=="" SET _Str=%_Str:~9%& SET /A _Len+=9& GOTO :_LenLoop
SET _tmp=%_Str:~9,1%
SET /A _Len=_Len+_tmp
Set _count=0
SET _RndAlphaNum=
:_loop
Set /a _count+=1
SET _RNDCS=%Random%
Set /A _RNDCS=_RNDCS%%%_Len%

SET _RNDBS=%Random%
Set /A _RNDBS=_RNDBS%%%_Len%

SET _RNDPSN=%Random%
Set /A _RNDPSN=_RNDPSN%%%_Len%

SET _RNDSS=%Random%
Set /A _RNDSS=_RNDSS%%%_Len%

SET _RNDSU=%Random%
Set /A _RNDSU=_RNDSU%%%_Len%

SET _RndAlphaNumCS=!_RndAlphaNumCS!!_Alphanumeric:~%_RNDCS%,1!
SET _RndAlphaNumBS=!_RndAlphaNumBS!!_Alphanumeric:~%_RNDBS%,1!
SET _RndAlphaNumPSN=!_RndAlphaNumPSN!!_Alphanumeric:~%_RNDPSN%,1!
SET _RndAlphaNumSS=!_RndAlphaNumSS!!_Alphanumeric:~%_RNDSS%,1!
SET _RndAlphaNumSU=!_RndAlphaNumSU!!_Alphanumeric:~%_RNDSU%,1!

If !_count! lss %_RNDLength% goto _loop

@echo off
@echo ----------------------------------------------------------------------------------------------------------------
cd "%~dp0\_"
@echo ----------------------------------------------------------------------------------------------------------------
@echo ALTERANDO TODOS OS HWIDs
@echo CS sera alterado para: !_RndAlphaNumCS!!_RndAlphaNumBS!!_RndAlphaNumPSN!
@echo BS sera alterado para: !_RndAlphaNumBS!!_RndAlphaNumPSN!!_RndAlphaNumSU!!_RndAlphaNumBS!
@echo PSN sera alterado para: !_RndAlphaNumPSN!!_RndAlphaNumPSN!!_RndAlphaNumPSN!!_RndAlphaNumCS!!_RndAlphaNumBS!!_RndAlphaNumPSN!!_RndAlphaNumSS!
@echo SS sera alterado para: !_RndAlphaNumSS!!_RndAlphaNumPSN!!_RndAlphaNumCS!!_RndAlphaNumBS!
@echo SU sera alterado Automaticamente
echo:
pause
echo:
cd "%~dp0\_"
AMIDEWINx64.EXE /CS > nul !_RndAlphaNumCS!!_RndAlphaNumBS!!_RndAlphaNumPSN!
AMIDEWINx64.EXE /BS > nul !_RndAlphaNumBS!!_RndAlphaNumPSN!!_RndAlphaNumSU!!_RndAlphaNumBS!
AMIDEWINx64.EXE /PSN > nul !_RndAlphaNumPSN!!_RndAlphaNumPSN!!_RndAlphaNumPSN!!_RndAlphaNumCS!!_RndAlphaNumBS!!_RndAlphaNumPSN!!_RndAlphaNumSS!
AMIDEWINx64.EXE /SS > nul !_RndAlphaNumSS!!_RndAlphaNumPSN!!_RndAlphaNumCS!!_RndAlphaNumBS!
AMIDEWINx64.EXE /SU > nul AUTO
@echo CS alterado com sucesso para: !_RndAlphaNumCS!!_RndAlphaNumBS!!_RndAlphaNumPSN!
@echo BS alterado com sucesso para: !_RndAlphaNumBS!!_RndAlphaNumPSN!!_RndAlphaNumSU!!_RndAlphaNumBS!
@echo PSN alterado com sucesso para: !_RndAlphaNumPSN!!_RndAlphaNumPSN!!_RndAlphaNumPSN!!_RndAlphaNumCS!!_RndAlphaNumBS!!_RndAlphaNumPSN!!_RndAlphaNumSS!
@echo SS alterado com sucesso para: !_RndAlphaNumSS!!_RndAlphaNumPSN!!_RndAlphaNumCS!!_RndAlphaNumBS!
@echo SU alterou Automaticamente
@echo TODOS OS HWIDs foram alterados.

pause
cls



@echo off
rem passo 5 Mac changer
@echo ================== Carregando Mac Changer ==================
powershell.exe -File "%~dp0_\macchanger.ps1"

pause
