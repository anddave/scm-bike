$c=$args[0]
get-content bike.txt | foreach {write-host -foregroundcolor $c  $_}
