get-content bike.txt | foreach {
	$b = $_.ToCharArray()
	[array]::Reverse($b)
	-join($b)
} > mirrorbike.txt
type mirrorbike.txt