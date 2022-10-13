set ns [new Simulator]

set f [open wired3_1cbr.tr w]
$ns trace-all $f

set nf [open wired3_1cbr.nam w]
$ns namtrace-all $nf

proc finish {} {
global ns f
$ns flush-trace
close $f
exit 0
}

set s1 [$ns node]
set s2 [$ns node]
set s3 [$ns node]
set G [$ns node]
set r [$ns node]

$ns duplex-link $s1 $G 1Mb 10ms DropTail
$ns duplex-link $s2 $G 1Mb 10ms DropTail
$ns duplex-link $s3 $G 1Mb 10ms DropTail
$ns duplex-link $G $r 1Mb 10ms SFQ

set udp1 [new Agent/UDP]
$udp1 set class_ 1
$ns attach-agent $s1 $udp1

set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 500
$cbr0 set interval_ 0.005
$cbr0 attach-agent $udp1

set udp2 [new Agent/UDP]
$udp2 set class_ 2
$ns attach-agent $s2 $udp2

set cbr1 [new Application/Traffic/CBR]
$cbr1 set packetSize_ 500
$cbr1 set interval_ 0.005
$cbr1 attach-agent $udp2

set udp3 [new Agent/UDP]
$udp3 set class_ 3
$ns attach-agent $s3 $udp3

set cbr2 [new Application/Traffic/CBR]
$cbr2 set packetSize_ 500
$cbr2 set interval_ 0.005
$cbr2 attach-agent $udp3

set null0 [new Agent/Null]
$ns attach-agent $r $null0

$ns connect $udp1 $null0
$ns connect $udp2 $null0
$ns connect $udp3 $null0

$ns at 0.5 "$cbr0 start"
$ns at 1.0 "$cbr1 start"
$ns at 1.5 "$cbr2 start"
$ns at 3.5 "$cbr2 stop"
$ns at 4.0 "$cbr1 stop"
$ns at 4.5 "$cbr0 stop"
$ns at 5.25 "finish"
$ns run
