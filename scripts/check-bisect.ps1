$status = Get-Content (Join-Path $PSScriptRoot '..\src\bisect-demo.txt') -TotalCount 1
if ($status -eq 'BUG') {
    exit 1
}
if ($status -eq 'GOOD') {
    exit 0
}
exit 125
