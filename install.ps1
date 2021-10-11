
$profile_folder = Resolve-Path -Path "$profile\.."
$script_folder = Resolve-Path -Path "${profile_folder}\Scripts"
$dsuite = "${profile_folder}\dsuite_profile.ps1"


# Create default profile file
Write-Output '#requires -version 5' > $dsuite
Write-Output '' >> $dsuite

# Add docker alias file
Copy-Item "$PSScriptRoot\docker-alias.ps1" "${script_folder}\docker-alias.ps1"
Write-Output '# Include docker alias' >> $dsuite
Write-Output ". `"${script_folder}\docker-alias.ps1`"" >> $dsuite
Write-Output '' >> $dsuite

# Add docker alpine alias file
Copy-Item "$PSScriptRoot\docker-alpine-alias.ps1" "${script_folder}\docker-alpine-alias.ps1"
Write-Output '# Include docker alpine alias' >> $dsuite
Write-Output ". `"${script_folder}\docker-alpine-alias.ps1`"" >> $dsuite
Write-Output '' >> $dsuite

# Add docker git alias file
Copy-Item "$PSScriptRoot\docker-git-alias.ps1" "${script_folder}\docker-git-alias.ps1"
Write-Output '# Include docker git alias' >> $dsuite
Write-Output ". `"${script_folder}\docker-git-alias.ps1`"" >> $dsuite
Write-Output '' >> $dsuite

# Add docker golang alias file
Copy-Item "$PSScriptRoot\docker-golang-alias.ps1" "${script_folder}\docker-golang-alias.ps1"
Write-Output '# Include docker golang alias' >> $dsuite
Write-Output ". `"${script_folder}\docker-golang-alias.ps1`"" >> $dsuite
Write-Output '' >> $dsuite

# Add docker maven alias file
Copy-Item "$PSScriptRoot\docker-maven-alias.ps1" "${script_folder}\docker-maven-alias.ps1"
Write-Output '# Include docker maven alias' >> $dsuite
Write-Output ". `"${script_folder}\docker-maven-alias.ps1`"" >> $dsuite
Write-Output '' >> $dsuite

# Add docker node alias file
Copy-Item "$PSScriptRoot\docker-node-alias.ps1" "${script_folder}\docker-node-alias.ps1"
Write-Output '# Include docker node alias' >> $dsuite
Write-Output ". `"${script_folder}\docker-node-alias.ps1`"" >> $dsuite
Write-Output '' >> $dsuite

# Add docker portainer alias file
Copy-Item "$PSScriptRoot\docker-portainer.ps1" "${script_folder}\docker-portainer.ps1"
Write-Output '# Include docker portainer alias' >> $dsuite
Write-Output ". `"${script_folder}\docker-portainer.ps1`"" >> $dsuite
Write-Output '' >> $dsuite

# Add dsuite profil
Write-Output "" >> $profile
Write-Output "# Include dsuite profile" >> $profile
Write-Output ". `"$dsuite`"" >> $profile
