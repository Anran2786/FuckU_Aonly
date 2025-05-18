@echo off
chcp 65001
cls
echo 请将boot.img放在工具目录下，转换完成的boot_sar文件将输出在同级目录下
pause
set "tool=%~dp0bin\magiskboot.exe"
set "ramdisk=%~dp0bin\ramdisk.cpio"
set "root=%~dp0"
copy boot.img bin\tmp
cd bin\tmp
%tool% unpack boot.img
copy %ramdisk% ramdisk.cpio
%tool% repack boot.img
move /y new-boot.img %root%boot_sar.img
del /Q .\*
cls
echo 转换完成，转换后的文件为boot_sar.img
pause