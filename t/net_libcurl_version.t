use Test2::V0 -no_srand => 1;
use Net::LibCURL::Version;

subtest 'get_ssl_backends' => sub {

  ok 1;
  note $_ for Net::LibCURL::Version->get_ssl_backends;

};

done_testing;


