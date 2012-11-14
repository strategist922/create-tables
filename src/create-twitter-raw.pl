#!/usr/bin/perl -w
use Thrift;
use Thrift::Socket;
use Thrift::BufferedTransport;
use Thrift::BinaryProtocol;
use lib <./HiveConn>;
use ThriftHive;

my $socket = Thrift::Socket->new("h-apps1.local", 10000);
$socket->setSendTimeout(600 * 1000); # 10min.
$socket->setRecvTimeout(600 * 1000);
my $transport = Thrift::BufferedTransport->new($socket);
my $protocol = Thrift::BinaryProtocol->new($transport);

my $client = ThriftHiveClient->new($protocol);

eval {
        $transport->open();
        $client->execute("CREATE TABLE `twitter_raw` ( `id` string , `name` string, `user_tz` string, `user_followers` bigint, `user_friends` bigint, `time` bigint, `place` string, `hash` string, `rt_cnt` bigint, `mess` string ) PARTITIONED BY ( `yymmdd` bigint ) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' STORED AS TextFile");
        
        
        $transport->close();
};
if ($@) { print $@->{message}, "\n"; };
