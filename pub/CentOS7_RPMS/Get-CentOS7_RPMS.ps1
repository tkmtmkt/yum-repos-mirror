<#
.SYNOPSIS
CentOS リポジトリデータダウンロード
#>
param(
  [Parameter(Mandatory=$true)]
  [ValidateSet("os", "updates", "extras", "epel")]
  [string]$repos
)
$src = "http://www11234ui.sakura.ne.jp/pub/CentOS7_RPMS/$repos"
$dst = "$Home\Downloads\CentOS7_RPMS/$repos"

$list = (wget $src/files.txt).Content.Split("`r*`n")
$count = $list.Count
$index = 1
$list | %{
  Write-Progress -Activity "CentOS7 RPMS" -Status "($index/$count) $_" -PercentComplete (100.0 * $index / $count)

  $dir = Split-Path "$dst\$_"
  if (!(Test-Path $dir)) { md -fo $dir }

  Start-BitsTransfer "$src/$_" "$dst\$_"
  $index++
}
