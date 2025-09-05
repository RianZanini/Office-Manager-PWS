# Script para mover arquivos de backup 
# Autor: Rian Zanini Lascasas de Gouvêia
# Data: 05/09/2025

# Obtém o diretório onde o script está sendo executado
$pastaOrigem = $PSScriptRoot

# Define a pasta de destino como uma subpasta "BACKUPS" no diretório atual
$pastaDestino = Join-Path -Path $pastaOrigem -ChildPath "BACKUPS"

# Configurar a codificação de saída para UTF-8 para evitar problemas com caracteres especiais
$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "`nScript de movimentacao de arquivos de backup`n" -ForegroundColor Cyan
Write-Host "Pasta de origem: $pastaOrigem" -ForegroundColor Yellow
Write-Host "Pasta de destino: $pastaDestino" -ForegroundColor Yellow
Write-Host ""

# Verifica se a pasta de destino existe, se não, cria
if (-not (Test-Path -Path $pastaDestino)) {
    try {
        Write-Host "`nCriando pasta de destino...`n" -ForegroundColor Green
        New-Item -ItemType Directory -Path $pastaDestino -Force -ErrorAction Stop | Out-Null
        Write-Host "`nPasta de destino criada: $pastaDestino`n" -ForegroundColor Green
    }
    catch {
        Write-Host "`nErro ao criar pasta de destino: $($_.Exception.Message)`n" -ForegroundColor Red
        Write-Host "`nTentando criar pasta local alternativa...`n" -ForegroundColor Yellow
        
        # Tenta uma pasta alternativa no diretório temporário do usuário
        $pastaDestino = Join-Path -Path $env:TEMP -ChildPath "BACKUPS"
        New-Item -ItemType Directory -Path $pastaDestino -Force | Out-Null
        Write-Host "`nPasta alternativa criada: $pastaDestino`n" -ForegroundColor Green
    }
}

# Busca por arquivos que começam com "Backup" na pasta de origem
try {
    Write-Host "`nBuscando arquivos com o padrao 'Backup*'...`n" -ForegroundColor Green
    $arquivos = Get-ChildItem -Path $pastaOrigem -File -ErrorAction Stop | Where-Object { $_.Name -like "Backup*" }
    
    if ($arquivos.Count -eq 0) {
        Write-Host "`nNenhum arquivo encontrado com o padrao 'Backup*' em $pastaOrigem`n" -ForegroundColor Yellow
        exit
    }
    
    Write-Host "`nEncontrados $($arquivos.Count) arquivo(s) para mover:`n" -ForegroundColor Green
    
    # Exibe mensagem de aviso antes de começar a mover os arquivos
    Write-Host "`nMovendo arquivos Backup...`n" -ForegroundColor Magenta
    Start-Sleep -Seconds 2  # Pausa de 2 segundos
    
    # Move cada arquivo encontrado
    $contador = 0
    foreach ($arquivo in $arquivos) {
        $caminhoDestino = Join-Path -Path $pastaDestino -ChildPath $arquivo.Name
        
        try {
            Write-Host "`nMovendo: $($arquivo.Name) ...`n" -ForegroundColor White
            Move-Item -Path $arquivo.FullName -Destination $caminhoDestino -Force -ErrorAction Stop
            Write-Host "`nMovido com sucesso: $($arquivo.Name)`n" -ForegroundColor Green
            $contador++
        }
        catch {
            Write-Host "`nErro ao mover $($arquivo.Name): $($_.Exception.Message)`n" -ForegroundColor Red
        }
    }
    
    Write-Host "`nOperacao concluida com sucesso! $contador arquivo(s) movidos.`n" -ForegroundColor Green
}
catch {
    Write-Host "`nErro ao buscar arquivos: $($_.Exception.Message)`n" -ForegroundColor Red
}

# Mensagem final com informações
Write-Host "`nResumo da operacao:`n" -ForegroundColor Cyan
Write-Host "Pasta de origem: $pastaOrigem" -ForegroundColor White
Write-Host "Pasta de destino: $pastaDestino" -ForegroundColor White
Write-Host "Arquivos movidos: $contador" -ForegroundColor White

Start-Sleep -Seconds 2

# Aguarda entrada do usuário antes de fechar (apenas se executado diretamente)
if ($Host.Name -eq "ConsoleHost") {
    Write-Host "`nPressione qualquer tecla para continuar..." -ForegroundColor Gray
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null
}