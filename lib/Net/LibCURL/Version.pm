use warnings;
use 5.020;
use experimental qw( postderef signatures );
use FFI::Platypus 2.00;
use Net::LibCURL::FFI;
use FFI::C;

my $ffi = FFI::Platypus->new(
  api => 2,
  lib => [Net::LibCURL::FFI->lib],
);

FFI::C->ffi($ffi);

package Net::LibCURL::Version::CurlSslBackend {
  FFI::C->struct(curl_ssl_backend => [
    id => 'enum',
    _name => 'opaque',
  ]);

  sub name ($self)
  {
    $ffi->cast( opaque => string => $self->_name );
  }
}


package Net::LibCURL::Version {

  # ABSTRACT: Get version information about curl

=head1 METHODS

=head2 get_ssl_backends

 my @backends = Net::LibCURL::Version->get_ssl_backends;

Get the list of SSL backends (as strings).

=cut

  sub get_ssl_backends ($class) {
    my $ptr;
    my $ret = $ffi->function( curl_global_sslset => [ 'senum', 'string', 'opaque*' ] => 'enum' )->call(-1, undef, \$ptr);
    # TODO: check ret and throw error
    map { $ffi->cast('opaque','curl_ssl_backend', $_)->name } $ffi->cast('opaque','opaque[]',$ptr)->@*;
  }

}

1;
