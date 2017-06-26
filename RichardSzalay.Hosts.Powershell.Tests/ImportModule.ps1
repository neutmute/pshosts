# The Psake build imports the module before running Pester, but this allows the Debug build to run from (for example) VS Code
if (-not ((get-module pshosts) | ?{ $_.Prefix -eq "Test" })) {
    Remove-Module pshosts -ErrorAction SilentlyContinue
    Import-Module "$PSScriptRoot\..\RichardSzalay.Hosts.Powershell\bin\Debug\PsHosts.psd1" -Prefix Test -Force
}