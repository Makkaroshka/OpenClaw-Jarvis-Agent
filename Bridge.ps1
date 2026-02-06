#!/bin/bash
# Финальная рабочая версия Bridge для WSL
PS_EXE="/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"

if [ -z "$1" ]; then
  echo "Usage: ./Bridge.ps1 \"PowerShell-Command\""
  exit 1
fi

$PS_EXE -NoProfile -NonInteractive -ExecutionPolicy Bypass -Command "$1"
