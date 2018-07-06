if ($args.length -gt 0) {
	$validcolors = [enum]::GetValues([System.ConsoleColor])
	$c = $args[0]
	if (-not ($c -in $validcolors)) {
		write-error "Unknown color: $($c), here are the valid colors..."
		$validcolors | Foreach-Object {Write-Host $_ -ForegroundColor $_}
		$c = $null
	}
}
$bike = cmd.exe /c build-bike
foreach ($b in $bike) {
	if ($c) {
		write-host -foregroundcolor $c  $b
	} else {
		write-host $b
	}
}