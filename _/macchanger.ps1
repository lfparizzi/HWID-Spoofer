# Obtém todos os adaptadores de rede
$adaptadores = Get-NetAdapter | Select-Object Name, MacAddress

# Exibe a lista de adaptadores disponíveis
Write-Host "Adaptadores de rede:"
$indice = 1
$adaptadores | ForEach-Object {
    Write-Host "$indice. $($_.Name) - $($_.MacAddress)"
    $indice++
}

# Solicita ao usuário que escolha um adaptador
$escolha = Read-Host "Digite o número do adaptador que deseja alterar o MAC address"

# Valida a entrada do usuário
if ($escolha -lt 1 -or $escolha -gt $adaptadores.Count) {
    Write-Host "Escolha inválida. O script será encerrado."
    Exit
}

# Obtém o adaptador selecionado
$adaptadorSelecionado = $adaptadores[$escolha - 1]

# Gera um novo endereço MAC aleatório
$novoMac = [string]::Empty
$rand = New-Object System.Random
1..12 | ForEach-Object {
    $novoMac += $rand.Next(0, 16).ToString("X")
    if ($_ % 2 -eq 0 -and $_ -ne 12) {
        $novoMac += "-"
    }
}

# Altera o endereço MAC do adaptador selecionado
Set-NetAdapter -Name $adaptadorSelecionado.Name -MacAddress $novoMac

Write-Host "O endereço MAC do adaptador $($adaptadorSelecionado.Name) foi alterado para: $novoMac"