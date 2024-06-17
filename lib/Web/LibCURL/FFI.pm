package Web::LibCURL::FFI {

  use warnings;
  use 5.020;
  use FFI::CheckLib 0.30 qw( find_lib_or_die );

# ABSTRACT: Private class for Web::LibCURL

=head1 SYNOPSIS

 $ perldoc Web::LibCURL

=head1 DESCRIPTION

There is nothing to see here.  Please see the main documentation page at
L<Web::LibCURL>.

=cut

  sub lib
  {
    return $ENV{NET_LIBCURL_DLL} //
      find_lib_or_die(
        lib    => 'curl',
        symbol => ['curl_version_info'],
        alien  => ['Alien::curl'],
      );
  }

}

1;
