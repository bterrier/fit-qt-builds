FROM mcr.microsoft.com/windows:1909
RUN powershell -Command \
    MKDIR C:\Users\qt; \
    NET USER qt /add /homedir:C:\Users\qt ; \
    NET LOCALGROUP Administrators /add qt; \
    dir C:\Users
ADD resources/7z1900-extra.tar.gz C:/
COPY resources/x86_64-7.3.0-release-posix-seh-rt_v5-rev0.7z resources/PortableGit-2.25.0-64-bit.7z.exe  resources/strawberry-perl-5.30.1.1-64bit-portable.zip C:/ 
RUN powershell -Command \
    C:/7z/x64/7za.exe x x86_64-7.3.0-release-posix-seh-rt_v5-rev0.7z; \
    C:/7z/x64/7za.exe x PortableGit-2.25.0-64-bit.7z.exe -ogit; \
    C:/7z/x64/7za.exe x strawberry-perl-5.30.1.1-64bit-portable.zip -operl
RUN powershell -Command \
    dir perl

COPY resources/qt-everywhere-src-5.14.1.tar.xz .
RUN powershell -Command \
    C:/7z/x64/7za.exe x qt-everywhere-src-5.14.1.tar.xz; \
    C:/7z/x64/7za.exe x qt-everywhere-src-5.14.1.tar -oC:/Users/qt/work/qt -y; \
    mv C:/Users/qt/work/qt/qt-everywhere-src-5.14.1 C:/Users/qt/work/qt/qt5; \
    rm qt-everywhere-src-5.14.1.tar; \
    rm  qt-everywhere-src-5.14.1.tar.xz

COPY resources/Win64OpenSSL-1_1_1d.7z .
RUN powershell -Command \
    C:/7z/x64/7za.exe x Win64OpenSSL-1_1_1d.7z; \
    dir; dir openssl ;\
    rm Win64OpenSSL-1_1_1d.7z

COPY resources/mysql-connector-c-6.1.11-winx64.zip .
RUN powershell -Command \
    C:/7z/x64/7za.exe x mysql-connector-c-6.1.11-winx64.zip\
    rm mysql-connector-c-6.1.11-winx64.zip

COPY resources/LLVM-9.0.0-win64.7z .
RUN powershell -Command \
    C:/7z/x64/7za.exe x LLVM-9.0.0-win64.7z -ollvm;\
    rm LLVM-9.0.0-win64.7z; dir

COPY resources/postgresql-12.1-3-windows-x64-binaries.zip .
RUN powershell -Command \
    C:/7z/x64/7za.exe x postgresql-12.1-3-windows-x64-binaries.zip;\
    rm postgresql-12.1-3-windows-x64-binaries.zip; dir

COPY resources/VulcanSDK-1.2.131.1.7z .
RUN powershell -Command \
    C:/7z/x64/7za.exe x VulcanSDK-1.2.131.1.7z;\
    rm VulcanSDK-1.2.131.1.7z; dir

# ADD https://aka.ms/vs/16/release/vs_buildtools.exe .
ADD resources/vs_buildtools.exe .
# Install Build Tools excluding workloads and components with known issues.
RUN powershell -Command \
    .\vs_buildtools.exe --quiet --wait --norestart --nocache \
    --installPath C:\BuildTools \
    --all \
    --remove Microsoft.VisualStudio.Component.Windows10SDK.10240 \
    --remove Microsoft.VisualStudio.Component.Windows10SDK.10586 \
    --remove Microsoft.VisualStudio.Component.Windows10SDK.14393 \
    --remove Microsoft.VisualStudio.Component.Windows81SDK \
 || IF "%ERRORLEVEL%"=="3010" EXIT 0

COPY entrypoint.cmd .
WORKDIR C:/Users/qt/work/qt/qt5
ENTRYPOINT [ "C:/entrypoint.cmd" ]