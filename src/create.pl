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
        $client->execute("CREATE TABLE `twitter_tweet` ( `id` string , `mess` string, `hash` string ) PARTITIONED BY ( `yymmdd` bigint ) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' STORED AS TextFile ");
        $client->execute("CREATE TABLE `twitter_word_index` ( `id` string , `key_word` string ) PARTITIONED BY ( `yymmdd` bigint ) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' STORED AS TextFile ");
        $client->execute("CREATE TABLE `twitter_word_count` ( `key_word` string , `cnt` int ) PARTITIONED BY ( `yymmdd` bigint ) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' STORED AS TextFile ");
        $client->execute("CREATE TABLE `twitter_pair_count` ( `markovone` string , `markovtwo` string , `cnt` int ) PARTITIONED BY ( `yymmdd` bigint ) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' STORED AS TextFile");
        $client->execute("CREATE TABLE `twitter_pair_index` ( `id` string , `markovone` string , `markovtwo` string ) PARTITIONED BY ( `yymmdd` bigint ) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' STORED AS TextFile ");
        $client->execute("CREATE TABLE `twitter_hash_index` ( `id` string , `hash` string ) PARTITIONED BY ( `yymmdd` bigint ) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' STORED AS TextFile ");
        $client->execute("CREATE TABLE `twitter_hash_count` ( `hash` string , `cnt` int ) PARTITIONED BY ( `yymmdd` bigint ) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' STORED AS TextFile ");
        
        
        $transport->close();
};
if ($@) { print $@->{message}, "\n"; };
