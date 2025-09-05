# Script para criar pastas em um caminho executado
# Autor: Rian Zanini Lascasas de Gouvêia
# Data: 05/09/2025

# Pergunta apenas o mês/ano
$mes = (Read-Host "`nDigite o mes e ano (ex: JANEIRO 2025)").Trim()

Write-Host "`nBuscando pastas modificadas hoje...`n"
Start-Sleep -Seconds 2

# Pega todas as pastas do diretório atual modificadas hoje
$destinos = Get-ChildItem -Directory | Where-Object { $_.LastWriteTime.Date -eq (Get-Date).Date }

Write-Host "`nPastas modificadas hoje encontradas: $($destinos.Count)`n"

Write-Host "`nCriando pasta do mes...`n"
Start-Sleep -Seconds 2

foreach ($d in $destinos) {
    $novoDestino = Join-Path $d.FullName $mes

    if (-not (Test-Path $novoDestino)) {
        New-Item -ItemType Directory -Path $novoDestino | Out-Null
        Write-Host "`nCriado em $($d.FullName)`n"
    }
    else {
        Write-Host "`nJa existe em $($d.FullName) → ignorado`n"
    }
}

Write-Host "`nPastas criadas com sucesso!`n"



