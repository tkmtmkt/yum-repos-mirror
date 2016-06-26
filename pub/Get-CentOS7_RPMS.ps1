<#
.SYNOPSIS
CentOS リポジトリデータダウンロード
#>
$src = "http://www11234ui.sakura.ne.jp/pub/CentOS7_RPMS"
$dst = "$Home\Downloads\CentOS7_RPMS"

$count = (cat files.txt).count
$index = 1
cat files.txt | %{
  Write-Progress -Activity "CentOS7 RPMS" -Status "($index/$count) $_" -PercentComplete (100.0 * $index / $count)

  $dir = Split-Path "$dst\$_"
  if (!(Test-Path $dir)) { md -fo $dir }

  Start-BitsTransfer "$src/$_" "$dst\$_"
  $index++
}
