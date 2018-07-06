if ($args.length -gt 0) {
	$validcolors = [enum]::GetValues([System.ConsoleColor])
	$c = $args[0]
	if (-not ($c -in $validcolors)) {
		write-error "Unknown color: $($c), here are the valid colors..."
		$validcolors | Foreach-Object {Write-Host $_ -ForegroundColor $_}
		$c = $null
	}
}

#get-content bike.txt | foreach {
#	$line=$_
$longest=0
foreach ($line in (get-content bike.txt)) {
	if ($line.length -gt $longest) {
		$longest=$line.length
	}
}

$sbuf = ''
for ($i=0;$i -lt $longest;$i++) {
	$sbuf += ' '
}

if (test-path ./mirror-bike.txt) {del mirror-bike.txt}
foreach ($line in (get-content bike.txt)) {
	$line = ($line+$sbuf)
	$line = $line.substring(0,$longest)
	$la = $line.ToCharArray()
	[array]::Reverse($la)
	$ml = -join $la
	#$ml
	$ml | add-content mirror-bike.txt
}

get-content mirror-bike.txt | foreach {
	if ($c) {
		write-host -foregroundcolor $c  $_
	} else {
		write-host $_
	}
}
