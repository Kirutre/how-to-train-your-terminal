# Alias
if (Test-Path Alias:ls) { Remove-Item Alias:ls -Force }

function ls { eza --icons --group-directories-first --git $args }
function ll { eza -l --icons --group-directories-first --git $args }
function la { eza -a --icons --group-directories-first --git $args }

function cat { bat --style=plain --paging=never $args }

function en-venv { .venv/Scripts/Activate.ps1 }


# Custom Commands
function rs-dc {
    docker compose down
    cls
    docker compose watch
}


# Tools
Invoke-Expression (& {
    $hook = zoxide init powershell | Out-String
    $hook
})


# Starship
Invoke-Expression (&starship init powershell)
