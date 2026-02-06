# TOOL INSTRUCTION: WINDOWS BRIDGE

## Description

A PowerShell wrapper script located at `~/openclaw/Bridge.ps1`. Use this to execute ANY PowerShell command on the host Windows machine from within WSL.

## Usage Syntax

To run a PowerShell command, execute:
`./Bridge.ps1 "Your-PowerShell-Command-Here"`

## Examples

- **Get Windows System Info:**
  `./Bridge.ps1 "Get-ComputerInfo | Select-Object WindowsProductName, OsVersion"`

- **Check Running Windows Processes:**
  `./Bridge.ps1 "Get-Process | Where-Object { $_.ProcessName -like '*chrome*' }"`

- **Open a URL in Windows Browser:**
  `./Bridge.ps1 "Start-Process 'https://twitter.com'"`

## FORBIDDEN

- DO NOT use `powershell.exe -Command` directly. Always route through `Bridge.ps1` to handle encoding and arguments correctly.
