use strict;
use warnings;
package App::Nopaste::Service::Shadowcat;
# ABSTRACT: Service provider for Shadowcat - http://paste.scsys.co.uk/

our $VERSION = '1.008';

use parent 'App::Nopaste::Service';

sub available {
    my $self = shift;
    my %args = @_;
    return !(exists($args{private}) && $args{private});
}

sub uri { "http://paste.scsys.co.uk" }

1;
