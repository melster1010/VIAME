REM ---------------------------------------------------
REM CORE BUILD PIPELINE
REM ---------------------------------------------------

SET VIAME_SOURCE_DIR=C:\workspace\VIAME-Seal-CPU
SET VIAME_BUILD_DIR=%VIAME_SOURCE_DIR%\build

IF EXIST build rmdir /s /q build

IF NOT EXIST C:\tmp mkdir C:\tmp
IF EXIST C:\tmp\fl4 rmdir /s /q C:\tmp\fl4
IF EXIST C:\tmp\kv4 rmdir /s /q C:\tmp\kv4
IF EXIST C:\tmp\vm4 rmdir /s /q C:\tmp\vm4

SET "PATH=C:\Program Files (x86)\Windows Kits\10\bin\x64;C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.1\bin;C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.1\libnvvp;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files\Git\cmd;C:\Program Files\CMake\bin;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\Program Files\NVIDIA Corporation\NVIDIA NvDLISR;C:\Users\kitware\AppData\Local\Microsoft\WindowsApps"
SET "PYTHONPATH=%VIAME_BUILD_DIR%\install\lib\python3.6;%VIAME_BUILD_DIR%\install\lib\python3.6\site-packages"
SET "INCLUDE=C:\Program Files (x86)\Windows Kits\10\Include\10.0.17134.0\ucrt;C:\Program Files (x86)\Windows Kits\10\Include\10.0.17134.0\shared;%INCLUDE%"
SET "LIB=C:\Program Files (x86)\Windows Kits\10\Lib\10.0.17134.0\um\x64;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.17134.0\ucrt\x64;%LIB%"

REM Hack around some internal python enabled issues
SET "PATH=%VIAME_BUILD_DIR%\install\bin;%PATH%"
SET "INCLUDE=%VIAME_BUILD_DIR%\install\include;%INCLUDE%"
SET "LIB=%VIAME_BUILD_DIR%\install\lib;%LIB%"

git submodule update --init --recursive

"C:\Program Files\CMake\bin\ctest.exe" -S jenkins_dashboard.cmake -VV

REM ---------------------------------------------------
REM HACKS UNTIL THESE THINGS ARE BETTER HANDLED IN CODE
REM ---------------------------------------------------

SET CPU_ADD_ON_PACKAGE=C:\tmp\VIAME-Windows-CPU.zip
SET MISSING_SVM_DLL=%VIAME_SOURCE_DIR%\packages\smqtk\TPL\libsvm-3.1-custom\libsvm.dll

move "%VIAME_BUILD_DIR%\install" "%VIAME_BUILD_DIR%\VIAME"
"C:\Program Files\7-Zip\7z.exe" x -aoa %CPU_ADD_ON_PACKAGE% -o%VIAME_BUILD_DIR%
move %MISSING_SVM_DLL% %VIAME_BUILD_DIR%\VIAME\bin

copy /y %VIAME_SOURCE_DIR%\cmake\setup_viame.bat.install %VIAME_BUILD_DIR%\VIAME\setup_viame.bat

del %VIAME_BUILD_DIR%\VIAME\configs\pipelines\models\default_detector.zip

REM ---------------------------------------------------
REM COMPRESS FINAL PACKAGE
REM ---------------------------------------------------

move "%VIAME_BUILD_DIR%\VIAME" "%VIAME_BUILD_DIR%\SEAL_TK"
"C:\Program Files\7-Zip\7z.exe" a "%VIAME_BUILD_DIR%\SEAL-Windows-64Bit-CPU.zip" "%VIAME_BUILD_DIR%\SEAL_TK"
