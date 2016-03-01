package DB_SQL;

use lib "..";
use lib "../..";
use lib "../../..";
use lib "../../../..";

use strict;
use Carp;
use Encode;

use vars qw($VERSION @ISA @EXPORT);
require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(
	doSQL
	doSQL_ARRAY
	doSQL_HASH
	get_maxID
	
);


sub doSQL
{
   	my ($sqlstring) = @_;

    use DBI;
    
    my($dbh,$sth,@values, @werte);
    $dbh = &db_connect();
    my $i = 0;
    
    $sth = $dbh->prepare( $sqlstring );

    if (!$sth) {            &db_fault( $dbh->errstr ); }  # Fehlerabfrage
    if (!$sth->execute) {   &db_fault( $sth->errstr ); }  # Fehlerabfrage

    return();
}

sub doSQL_HASH
{
   	my ($sqlstring) = @_;

    use DBI;
    
    my($dbh,$sth,@values, @daten, $hash_ref);
    $dbh = &db_connect();
    my $i = 0;
    
    $sth = $dbh->prepare( $sqlstring );

    if (!$sth) {            &db_fault( $dbh->errstr ); }  # Fehlerabfrage
    if (!$sth->execute) {   &db_fault( $sth->errstr ); }  # Fehlerabfrage

    while ($hash_ref = $sth->fetchrow_hashref) 
    {
			$daten[$i++] = $hash_ref;
    }

    return(@daten);
}

sub doSQL_ARRAY
{
   	my ($sqlstring) = @_;

    use DBI;
    
    my($dbh,$sth,@values, @daten);
    $dbh = &db_connect();
    my $i = 0;
    
    $sth = $dbh->prepare( $sqlstring );

    if (!$sth) {            &db_fault( $dbh->errstr ); }  # Fehlerabfrage
    if (!$sth->execute) {   &db_fault( $sth->errstr ); }  # Fehlerabfrage

    while (@values = $sth->fetchrow_array) 
    {
			(@{$daten[$i++]}) = (@values);
    }

    return(@daten);
}


sub get_maxID
{
   	my ($table, $column) = @_;

    use DBI;
    
    my($dbh,$sth,@values, $id);
    $dbh = &db_connect();
    
    # Max ID finden
    $sth = $dbh->prepare(" select max($column) from $table ");

    if (!$sth) {            &db_fault( $dbh->errstr ); }  # Fehlerabfrage
    if (!$sth->execute) {   &db_fault( $sth->errstr ); }  # Fehlerabfrage

    while (@values = $sth->fetchrow_array) 
    {
			($id) = ($values[0]);
    }
    $id++;

    return($id);
}


sub db_connect 
{
		####################################
		# server connect
		my $server	= "dbi:mysql:pixxio:mysql-server";
		my $login		= "root";
		my $pass		= 'z-v395l4_BMD-6GLfj';
		
		
    use DBI;
    my($dbh,$sth);
    $dbh = DBI->connect( "$server", "$login", "$pass" );   #mysql
		$dbh->{'mysql_enable_utf8'} = 1;
		$dbh->do('set names utf8');
    return $dbh;
}

sub db_fault 
{
    my $fault = shift;
    die "Error:" . $fault . "\n";
}

sub trim {
    my @out = @_;
    for (@out) {
        s/^\s+//;
        s/\s+$//;
    }
    return wantarray ? @out : $out[0];
}
