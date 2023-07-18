# Caminho e valor para o MachineGuid
$regPath1 = "HKLM:\SOFTWARE\Microsoft\Cryptography"
$regValue1 = "MachineGuid"
$newValue1 = [guid]::NewGuid()
echo "`nValor aleatorio a ser definido para "$regValue1": "$newValue1

# Alterando o valor do MachineGuid
Set-ItemProperty -Path $regPath1 -Name $regValue1 -Value $newValue1

# Caminho e valor para o HwProfileGuid
$regPath2 = "HKLM:\SYSTEM\CurrentControlSet\Control\IDConfigDB\Hardware Profiles\0001"
$regValue2 = "HwProfileGuid"
$newValue2 = "{"+[guid]::NewGuid()+"}"
echo "`nValor aleatorio a ser definido para "$regValue2": "$newValue2

Pause

# Alterando o valor do HwProfileGuid
Set-ItemProperty -Path $regPath2 -Name $regValue2 -Value $newValue2

echo "`n`n`n"$regValue1" alterado para: "$newValue1
echo $regValue2" alterado para: "$newValue2

Write-Host "`n`nValores do Registro atualizados com sucesso!"

Pause