event bro_init()
{
 #ports
 local http: port = 80/tcp;
 local ssh = 22/tcp;
 local dns = 53/udp;
 local itype = 21/icmp;
 local unknown = 80/unknown;
 
 print http;
 print ssh;   
 print dns;
 print itype;
 print unknown;
}

