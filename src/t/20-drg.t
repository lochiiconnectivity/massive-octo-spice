use strict;

use Test::More;

BEGIN { 
    use_ok('CIF');
    use_ok('CIF::Smrt');
};

# clean up rule, set defaults vs the processing rules, 

my $rules = [
    {
        config  => 'rules/default/drg.cfg',
        feed    => 'ssh',
        override    => {
            remote      => 'testdata/dragonresearchgroup.org/sshpwauth_small.txt',
            not_before  => '10000 days ago',
            id          => 1234,
        },
    },
    {
        config  => 'rules/default/drg.cfg',
        feed    => 'vnc',
        override    => {
            remote      => 'testdata/dragonresearchgroup.org/vncprobe.txt',
            not_before  => '10000 days ago',
            id          => 1234,
        }
    },
];

my $smrt = CIF::Smrt->new({
    client_config => {
        remote          => 'dummy',
        Token           => '1234',
    },
    tmp => '/tmp',
});

my $ret;
foreach my $r (@$rules){ 
    $ret = $smrt->process({ 
        rule        => $r,
        test_mode   => 1,
    });
    ok($#{$ret},'testing for results...');
    ok(@$ret[0]->{'observable'} =~ /(141.52.251.250|63.230.14.171)/, 'testing output...');
}

done_testing();
