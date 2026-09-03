function prf {
    param (
        [string]$Message
    )
    $color = "`e[38;5;99m"
    $reset = "`e[0m"
    Write-Host "${color}${Message}${reset}"
}


prf "LSP Installer"


$lsps = @(
  @{ Name="Lua";        Id="LuaLS.lua-language-server" },
  @{ Name="Markdown";   Id="artempyanykh.marksman" }
)

foreach ($lsp in $lsps) {
  prf "Installing $($lsp.Name)..."
  winget install --id $lsp.Id --silent --accept-source-agreements --accept-package-agreements
}


# Reload Path
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

if (Get-Command uv -ErrorAction SilentlyContinue) {
  prf "Installing pyright"
  uv tool install pyright

} else {
  prf "pyright omitted, uv is not installed"
}


prf "Finished"
