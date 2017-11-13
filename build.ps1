param(
    [switch]$Preview
)

function Get-ProgramFilesx86()
{
    $pf86 = ${env:ProgramFiles(x86)};
    if (Test-Path $pf86)
    {
        return $pf86;
    }

    return $env:ProgramFiles;
}

function Get-MSBuild15()
{
    $pf86 = Get-ProgramFilesx86;
    $msbuild = [IO.Path]::Combine($pf86, "Microsoft Visual Studio", "2017",
        "Enterprise", "MSBuild", "15.0", "Bin", "msbuild.exe");

    if (Test-Path $msbuild)
    {
        return $msbuild;
    }

    $msbuild = [IO.Path]::Combine($pf86, "Microsoft Visual Studio", "2017",
        "Professional", "MSBuild", "15.0", "Bin", "msbuild.exe");

    if (Test-Path $msbuild)
    {
        return $msbuild;
    }

    $msbuild = [IO.Path]::Combine($pf86, "Microsoft Visual Studio", "2017",
        "Community", "MSBuild", "15.0", "Bin", "msbuild.exe");

    if (Test-Path $msbuild)
    {
        return $msbuild;
    }

    throw "Visual Studio 2017 Enterprise or Professional or Community not installed";
}

function Get-MSBuild15Preview()
{
    $pf86 = Get-ProgramFilesx86;
    $msbuild = [IO.Path]::Combine($pf86, "Microsoft Visual Studio", "Preview",
        "Enterprise", "MSBuild", "15.0", "Bin", "msbuild.exe");

    if (Test-Path $msbuild)
    {
        return $msbuild;
    }

    $msbuild = [IO.Path]::Combine($pf86, "Microsoft Visual Studio", "Preview",
        "Professional", "MSBuild", "15.0", "Bin", "msbuild.exe");

    if (Test-Path $msbuild)
    {
        return $msbuild;
    }

    $msbuild = [IO.Path]::Combine($pf86, "Microsoft Visual Studio", "Preview",
        "Community", "MSBuild", "15.0", "Bin", "msbuild.exe");

    if (Test-Path $msbuild)
    {
        return $msbuild;
    }

    throw "Visual Studio 2017 Enterprise or Professional or Community not installed";
}

$msBuild = Get-MSBuild15;

if ($Preview)
{
    $msBuild = Get-MSBuild15Preview
}

& $msBuild /t:clean,build UwpApp1.sln /p:Configuration="Debug" /p:Platform="x86"

"Built using $msBuild"