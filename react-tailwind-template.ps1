# SCRIPT PARA INICIAR UN PROYECTO REACT CON TAILWIND Y ELIMINAR ARCHIVOS INNECESARIOS

if (-not $args.Count -gt 0) {
  $mensaje = "Debe a" + [char]0x00F1 + "adir el nombre del proyecto"
  Write-Host $mensaje
  Exit
}

# Variables
$appName = $args[0].ToLower()
$templateFiles = $PSScriptRoot + '\template-files'

# Crear App con create-react-app
npx create-react-app $appName

# Cambiar al directorio del proyecto
Set-Location $appName

# Obtengo directorio actual
$currentPath = Get-Location

# Instalar Tailwind CSS
npm install -D tailwindcss

# Crear el archivo de configuración de Tailwind
npx tailwindcss init

# Eliminar carpetas src y public
Remove-Item -Path $currentPath\src, $currentPath\public -Recurse -Force

# Copiar los archivos y carpetas del template
Copy-Item -Path $templateFiles\* -Destination $currentPath -Recurse -Force

# Mensaje de ejecución completada
Write-Host "Instalación finalizada correctamente!"