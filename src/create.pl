#!/usr/bin/perl -w
use Thrift;
use Thrift::Socket;
use Thrift::BufferedTransport;
use Thrift::BinaryProtocol;
use lib <./HiveConn>;
use ThriftHive;

my $socket = Thrift::Socket->new("h-apps1.t-lab.cs.teu.ac.jp", 10000);
$socket->setSendTimeout(600 * 1000); # 10min.
$socket->setRecvTimeout(600 * 1000);
my $transport = Thrift::BufferedTransport->new($socket);
my $protocol = Thrift::BinaryProtocol->new($transport);

my $client = ThriftHiveClient->new($protocol);

eval {
        $transport->open();
        $client->execute("CREATE TABLE `twitter_tweet` ( `id` string , `mess` string, `hash` string, `rtcnt` INT ) PARTITIONED BY ( `yymmdd` bigint ) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' STORED AS TextFile ");
        $client->execute("CREATE TABLE `twitter_word_index` ( `key_word` string , `cnt` INT, `id` ARRAY<STRING>, `rtcnt` INT ) PARTITIONED BY ( `yymmdd` bigint ) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' COLLECTION ITEMS TERMINATED BY ',' LINES TERMINATED BY '\n' STORED AS TextFile ");
        $client->execute("CREATE TABLE `twitter_pattern_index` ( `first` string , `second` string , `third` string, `cnt` INT, `id` ARRAY<STRING>, `rtcnt` INT ) PARTITIONED BY ( `yymmdd` bigint ) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' COLLECTION ITEMS TERMINATED BY ',' LINES TERMINATED BY '\n' STORED AS TextFile ");
        $client->execute("CREATE TABLE `twitter_hash_index` ( `hash` string, `cnt` INT, `id` ARRAY<STRING>, `rtcnt` INT ) PARTITIONED BY ( `yymmdd` bigint ) ROW FORMAT DELIMITED FIELDS TERMINATED BY COLLECTION ITEMS TERMINATED BY ',' '\t' LINES TERMINATED BY '\n' STORED AS TextFile ");
        
        
        $transport->close();
};
