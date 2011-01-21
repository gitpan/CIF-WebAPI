package CIF::WebAPI::domain::passive;
use base 'CIF::WebAPI';

use strict;
use warnings;

sub GET {
    my ($self, $request, $response) = @_;

    return Apache2::Const::HTTP_OK unless(exists($self->{'domain'}));
    my $arg = $self->domain();

    my @recs = $bucket->search_by_address('%'.$arg.'%',10);
    if(@recs){
        my @res = map { CIF::WebAPI::domain::mapIndex($_) } @recs;
        $response->data()->{'result'} = \@res;
    }
    return Apache2::Const::HTTP_OK;
}

1;
