set ns [new Simulator]

set f [open mesh.tr w]
$ns trace-all $f

set nf [open mesh.nam w] 
$ns namtrace-all $nf

proc finish {} {
global ns f
$ns flush-trace
close $f
exit 0
}

proc finish {} {
global ns nf
$ns flush-trace
close $nf
exec nam mesh.nam &
exit 0
}

set n0 [$ns node] 
set n1 [$ns node] 
set n2 [$ns node] 
set n3 [$ns node]

$ns duplex-link $n0 $n1 1Mb 10ms DropTail
$ns duplex-link $n0 $n2 1Mb 10ms DropTail
$ns duplex-link $n0 $n3 1Mb 10ms DropTail
$ns duplex-link $n1 $n2 1Mb 10ms DropTail
$ns duplex-link $n1 $n3 1Mb 10ms DropTail
$ns duplex-link $n2 $n3 1Mb 10ms DropTail

set tcp0 [new Agent/TCP]
$tcp0 set class_ 1
$ns attach-agent $n1 $tcp0

set sink0 [new Agent/TCPSink]
$ns attach-agent $n3 $sink0

set tcp1 [new Agent/TCP]
$tcp1 set class_ 2
$ns attach-agent $n0 $tcp1

set sink1 [new Agent/TCPSink]
$ns attach-agent $n3 $sink1

set tcp2 [new Agent/TCP]
$tcp2 set class_ 3
$ns attach-agent $n3 $tcp2

set sink2 [new Agent/TCPSink]
$ns attach-agent $n2 $sink2

$ns connect $tcp0 $sink0
$ns connect $tcp1 $sink1
$ns connect $tcp2 $sink2

set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 500
$cbr0 set interval_ 0.01
$cbr0 attach-agent $tcp0

set cbr1 [new Application/Traffic/CBR]
$cbr1 set packetSize_ 500
$cbr1 set interval_ 0.01
$cbr1 attach-agent $tcp1

set cbr2 [new Application/Traffic/CBR]
$cbr2 set packetSize_ 500
$cbr2 set interval_ 0.01
$cbr2 attach-agent $tcp2

$ns at 0.5 "$cbr0 start"
$ns at 1 "$cbr1 start"
$ns at 1.5 "$cbr2 start"
$ns at 3.5 "$cbr2 stop"
$ns at 4 "$cbr1 stop"
$ns at 4.5 "$cbr0 stop"
$ns at 5.0 "finish"
$ns run
