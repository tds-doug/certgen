#!/usr/bin/perl -w

use strict;

my $csr = '/var/www/cgi-bin/certs/horde/undercity_10.10.10.10/csrFile.txt';

my $openSslCmd = "openssl req -in $csr -noout -text > /tmp/csr_output.txt";

system ($openSslCmd);

open(CSR_RAW,"/tmp/csr_output.txt");

while(my $line = <CSR_RAW>)
{
  chomp ($line);;
  if ($line =~ m/^\s*Subject: C=(.*), ST=(.*), L=(.*), O=(.*), OU=(.*), CN=(.*)/i)
  {
    print "$line\n";
    my $CsrCountry = $1;
    my $CsrState = $2;
    my $CsrLocale = $3;
    my $CsrOrg = $4;
    my $CsrOrgUnit = $5;
    my $CsrCommonName = $6;
    print "$CsrCountry\n";
    print "$CsrState\n";
    print "$CsrLocale\n";
    print "$CsrOrg\n";
    print "$CsrOrgUnit\n";
    print "$CsrCommonName\n";
  }
}

