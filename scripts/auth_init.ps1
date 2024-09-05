$projectRoot = Split-Path -Parent $PSScriptRoot
. $projectRoot/scripts/load_azd_env.ps1

if (-not $env:AZURE_USE_AUTHENTICATION) {
  Exit 0
}

. $projectRoot/scripts/load_python_env.ps1

$venvPythonPath = "./.venv/scripts/python.exe"
if (Test-Path -Path "/usr") {
  # fallback to Linux venv path
  $venvPythonPath = "./.venv/bin/python"
}

Start-Process -FilePath $venvPythonPath -ArgumentList "$projectRoot/scripts/auth_init.py" -Wait -NoNewWindow
