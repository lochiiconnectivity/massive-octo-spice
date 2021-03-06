package CIF::Smrt::Decoder::Gzip;

use strict;
use warnings;

use Mouse;
use Compress::Zlib;
use File::Type;

with 'CIF::Smrt::Decoder';

sub understands {
    my $self = shift;
    my $args = shift;
    
    return 0 unless($args->{'type'});
    return 1 if($args->{'type'} =~ /gzip/);
    return 0;
}

sub process {
    my $self = shift;
    my $args = shift;
      
    my $uncompressed = Compress::Zlib::memGunzip($args->{'data'});
    my $ft = File::Type->new()->mime_type($uncompressed);

    return unless($ft =~ /octet-stream/); #only return octect streams(aka text)
    return $uncompressed;
}


__PACKAGE__->meta()->make_immutable();

1;