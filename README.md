# StopOnFirstBuildErrorCustomLogger

[https://www.nuget.org/packages/StopOnFirstBuildErrorCustomLogger/](https://www.nuget.org/packages/StopOnFirstBuildErrorCustomLogger/)

## Usage

Here's the relevant part from the example batch file:

``` bat
dotnet build -p:Configuration=Release BrokenExampleProject\BrokenExampleProject.csproj /logger:"StopOnFirstBuildErrorCustomLogger\bin\net6.0\StopOnFirstBuildErrorCustomLogger.dll"
```

Example output:
```
ERROR: intercepted by StopOnFirstBuildErrorCustomLogger
ERROR DATA BEGIN:==================
Subcategory:
Code: CS5001
File: CSC
ProjectFile: C:\dev\StopOnFirstBuildErrorCustomLogger\src\BrokenExampleProject\BrokenExampleProject.csproj
LineNumber: 0
ColumnNumber: 0
EndLineNumber: 0
EndColumnNumber: 0
HelpLink:
Message: Program does not contain a static 'Main' method suitable for an entry point
Timestamp: 2023-07-14 3:58:37 PM
ThreadId: 13
HelpKeyword:
SenderName: Csc
BuildEventContext: Node=1 Submission=1 ProjectContext=127 ProjectInstance=4 Eval=-1 Target=123 Task=72
ERROR DATA END:====================
StopOnFirstBuildErrorCustomLogger aborted the build
```

## Building a nuget package

You can run this from the root folder of the repo:

``` bat
dotnet pack src\StopOnFirstBuildErrorCustomLogger\StopOnFirstBuildErrorCustomLogger.csproj
```
