cd %~dp0
SET MSBUILD="%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Professional\MSBuild\Current\bin\msbuild.exe"
SET VSDEVCMD="%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Professional\Common7\Tools\vsdevcmd.bat"
CALL %VSDEVCMD%

%msbuild% -p:Configuration=Release StopOnFirstBuildErrorCustomLogger\StopOnFirstBuildErrorCustomLogger.csproj
%msbuild% -p:Configuration=Release BrokenExampleProject\BrokenExampleProject.csproj /logger:"StopOnFirstBuildErrorCustomLogger\bin\StopOnFirstBuildErrorCustomLogger.dll" 
pause