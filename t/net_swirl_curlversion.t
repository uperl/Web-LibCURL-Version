use Test2::V0 -no_srand => 1;
use Net::Swirl::CurlVersion;

subtest 'get_ssl_backends' => sub {

  ok 1;
  note $_ for Net::Swirl::CurlVersion->get_ssl_backends;

};

done_testing;


