cd %~dp0

SET MSBUILD="%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Professional\MSBuild\Current\bin\msbuild.exe"
SET VSDEVCMD="%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Professional\Common7\Tools\vsdevcmd.bat"
CALL %VSDEVCMD%

%msbuild% -p:Configuration=Release StopOnFirstBuildErrorCustomLogger.csproj

nuget pack StopOnFirstBuildErrorCustomLogger.1.0.0.nuspec -OutputDirectory bin

pause