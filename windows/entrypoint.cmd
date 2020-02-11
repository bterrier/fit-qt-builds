@echo off
set PATH=c:\perl\perl\site\bin;c:\perl\perl\bin;c:\perl\c\bin;%PATH%
set PATH=c:\mingw64\bin;%PATH%



REM cmd /c %*

set OPENSSL_INCLUDE_x64=C:\openssl\include
set OPENSSL_LIB_x64=C:\openssl\lib
set MYSQL_INCLUDE_x64=C:\mysql-connector-c-6.1.11-winx64\include
set MYSQL_LIB_x64=C:\mysql-connector-c-6.1.11-winx64\lib
set POSTGRESQL_INCLUDE_x64=C:\pgsql\include
set POSTGRESQL_LIB_x64=C:\pgsql\lib
set VK_SDK_PATH=C:\VulkanSDK\1.2.131.1
set VULKAN_SDK=C:\VulkanSDK\1.2.131.1
set LLVM_INSTALL_DIR=C:\llvm

echo %cd%
SET
configure.bat -opensource -confirm-license -verbose -prefix c:\Users\qt\work\install -release -debug-and-release ^
    -nomake tests -nomake examples ^
    -opengl dynamic ^
    -openssl -I %OPENSSL_INCLUDE_x64% -L %OPENSSL_LIB_x64% ^
    -no-sql-mysql -plugin-sql-sqlite -plugin-sql-odbc -I %MYSQL_INCLUDE_x64% -L %MYSQL_LIB_x64% ^
    -plugin-sql-psql -I %POSTGRESQL_INCLUDE_x64% -L %POSTGRESQL_LIB_x64% ^
    -platform win32-g++