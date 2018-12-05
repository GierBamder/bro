event bro_init() 
{
 #networks and IPs
 local a: addr = 192.168.1.1;
 local b = 127.0.0.1;
 local sn: subnet = 192.168.2.1/24;
 local sn1: subnet = 192.168.1.0/16;
 local sn2: subnet = 192.168.0.0/24;
 
 print a;
 print b;
 print sn;
 print sn1;
 
 print 192.168.1.1 in sn2; # false
 print 192.168.1.1 in sn1; # true
 print 192.168.1.1 !in sn2; # true
}
