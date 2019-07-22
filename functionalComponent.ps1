param(
  [parameter(Mandatory = $true, Position = 0)]
  [Alias("Name")]
  [string]$ComponentName,
  [parameter(Position = 1)]
  [Alias("Path")]
  [string]$DestinationPath
)

# get name of component
# $name = $name.ToLower()
$name = $ComponentName -replace "\s+", "-"
$invalid = [System.IO.Path]::GetInvalidFileNameChars()
$regex = "[$([Regex]::Escape($invalid))]"
$name = $name -replace $regex, ""

# get path and file name
$path = $pwd
if ($DestinationPath) {
  $path = $DestinationPath
}
$fileName = "${name}.tsx"
$filePath = Join-Path $path $fileName
if (Test-Path $filePath) {
  throw "$fileName already exists"
}

# if folder doesn't exist make folder
if (!(Test-Path $path)) {
  Write-Output "Creating $path directory"
  New-Item -ItemType Directory -Force -Path $path
}

Write-Output "Creating react file at $filePath";
$content = @"
import * as classNames from 'classnames';
import * as React from 'react';
import styles from './${name}.modules.scss';

export interface I${name}Props {

}

export const ${name}: React.FunctionComponent<I${name}Props> = ({

}) => {
  return (
    <div className={classNames(styles.${name})}>

    </div>
  );
};

export default ${name};
"@
# Create file with content
Set-Content -Path $filePath -Value $content

$fileNameStyles = "$name.modules.scss"
$filePathStyles = Join-Path $path $fileNameStyles
if (!(Test-Path $filePathStyles -PathType "Leaf")) {
  Write-Output "Createing sass file at $filePathStyles"

  # lowercase first character
  $selectorNameStyles = $name.Substring(0, 1).ToLower() + $name.Substring(1)
  $contentStyles = @"
.${selectorNameStyles} {
  display: block;
}
"@
  Set-Content -Path $filePathStyles -Value $contentStyles
}
else {
  Write-Output "$filePathStyles already exists."
}
Write-Output "Process Complete"