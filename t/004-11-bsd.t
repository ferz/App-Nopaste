use strict;
use warnings;

use Test::More 0.88;

use App::Nopaste::Service::BSD;

is(App::Nopaste::Service::BSD->uri, 'https://bsd.to/');

done_testing;
