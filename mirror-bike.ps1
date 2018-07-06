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
get-content mirror-bike.txt
