# Lire le fichier JSON
$params = Get-Content -Path "params.json" | ConvertFrom-Json

# Accéder aux paramètres
$Param1 = $params.repertoire

# Afficher les paramètres
Write-Output "Param1: $repertoire"

# Afficher les éléments de la liste Param1
foreach ($item in $Param1) {
	
Write-Output "Param1 item: $item"


# Obtenir tous les fichiers dans le répertoire de manière récursive et les renommer
Get-ChildItem -Path $item -File -Recurse | ForEach-Object {
    $newName = $_.Name -replace '_', ' '
    if ($newName -ne $_.Name) {
        $newPath = Join-Path -Path $_.DirectoryName -ChildPath $newName
        Rename-Item -Path $_.FullName -NewName $newPath
    }
}

			
}