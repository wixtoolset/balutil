@setlocal
@pushd %~dp0
@set _C=Release

nuget restore || exit /b

msbuild -p:Configuration=%_C%;Platform=x86;PlatformToolset=v140 || exit /b
msbuild -p:Configuration=%_C%;Platform=x64;PlatformToolset=v140 || exit /b

msbuild -p:Configuration=%_C%;Platform=x86;PlatformToolset=v141 || exit /b
msbuild -p:Configuration=%_C%;Platform=x64;PlatformToolset=v141 || exit /b
msbuild -p:Configuration=%_C%;Platform=ARM64;PlatformToolset=v141 || exit /b

msbuild -p:Configuration=%_C%;Platform=x86;PlatformToolset=v142 || exit /b
msbuild -p:Configuration=%_C%;Platform=x64;PlatformToolset=v142 || exit /b
msbuild -p:Configuration=%_C%;Platform=ARM64;PlatformToolset=v142 || exit /b

dotnet test -c %_C% --no-build src\test\WixToolsetTest.Mba.Core\WixToolsetTest.Mba.Core.csproj || exit /b

msbuild -t:Pack -p:Configuration=%_C% src\balutil\balutil.vcxproj || exit /b
msbuild -t:Pack -p:Configuration=%_C% src\bextutil\bextutil.vcxproj || exit /b
msbuild -t:Pack -p:Configuration=%_C% src\WixToolset.Mba.Core\WixToolset.Mba.Core.csproj || exit /b

@popd
@endlocal