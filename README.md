# StopOnFirstBuildErrorCustomLogger

[https://www.nuget.org/packages/StopOnFirstBuildErrorCustomLogger/](https://www.nuget.org/packages/StopOnFirstBuildErrorCustomLogger/)

Usage (example batch file):
```
cd %~dp0
SET MSBUILD="%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Professional\MSBuild\Current\bin\msbuild.exe"
SET VSDEVCMD="%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Professional\Common7\Tools\vsdevcmd.bat"
CALL %VSDEVCMD%

REM build the custom logger first
%msbuild% -p:Configuration=Release StopOnFirstBuildErrorCustomLogger\StopOnFirstBuildErrorCustomLogger.csproj

REM use the custom logger
%msbuild% -p:Configuration=Release BrokenExampleProject\BrokenExampleProject.csproj /logger:"StopOnFirstBuildErrorCustomLogger\bin\StopOnFirstBuildErrorCustomLogger.dll"
```

Example output:
```
ERROR: intercepted by StopOnFirstBuildErrorCustomLogger
ERROR DATA BEGIN:==================
Subcategory:
Code: CS2001
File: CSC
ProjectFile: C:\repos\StopOnFirstBuildErrorCustomLogger\src\BrokenExampleProject\BrokenExampleProject.csproj
LineNumber: 0
ColumnNumber: 0
EndLineNumber: 0
EndColumnNumber: 0
HelpLink:
Message: Source file 'C:\repos\StopOnFirstBuildErrorCustomLogger\src\BrokenExampleProject\Properties\AssemblyInfo.cs' could not be found.
Timestamp: 12/13/2020 11:27:42 AM
ThreadId: 8
HelpKeyword:
SenderName: Csc
BuildEventContext: Microsoft.Build.Framework.BuildEventContext
ERROR DATA END:====================
StopOnFirstBuildErrorCustomLogger aborted the build
```