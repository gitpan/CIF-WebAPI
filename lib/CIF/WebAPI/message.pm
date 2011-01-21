package CIF::WebAPI::message;
use base 'CIF::WebAPI';

sub buildNext {
    my ($self,$frag,$req) = @_;

    $self->{'query'} = $frag;
    return $self;
}

1;
