# This script assembles the folder structure for the mission file. It will then attempt to detect what PBO tool is available and use that to pack the mission file.

# Global variables
$missionName = "2nd-platoon-private-zeus-nam"
$supportedMaps = @("Cam_Lao_Nam")
$missionFolders = @()
foreach ($map in $supportedMaps) {
    $missionFolders += "$missionName.$map"
}

# Create temp folder
$tempFolder = New-Item -ItemType Directory -Path ([System.IO.Path]::GetTempPath() + [System.Guid]::NewGuid().ToString())

# Function to set up the temporary folder
function Setup-TempFolder {
    param (
        [string]$tempFolder,
        [array]$missionFolders
    )

    foreach ($mapFolder in $missionFolders) {
        # If the source mission folder does not exist, continue the loop, skipping this mission.map combo
        if (-Not (Test-Path -Path $mapFolder -PathType Container)) {
            Write-Output "Skipping $mapFolder as it does not exist."
            continue
        }

        $targetFolder = Join-Path -Path $tempFolder -ChildPath $mapFolder

        # If the target folder exists, remove it
        if (Test-Path -Path $targetFolder -PathType Container) {
            Remove-Item -Recurse -Force -Path $targetFolder
        }

        Copy-Item -Recurse -Path $mapFolder -Destination $tempFolder
        Copy-Item -Recurse -Path "FirstCAV" -Destination $targetFolder
        Copy-Item -Recurse -Path "config" -Destination $targetFolder
        Copy-Paradigm -missionFolder $targetFolder
    }
}

# Function to copy the paradigm folder
function Copy-Paradigm {
    param (
        [string]$missionFolder
    )
    Copy-Item -Recurse -Path "paradigm" -Destination $missionFolder
}

# Main function
function Main {
    Setup-TempFolder -tempFolder $tempFolder -missionFolders $missionFolders
    Write-Output "Temp folder: $tempFolder"
}

# Run the main function
Main