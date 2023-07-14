REM Set the current working directory to the location of this batch file
PUSHD %~dp0

REM build the custom logger first
dotnet build -p:Configuration=Release StopOnFirstBuildErrorCustomLogger\StopOnFirstBuildErrorCustomLogger.csproj

REM use the custom logger
dotnet build -p:Configuration=Release BrokenExampleProject\BrokenExampleProject.csproj /logger:"StopOnFirstBuildErrorCustomLogger\bin\net6.0\StopOnFirstBuildErrorCustomLogger.dll"

POPD
