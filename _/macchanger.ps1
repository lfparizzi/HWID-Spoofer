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
$escolha = Read-Host "Digite o numero do adaptador que deseja alterar o MAC address"

# Valida a entrada do usuário
if ($escolha -lt 1 -or $escolha -gt $adaptadores.Count) {
    Write-Host "Escolha invalida. O script será encerrado."
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

Write-Host "----------------------------------------------------------------------------------------------------------------"
Write-Host "`nO endereco MAC do adaptador $($adaptadorSelecionado.Name) foi alterado com sucesso para: $novoMac`n"
Write-Host "IMPORTANTE: Reinicie seu computador pois a alteracao do ID do HD somente sera efetivada apos o sistema reiniciar"
Write-Host "FIM DO SCRIPT DE TROCA DE HWID, APERTE ENTER E DEPOIS REINICIE O COMPUTADOR NA SEQUENCIA!`n"
Write-Host "----------------------------------------------------------------------------------------------------------------"