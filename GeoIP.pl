#!/usr/bin/perl

use Socket;
use Term::ANSIColor;
use WWW::Mechanize;
use JSON;
  

print color 'bold bright_yellow';

print q{
       _  _  _                           _____         _  _  _                  
    _ (_)(_)(_) _                    ,-:` \;',`'-     (_)(_)(_)                 
   (_)         (_)  _  _  _  _     .'-;_,;  ':-;_,'.     (_)    _  _  _  _      
   (_)    _  _  _  (_)(_)(_)(_)_  /;   '/    ,  _`.-\    (_)   (_)(_)(_)(_)_    
   (_)   (_)(_)(_)(_) _  _  _ (_)| '`. (`     /` ` \`|   (_)   (_)        (_)   
   (_)         (_)(_)(_)(_)(_)(_)|:.  `\`-.   \_   / |   (_)   (_)        (_)   
   (_) _  _  _ (_)(_)_  _  _  _  |     (   `,  .`\ ;'| _ (_) _ (_) _  _  _(_)   
      (_)(_)(_)(_)  (_)(_)(_)(_)  \     | .'     `-'/ (_)(_)(_)(_)(_)(_)(_)     
                                   `.   ;/        .'           (_)         @h4ckzu5
                                     `'-._____.-'`             (_)              
                                                               (_)              
};
 

@iphost=$ARGV[0] || die "Usage:  ./GeoIP.pl  216.58.210.206\nEjemplo: ./GeoIP.pl [host] [ip] [domain] \n\n";
my @ip = inet_ntoa(scalar gethostbyname("@iphost")or die "IP or Host invalid!\n");
my @hn = scalar gethostbyaddr(inet_aton(@ip),AF_INET);
 
my $GET=WWW::Mechanize->new();
    $GET->get("http://ip-api.com/json/@ip"); 
    my $json = $GET->content();
 
 
my $info = decode_json($json);
print color 'red'; 
print "  [+] Locate: ", $info->{'query'}, "\n\n";

print color 'green'; 
print "  [!] ORG: ", $info->{'as'}, "\n";
print "  [!] ISP: ", $info->{'isp'}, "\n";
print "  [!] Country: ", $info->{'country'}," - ", $info->{'countryCode'}, "\n";
print "  [!] City: ", $info->{'city'}, "\n";
print "  [!] Region: ", $info->{'regionName'}, " - " , $info->{'region'}, "\n";
print "  [!] Geo: ", "Lat: " , $info->{'lat'}, " - Long: ", $info->{'lon'}, "\n";
print "  [!] Geo: ", "Latitude: " , $info->{'lat'}, " - Long: ", $info->{'lat'}, "\n";
print "  [!] Time: ", "timezone: " , $info->{'timezone'}, " - Long: ", $info->{'timezone'}, "\n";
print "  [!] As number/name: ", "as: " , $info->{'as'}, " - Long: ", $info->{'as'}, "\n";
print "  [!] ORG: ", $info->{'as'}, "\n";
print "  [!] Country code: ", $info->{'countryCode'}, "\n"; 
print "  [!] Status: ", $info->{'status'}, "\n"; 
print "\n";
