# Office-Manager-PWS
Scripts de organização de arquivos em escritório. Salvamento de arquivos Backup em pasta de backup automaticamente.

Script PowerShell para automatizar a organização de arquivos de backup movendo-os para uma pasta dedicada.

## 📋 Funcionalidades

- Identifica automaticamente arquivos que começam com "Backup" no nome
- Move os arquivos para uma pasta de backup dedicada
- Tratamento de erros robusto para diferentes cenários
- Interface colorida para melhor experiência do usuário
- Suporte a caracteres especiais e caminhos de rede

## 🚀 Como Usar

### Pré-requisitos
- Windows 7 ou superior
- PowerShell 3.0 ou superior

### Instalação
1. Faça o download do script `move_backups.ps1` e `criar_mes.ps1`
2. Coloque o script na pasta onde estão seus arquivos de backup

### Execução
1. Clique com o botão direito no arquivo `.ps1`
2. Selecione "Executar com PowerShell"
3. Ou execute manualmente:
   ```powershell
   .\Move-BackupFiles.ps1

/pasta-com-arquivos-backup/
│
├── Move-BackupFiles.ps1    # Script principal
├── Backup1.txt             # Arquivo de backup exemplo
├── Backup2.pdf             # Arquivo de backup exemplo
└── BACKUPS/                # Pasta criada automaticamente
    ├── Backup1.txt         # Arquivos movidos
    └── Backup2.pdf         # Arquivos movidos

### Execução do 2º script
Antes:
/diretório-raiz/
├── ClienteA/
├── ClienteB/
├── ProjetoX/
└── OrganizadorPastas.ps1

Depois:
/diretório-raiz/
├── ClienteA/
│   └── JANEIRO 2025/
├── ClienteB/
│   └── JANEIRO 2025/
├── ProjetoX/
│   └── JANEIRO 2025/
└── OrganizadorPastas.ps1

### Copyright (c) 2025 Rian Zanini Lascasas de Gouvêia

Permissão é concedida, gratuitamente, a qualquer pessoa que obtenha uma cópia
deste software e dos arquivos de documentação associados (o "Software"), para tratar
no Software sem restrição, incluindo, sem limitação, os direitos de usar, copiar, modificar,
fundir, publicar, distribuir, sublicenciar e/ou vender cópias do Software, e para
permitir que as pessoas a quem o Software é fornecido o façam, sob as seguintes condições:

O aviso de copyright acima e este aviso de permissão devem ser incluídos em todas
as cópias ou partes substanciais do Software.

O SOFTWARE É FORNECIDO "COMO ESTÁ", SEM GARANTIA DE QUALQUER TIPO, EXPRESSA OU
IMPLÍCITA, INCLUINDO, MAS NÃO SE LIMITANDO A GARANTIAS DE COMERCIALIZAÇÃO,
ADEQUAÇÃO A UM DETERMINADO FIM E NÃO VIOLAÇÃO. EM NENHUMA HIPÓTESE OS AUTORES OU
TITULARES DOS DIREITOS AUTORAIS SERÃO RESPONSÁVEIS POR QUALQUER REIVINDICAÇÃO,
DANOS OU OUTRA RESPONSABILIDADE, SEJA EM AÇÃO DE CONTRATO, DELITO OU DE OUTRA FORMA,
DECORRENTE DE, FORA DE OU EM CONEXÃO COM O SOFTWARE OU O USO OU OUTRAS NEGOCIAÇÕES NO
SOFTWARE.
