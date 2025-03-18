@echo off
:menu
cls
echo =========================
echo LAB03 - 12411ECP020
echo =========================
echo 1. Testar DFF
echo 2. Testar BIT
echo 3. Testar Register
echo 4. Testar RAM8
echo 5. Testar RAM64
echo 6. Testar RAM512
echo 7. Testar RAM4K    
echo 8. Testar RAM16K
echo 9. Testar PC
echo 0. Sair
echo =========================
set /p opt=Escolha uma opcao (1-6): 

if "%opt%"=="1" set comp=dff
if "%opt%"=="2" set comp=bit
if "%opt%"=="3" set comp=register
if "%opt%"=="4" set comp=ram8
if "%opt%"=="5" set comp=ram64
if "%opt%"=="6" set comp=ram512
if "%opt%"=="7" set comp=ram4k
if "%opt%"=="8" set comp=ram16k
if "%opt%"=="9" set comp=pc
if "%opt%"=="0" cls & exit

iverilog -o tb_%comp%.vvp tests/tb_%comp%.v
vvp tb_%comp%.vvp
gtkwave tb_%comp%.vcd
del tb_%comp%.vvp
del tb_%comp%.vcd
goto menu
