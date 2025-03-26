#!/bin/bash

# Az packages for powershell
sudo pwsh -C Install-Module Az.Accounts -Repository PSGallery -Force
sudo pwsh -C Install-Module Az.Resources -Repository PSGallery -Force
sudo pwsh -C Install-Module Az.KeyVault -Repository PSGallery -Force
sudo pwsh -C Install-Module -Name powershell-yaml -Force
