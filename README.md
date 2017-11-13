# UWP-Symbols-Repro
Repo for a repro of https://github.com/dotnet/sdk/issues/955


## To check repro
From command line run [build.ps1](build.ps1).  To use preview version of msbuild pass the `-Preview` switch

## What this does
This is a UWP project that references a netstandard nuget that is using portable PDBs.  It shows that when you build a clean build from command line the build fails.