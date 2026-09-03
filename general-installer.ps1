function prf {
    param (
        [string]$Message
    )
    $color = "`e[38;5;99m"
    $reset = "`e[0m"
    Write-Host "${color}${Message}${reset}"
}


prf "Tools Installer"


$apps = @(
  @{ Name="Bat";          Id="sharkdp.bat" },
  @{ Name="Eza";          Id="eza-community.eza" },
  @{ Name="Fastfetch";    Id="Fastfetch-cli.Fastfetch" },
  @{ Name="Fresh";        Id="fresh-editor" },
  @{ Name="Fzf";          Id="junegunn.fzf" },
  @{ Name="Git";          Id="Git.Git" },
  @{ Name="Python";       Id="Python.Python.3" },
  @{ Name="Starship";     Id="Starship.Starship" },
  @{ Name="Uv";           Id="astral-sh.uv" },
  @{ Name="Zoxide";       Id="ajeetdsouza.zoxide" }
)

foreach ($app in $apps) {
  prf "Installing $($app.Name)..."
  winget install --id $app.Id --silent --accept-source-agreements --accept-package-agreements
}


prf "Finished"
