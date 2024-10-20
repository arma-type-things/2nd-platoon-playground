# This script assembles the folder structure for the mission files. It will then attempt to detect what PBO tool is available (some day) and use that to pack the mission file.

# Global variables
$cwd = Get-Location
# Base mission name; will be used to create mission folders with the map name appended
$missionName = "2nd-platoon-private-zeus"
# Map names, generated from the folders placed in the maps folder; should have mission.sqm file, and either a description_map.inc or a .skip-scripts file
$mapFolders = Get-ChildItem -Directory -Path "maps" | ForEach-Object { $_.Name }
$supportedMaps = $mapFolders
# create temp folder with fallback for macos
$buildFolder = Join-Path -Path $cwd -ChildPath "build"
New-Item -ItemType Directory -Force -Path $buildFolder

# detect PBO tool and set it to the variable pboTool
$pboTool = ""
if (Get-Command armake2 -ErrorAction SilentlyContinue) {
    $pboTool = "armake2"
} else {
    Write-Host "No PBO tool found. Please install armake2 (cargo install armake2)."
    exit 1
}

# TODO: detect zip installed
$zipTool = ""
if (Get-Command zip -ErrorAction SilentlyContinue) {
    $zipTool = "zip"
} else {
    Write-Host "No ZIP tool found. Please install zip / unzip for the command line."
    exit 1
}

# Functions
function Setup-BuildFolder {
    # Create mission folder(s) in temp folder
    foreach ($map in $supportedMaps) {
        $sourceFolder = Join-Path -Path "maps" -ChildPath $map
        $mapFolder = "$missionName.$map"
        $targetFolder = Join-Path -Path $buildFolder -ChildPath $mapFolder
        # if the target folder exists, remove it
        if (Test-Path $targetFolder) {
            Remove-Item -Recurse -Force $targetFolder
        }
        Copy-Item -Recurse -Path $sourceFolder -Destination $targetFolder
        Copy-MissionSettings -missionFolder $targetFolder
        if (Test-SkipScripts -missionFolder $sourceFolder) {
            continue
        }
        Copy-Paradigm -missionFolder $targetFolder
        Copy-ParadigmConfig -missionFolder $targetFolder
        Copy-CustomFunctions -missionFolder $targetFolder
    }
}

function Copy-MissionSettings {
    param (
        [string]$missionFolder
    )
    if (Test-SkipScripts -missionFolder $missionFolder) {
        Copy-Item -Path "description.ext.skip-scripts" -Destination (Join-Path -Path $missionFolder -ChildPath "description.ext")
    } else {
        Copy-Item -Path "description.ext" -Destination $missionFolder
    }
    Copy-Item -Path "cba_settings.sqf" -Destination $missionFolder
}

function Copy-Paradigm {
    param (
        [string]$missionFolder
    )
    Copy-Item -Recurse -Path "paradigm" -Destination $missionFolder
    Copy-Item -Path "para_*.sqf" -Destination $missionFolder
}

function Copy-ParadigmConfig {
    param (
        [string]$missionFolder
    )
    Copy-Item -Recurse -Path "config" -Destination $missionFolder
}

function Copy-CustomFunctions {
    param (
        [string]$missionFolder
    )
    Copy-Item -Recurse -Path "FirstCAV" -Destination $missionFolder
}

function Pack-Missions {
    # Pack the mission(s)
    Set-Location -Path $buildFolder

    foreach ($map in $supportedMaps) {
        $mapFolder = "$missionName.$map"
        Write-Host "Packing build/$mapFolder.pbo"
        & $pboTool pack $mapFolder "$mapFolder.pbo"
        Write-Host "Creating build/$mapFolder.zip"
        & $zipTool -r "$mapFolder.zip" $mapFolder
    }
    Set-Location -Path $cwd
}

function Update-GitSubmodules {
    # if the .submodules-updated file exists, quietly exit this function and continue the script
    if (Test-Path (Join-Path -Path $cwd -ChildPath ".submodules-updated")) {
        return
    }
    # Update git submodules
    git submodule update --init --recursive
    New-Item -ItemType File -Path (Join-Path -Path $cwd -ChildPath ".submodules-updated")
}

function Test-SkipScripts {
    param (
        [string]$missionFolder
    )
    $scriptFlag = Join-Path -Path $missionFolder -ChildPath ".skip-scripts"
    return (Test-Path $scriptFlag)
}

# Main function
function Main {
    Update-GitSubmodules
    Setup-BuildFolder
    Pack-Missions
}

# Run the main function
Main