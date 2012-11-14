#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#
require 5.6.0;
use strict;
use warnings;
use Thrift;

package AdjacencyType;
use constant CONJUNCTIVE => 0;
use constant DISJUNCTIVE => 1;
package NodeType;
use constant OPERATOR => 0;
use constant STAGE => 1;
package OperatorType;
use constant JOIN => 0;
use constant MAPJOIN => 1;
use constant EXTRACT => 2;
use constant FILTER => 3;
use constant FORWARD => 4;
use constant GROUPBY => 5;
use constant LIMIT => 6;
use constant SCRIPT => 7;
use constant SELECT => 8;
use constant TABLESCAN => 9;
use constant FILESINK => 10;
use constant REDUCESINK => 11;
use constant UNION => 12;
use constant UDTF => 13;
use constant LATERALVIEWJOIN => 14;
use constant LATERALVIEWFORWARD => 15;
package TaskType;
use constant MAP => 0;
use constant REDUCE => 1;
use constant OTHER => 2;
package StageType;
use constant CONDITIONAL => 0;
use constant COPY => 1;
use constant DDL => 2;
use constant MAPRED => 3;
use constant EXPLAIN => 4;
use constant FETCH => 5;
use constant FUNC => 6;
use constant MAPREDLOCAL => 7;
use constant MOVE => 8;
package Adjacency;
use base qw(Class::Accessor);
Adjacency->mk_accessors( qw( node children adjacencyType ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{node} = undef;
  $self->{children} = undef;
  $self->{adjacencyType} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{node}) {
      $self->{node} = $vals->{node};
    }
    if (defined $vals->{children}) {
      $self->{children} = $vals->{children};
    }
    if (defined $vals->{adjacencyType}) {
      $self->{adjacencyType} = $vals->{adjacencyType};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'Adjacency';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == TType::STRING) {
        $xfer += $input->readString(\$self->{node});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^2$/ && do{      if ($ftype == TType::LIST) {
        {
          my $_size0 = 0;
          $self->{children} = [];
          my $_etype3 = 0;
          $xfer += $input->readListBegin(\$_etype3, \$_size0);
          for (my $_i4 = 0; $_i4 < $_size0; ++$_i4)
          {
            my $elem5 = undef;
            $xfer += $input->readString(\$elem5);
            push(@{$self->{children}},$elem5);
          }
          $xfer += $input->readListEnd();
        }
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^3$/ && do{      if ($ftype == TType::I32) {
        $xfer += $input->readI32(\$self->{adjacencyType});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('Adjacency');
  if (defined $self->{node}) {
    $xfer += $output->writeFieldBegin('node', TType::STRING, 1);
    $xfer += $output->writeString($self->{node});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{children}) {
    $xfer += $output->writeFieldBegin('children', TType::LIST, 2);
    {
      $output->writeListBegin(TType::STRING, scalar(@{$self->{children}}));
      {
        foreach my $iter6 (@{$self->{children}}) 
        {
          $xfer += $output->writeString($iter6);
        }
      }
      $output->writeListEnd();
    }
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{adjacencyType}) {
    $xfer += $output->writeFieldBegin('adjacencyType', TType::I32, 3);
    $xfer += $output->writeI32($self->{adjacencyType});
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package Graph;
use base qw(Class::Accessor);
Graph->mk_accessors( qw( nodeType roots adjacencyList ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{nodeType} = undef;
  $self->{roots} = undef;
  $self->{adjacencyList} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{nodeType}) {
      $self->{nodeType} = $vals->{nodeType};
    }
    if (defined $vals->{roots}) {
      $self->{roots} = $vals->{roots};
    }
    if (defined $vals->{adjacencyList}) {
      $self->{adjacencyList} = $vals->{adjacencyList};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'Graph';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == TType::I32) {
        $xfer += $input->readI32(\$self->{nodeType});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^2$/ && do{      if ($ftype == TType::LIST) {
        {
          my $_size7 = 0;
          $self->{roots} = [];
          my $_etype10 = 0;
          $xfer += $input->readListBegin(\$_etype10, \$_size7);
          for (my $_i11 = 0; $_i11 < $_size7; ++$_i11)
          {
            my $elem12 = undef;
            $xfer += $input->readString(\$elem12);
            push(@{$self->{roots}},$elem12);
          }
          $xfer += $input->readListEnd();
        }
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^3$/ && do{      if ($ftype == TType::LIST) {
        {
          my $_size13 = 0;
          $self->{adjacencyList} = [];
          my $_etype16 = 0;
          $xfer += $input->readListBegin(\$_etype16, \$_size13);
          for (my $_i17 = 0; $_i17 < $_size13; ++$_i17)
          {
            my $elem18 = undef;
            $elem18 = new Adjacency();
            $xfer += $elem18->read($input);
            push(@{$self->{adjacencyList}},$elem18);
          }
          $xfer += $input->readListEnd();
        }
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('Graph');
  if (defined $self->{nodeType}) {
    $xfer += $output->writeFieldBegin('nodeType', TType::I32, 1);
    $xfer += $output->writeI32($self->{nodeType});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{roots}) {
    $xfer += $output->writeFieldBegin('roots', TType::LIST, 2);
    {
      $output->writeListBegin(TType::STRING, scalar(@{$self->{roots}}));
      {
        foreach my $iter19 (@{$self->{roots}}) 
        {
          $xfer += $output->writeString($iter19);
        }
      }
      $output->writeListEnd();
    }
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{adjacencyList}) {
    $xfer += $output->writeFieldBegin('adjacencyList', TType::LIST, 3);
    {
      $output->writeListBegin(TType::STRUCT, scalar(@{$self->{adjacencyList}}));
      {
        foreach my $iter20 (@{$self->{adjacencyList}}) 
        {
          $xfer += ${iter20}->write($output);
        }
      }
      $output->writeListEnd();
    }
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package Operator;
use base qw(Class::Accessor);
Operator->mk_accessors( qw( operatorId operatorType operatorAttributes operatorCounters done started ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{operatorId} = undef;
  $self->{operatorType} = undef;
  $self->{operatorAttributes} = undef;
  $self->{operatorCounters} = undef;
  $self->{done} = undef;
  $self->{started} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{operatorId}) {
      $self->{operatorId} = $vals->{operatorId};
    }
    if (defined $vals->{operatorType}) {
      $self->{operatorType} = $vals->{operatorType};
    }
    if (defined $vals->{operatorAttributes}) {
      $self->{operatorAttributes} = $vals->{operatorAttributes};
    }
    if (defined $vals->{operatorCounters}) {
      $self->{operatorCounters} = $vals->{operatorCounters};
    }
    if (defined $vals->{done}) {
      $self->{done} = $vals->{done};
    }
    if (defined $vals->{started}) {
      $self->{started} = $vals->{started};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'Operator';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == TType::STRING) {
        $xfer += $input->readString(\$self->{operatorId});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^2$/ && do{      if ($ftype == TType::I32) {
        $xfer += $input->readI32(\$self->{operatorType});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^3$/ && do{      if ($ftype == TType::MAP) {
        {
          my $_size21 = 0;
          $self->{operatorAttributes} = {};
          my $_ktype22 = 0;
          my $_vtype23 = 0;
          $xfer += $input->readMapBegin(\$_ktype22, \$_vtype23, \$_size21);
          for (my $_i25 = 0; $_i25 < $_size21; ++$_i25)
          {
            my $key26 = '';
            my $val27 = '';
            $xfer += $input->readString(\$key26);
            $xfer += $input->readString(\$val27);
            $self->{operatorAttributes}->{$key26} = $val27;
          }
          $xfer += $input->readMapEnd();
        }
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^4$/ && do{      if ($ftype == TType::MAP) {
        {
          my $_size28 = 0;
          $self->{operatorCounters} = {};
          my $_ktype29 = 0;
          my $_vtype30 = 0;
          $xfer += $input->readMapBegin(\$_ktype29, \$_vtype30, \$_size28);
          for (my $_i32 = 0; $_i32 < $_size28; ++$_i32)
          {
            my $key33 = '';
            my $val34 = 0;
            $xfer += $input->readString(\$key33);
            $xfer += $input->readI64(\$val34);
            $self->{operatorCounters}->{$key33} = $val34;
          }
          $xfer += $input->readMapEnd();
        }
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^5$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{done});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^6$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{started});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('Operator');
  if (defined $self->{operatorId}) {
    $xfer += $output->writeFieldBegin('operatorId', TType::STRING, 1);
    $xfer += $output->writeString($self->{operatorId});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{operatorType}) {
    $xfer += $output->writeFieldBegin('operatorType', TType::I32, 2);
    $xfer += $output->writeI32($self->{operatorType});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{operatorAttributes}) {
    $xfer += $output->writeFieldBegin('operatorAttributes', TType::MAP, 3);
    {
      $output->writeMapBegin(TType::STRING, TType::STRING, scalar(keys %{$self->{operatorAttributes}}));
      {
        while( my ($kiter35,$viter36) = each %{$self->{operatorAttributes}}) 
        {
          $xfer += $output->writeString($kiter35);
          $xfer += $output->writeString($viter36);
        }
      }
      $output->writeMapEnd();
    }
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{operatorCounters}) {
    $xfer += $output->writeFieldBegin('operatorCounters', TType::MAP, 4);
    {
      $output->writeMapBegin(TType::STRING, TType::I64, scalar(keys %{$self->{operatorCounters}}));
      {
        while( my ($kiter37,$viter38) = each %{$self->{operatorCounters}}) 
        {
          $xfer += $output->writeString($kiter37);
          $xfer += $output->writeI64($viter38);
        }
      }
      $output->writeMapEnd();
    }
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{done}) {
    $xfer += $output->writeFieldBegin('done', TType::BOOL, 5);
    $xfer += $output->writeBool($self->{done});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{started}) {
    $xfer += $output->writeFieldBegin('started', TType::BOOL, 6);
    $xfer += $output->writeBool($self->{started});
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package Task;
use base qw(Class::Accessor);
Task->mk_accessors( qw( taskId taskType taskAttributes taskCounters operatorGraph operatorList done started ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{taskId} = undef;
  $self->{taskType} = undef;
  $self->{taskAttributes} = undef;
  $self->{taskCounters} = undef;
  $self->{operatorGraph} = undef;
  $self->{operatorList} = undef;
  $self->{done} = undef;
  $self->{started} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{taskId}) {
      $self->{taskId} = $vals->{taskId};
    }
    if (defined $vals->{taskType}) {
      $self->{taskType} = $vals->{taskType};
    }
    if (defined $vals->{taskAttributes}) {
      $self->{taskAttributes} = $vals->{taskAttributes};
    }
    if (defined $vals->{taskCounters}) {
      $self->{taskCounters} = $vals->{taskCounters};
    }
    if (defined $vals->{operatorGraph}) {
      $self->{operatorGraph} = $vals->{operatorGraph};
    }
    if (defined $vals->{operatorList}) {
      $self->{operatorList} = $vals->{operatorList};
    }
    if (defined $vals->{done}) {
      $self->{done} = $vals->{done};
    }
    if (defined $vals->{started}) {
      $self->{started} = $vals->{started};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'Task';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == TType::STRING) {
        $xfer += $input->readString(\$self->{taskId});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^2$/ && do{      if ($ftype == TType::I32) {
        $xfer += $input->readI32(\$self->{taskType});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^3$/ && do{      if ($ftype == TType::MAP) {
        {
          my $_size39 = 0;
          $self->{taskAttributes} = {};
          my $_ktype40 = 0;
          my $_vtype41 = 0;
          $xfer += $input->readMapBegin(\$_ktype40, \$_vtype41, \$_size39);
          for (my $_i43 = 0; $_i43 < $_size39; ++$_i43)
          {
            my $key44 = '';
            my $val45 = '';
            $xfer += $input->readString(\$key44);
            $xfer += $input->readString(\$val45);
            $self->{taskAttributes}->{$key44} = $val45;
          }
          $xfer += $input->readMapEnd();
        }
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^4$/ && do{      if ($ftype == TType::MAP) {
        {
          my $_size46 = 0;
          $self->{taskCounters} = {};
          my $_ktype47 = 0;
          my $_vtype48 = 0;
          $xfer += $input->readMapBegin(\$_ktype47, \$_vtype48, \$_size46);
          for (my $_i50 = 0; $_i50 < $_size46; ++$_i50)
          {
            my $key51 = '';
            my $val52 = 0;
            $xfer += $input->readString(\$key51);
            $xfer += $input->readI64(\$val52);
            $self->{taskCounters}->{$key51} = $val52;
          }
          $xfer += $input->readMapEnd();
        }
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^5$/ && do{      if ($ftype == TType::STRUCT) {
        $self->{operatorGraph} = new Graph();
        $xfer += $self->{operatorGraph}->read($input);
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^6$/ && do{      if ($ftype == TType::LIST) {
        {
          my $_size53 = 0;
          $self->{operatorList} = [];
          my $_etype56 = 0;
          $xfer += $input->readListBegin(\$_etype56, \$_size53);
          for (my $_i57 = 0; $_i57 < $_size53; ++$_i57)
          {
            my $elem58 = undef;
            $elem58 = new Operator();
            $xfer += $elem58->read($input);
            push(@{$self->{operatorList}},$elem58);
          }
          $xfer += $input->readListEnd();
        }
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^7$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{done});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^8$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{started});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('Task');
  if (defined $self->{taskId}) {
    $xfer += $output->writeFieldBegin('taskId', TType::STRING, 1);
    $xfer += $output->writeString($self->{taskId});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{taskType}) {
    $xfer += $output->writeFieldBegin('taskType', TType::I32, 2);
    $xfer += $output->writeI32($self->{taskType});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{taskAttributes}) {
    $xfer += $output->writeFieldBegin('taskAttributes', TType::MAP, 3);
    {
      $output->writeMapBegin(TType::STRING, TType::STRING, scalar(keys %{$self->{taskAttributes}}));
      {
        while( my ($kiter59,$viter60) = each %{$self->{taskAttributes}}) 
        {
          $xfer += $output->writeString($kiter59);
          $xfer += $output->writeString($viter60);
        }
      }
      $output->writeMapEnd();
    }
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{taskCounters}) {
    $xfer += $output->writeFieldBegin('taskCounters', TType::MAP, 4);
    {
      $output->writeMapBegin(TType::STRING, TType::I64, scalar(keys %{$self->{taskCounters}}));
      {
        while( my ($kiter61,$viter62) = each %{$self->{taskCounters}}) 
        {
          $xfer += $output->writeString($kiter61);
          $xfer += $output->writeI64($viter62);
        }
      }
      $output->writeMapEnd();
    }
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{operatorGraph}) {
    $xfer += $output->writeFieldBegin('operatorGraph', TType::STRUCT, 5);
    $xfer += $self->{operatorGraph}->write($output);
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{operatorList}) {
    $xfer += $output->writeFieldBegin('operatorList', TType::LIST, 6);
    {
      $output->writeListBegin(TType::STRUCT, scalar(@{$self->{operatorList}}));
      {
        foreach my $iter63 (@{$self->{operatorList}}) 
        {
          $xfer += ${iter63}->write($output);
        }
      }
      $output->writeListEnd();
    }
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{done}) {
    $xfer += $output->writeFieldBegin('done', TType::BOOL, 7);
    $xfer += $output->writeBool($self->{done});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{started}) {
    $xfer += $output->writeFieldBegin('started', TType::BOOL, 8);
    $xfer += $output->writeBool($self->{started});
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package Stage;
use base qw(Class::Accessor);
Stage->mk_accessors( qw( stageId stageType stageAttributes stageCounters taskList done started ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{stageId} = undef;
  $self->{stageType} = undef;
  $self->{stageAttributes} = undef;
  $self->{stageCounters} = undef;
  $self->{taskList} = undef;
  $self->{done} = undef;
  $self->{started} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{stageId}) {
      $self->{stageId} = $vals->{stageId};
    }
    if (defined $vals->{stageType}) {
      $self->{stageType} = $vals->{stageType};
    }
    if (defined $vals->{stageAttributes}) {
      $self->{stageAttributes} = $vals->{stageAttributes};
    }
    if (defined $vals->{stageCounters}) {
      $self->{stageCounters} = $vals->{stageCounters};
    }
    if (defined $vals->{taskList}) {
      $self->{taskList} = $vals->{taskList};
    }
    if (defined $vals->{done}) {
      $self->{done} = $vals->{done};
    }
    if (defined $vals->{started}) {
      $self->{started} = $vals->{started};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'Stage';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == TType::STRING) {
        $xfer += $input->readString(\$self->{stageId});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^2$/ && do{      if ($ftype == TType::I32) {
        $xfer += $input->readI32(\$self->{stageType});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^3$/ && do{      if ($ftype == TType::MAP) {
        {
          my $_size64 = 0;
          $self->{stageAttributes} = {};
          my $_ktype65 = 0;
          my $_vtype66 = 0;
          $xfer += $input->readMapBegin(\$_ktype65, \$_vtype66, \$_size64);
          for (my $_i68 = 0; $_i68 < $_size64; ++$_i68)
          {
            my $key69 = '';
            my $val70 = '';
            $xfer += $input->readString(\$key69);
            $xfer += $input->readString(\$val70);
            $self->{stageAttributes}->{$key69} = $val70;
          }
          $xfer += $input->readMapEnd();
        }
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^4$/ && do{      if ($ftype == TType::MAP) {
        {
          my $_size71 = 0;
          $self->{stageCounters} = {};
          my $_ktype72 = 0;
          my $_vtype73 = 0;
          $xfer += $input->readMapBegin(\$_ktype72, \$_vtype73, \$_size71);
          for (my $_i75 = 0; $_i75 < $_size71; ++$_i75)
          {
            my $key76 = '';
            my $val77 = 0;
            $xfer += $input->readString(\$key76);
            $xfer += $input->readI64(\$val77);
            $self->{stageCounters}->{$key76} = $val77;
          }
          $xfer += $input->readMapEnd();
        }
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^5$/ && do{      if ($ftype == TType::LIST) {
        {
          my $_size78 = 0;
          $self->{taskList} = [];
          my $_etype81 = 0;
          $xfer += $input->readListBegin(\$_etype81, \$_size78);
          for (my $_i82 = 0; $_i82 < $_size78; ++$_i82)
          {
            my $elem83 = undef;
            $elem83 = new Task();
            $xfer += $elem83->read($input);
            push(@{$self->{taskList}},$elem83);
          }
          $xfer += $input->readListEnd();
        }
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^6$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{done});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^7$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{started});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('Stage');
  if (defined $self->{stageId}) {
    $xfer += $output->writeFieldBegin('stageId', TType::STRING, 1);
    $xfer += $output->writeString($self->{stageId});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{stageType}) {
    $xfer += $output->writeFieldBegin('stageType', TType::I32, 2);
    $xfer += $output->writeI32($self->{stageType});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{stageAttributes}) {
    $xfer += $output->writeFieldBegin('stageAttributes', TType::MAP, 3);
    {
      $output->writeMapBegin(TType::STRING, TType::STRING, scalar(keys %{$self->{stageAttributes}}));
      {
        while( my ($kiter84,$viter85) = each %{$self->{stageAttributes}}) 
        {
          $xfer += $output->writeString($kiter84);
          $xfer += $output->writeString($viter85);
        }
      }
      $output->writeMapEnd();
    }
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{stageCounters}) {
    $xfer += $output->writeFieldBegin('stageCounters', TType::MAP, 4);
    {
      $output->writeMapBegin(TType::STRING, TType::I64, scalar(keys %{$self->{stageCounters}}));
      {
        while( my ($kiter86,$viter87) = each %{$self->{stageCounters}}) 
        {
          $xfer += $output->writeString($kiter86);
          $xfer += $output->writeI64($viter87);
        }
      }
      $output->writeMapEnd();
    }
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{taskList}) {
    $xfer += $output->writeFieldBegin('taskList', TType::LIST, 5);
    {
      $output->writeListBegin(TType::STRUCT, scalar(@{$self->{taskList}}));
      {
        foreach my $iter88 (@{$self->{taskList}}) 
        {
          $xfer += ${iter88}->write($output);
        }
      }
      $output->writeListEnd();
    }
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{done}) {
    $xfer += $output->writeFieldBegin('done', TType::BOOL, 6);
    $xfer += $output->writeBool($self->{done});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{started}) {
    $xfer += $output->writeFieldBegin('started', TType::BOOL, 7);
    $xfer += $output->writeBool($self->{started});
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package Query;
use base qw(Class::Accessor);
Query->mk_accessors( qw( queryId queryType queryAttributes queryCounters stageGraph stageList done started ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{queryId} = undef;
  $self->{queryType} = undef;
  $self->{queryAttributes} = undef;
  $self->{queryCounters} = undef;
  $self->{stageGraph} = undef;
  $self->{stageList} = undef;
  $self->{done} = undef;
  $self->{started} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{queryId}) {
      $self->{queryId} = $vals->{queryId};
    }
    if (defined $vals->{queryType}) {
      $self->{queryType} = $vals->{queryType};
    }
    if (defined $vals->{queryAttributes}) {
      $self->{queryAttributes} = $vals->{queryAttributes};
    }
    if (defined $vals->{queryCounters}) {
      $self->{queryCounters} = $vals->{queryCounters};
    }
    if (defined $vals->{stageGraph}) {
      $self->{stageGraph} = $vals->{stageGraph};
    }
    if (defined $vals->{stageList}) {
      $self->{stageList} = $vals->{stageList};
    }
    if (defined $vals->{done}) {
      $self->{done} = $vals->{done};
    }
    if (defined $vals->{started}) {
      $self->{started} = $vals->{started};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'Query';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == TType::STRING) {
        $xfer += $input->readString(\$self->{queryId});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^2$/ && do{      if ($ftype == TType::STRING) {
        $xfer += $input->readString(\$self->{queryType});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^3$/ && do{      if ($ftype == TType::MAP) {
        {
          my $_size89 = 0;
          $self->{queryAttributes} = {};
          my $_ktype90 = 0;
          my $_vtype91 = 0;
          $xfer += $input->readMapBegin(\$_ktype90, \$_vtype91, \$_size89);
          for (my $_i93 = 0; $_i93 < $_size89; ++$_i93)
          {
            my $key94 = '';
            my $val95 = '';
            $xfer += $input->readString(\$key94);
            $xfer += $input->readString(\$val95);
            $self->{queryAttributes}->{$key94} = $val95;
          }
          $xfer += $input->readMapEnd();
        }
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^4$/ && do{      if ($ftype == TType::MAP) {
        {
          my $_size96 = 0;
          $self->{queryCounters} = {};
          my $_ktype97 = 0;
          my $_vtype98 = 0;
          $xfer += $input->readMapBegin(\$_ktype97, \$_vtype98, \$_size96);
          for (my $_i100 = 0; $_i100 < $_size96; ++$_i100)
          {
            my $key101 = '';
            my $val102 = 0;
            $xfer += $input->readString(\$key101);
            $xfer += $input->readI64(\$val102);
            $self->{queryCounters}->{$key101} = $val102;
          }
          $xfer += $input->readMapEnd();
        }
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^5$/ && do{      if ($ftype == TType::STRUCT) {
        $self->{stageGraph} = new Graph();
        $xfer += $self->{stageGraph}->read($input);
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^6$/ && do{      if ($ftype == TType::LIST) {
        {
          my $_size103 = 0;
          $self->{stageList} = [];
          my $_etype106 = 0;
          $xfer += $input->readListBegin(\$_etype106, \$_size103);
          for (my $_i107 = 0; $_i107 < $_size103; ++$_i107)
          {
            my $elem108 = undef;
            $elem108 = new Stage();
            $xfer += $elem108->read($input);
            push(@{$self->{stageList}},$elem108);
          }
          $xfer += $input->readListEnd();
        }
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^7$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{done});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^8$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{started});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('Query');
  if (defined $self->{queryId}) {
    $xfer += $output->writeFieldBegin('queryId', TType::STRING, 1);
    $xfer += $output->writeString($self->{queryId});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{queryType}) {
    $xfer += $output->writeFieldBegin('queryType', TType::STRING, 2);
    $xfer += $output->writeString($self->{queryType});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{queryAttributes}) {
    $xfer += $output->writeFieldBegin('queryAttributes', TType::MAP, 3);
    {
      $output->writeMapBegin(TType::STRING, TType::STRING, scalar(keys %{$self->{queryAttributes}}));
      {
        while( my ($kiter109,$viter110) = each %{$self->{queryAttributes}}) 
        {
          $xfer += $output->writeString($kiter109);
          $xfer += $output->writeString($viter110);
        }
      }
      $output->writeMapEnd();
    }
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{queryCounters}) {
    $xfer += $output->writeFieldBegin('queryCounters', TType::MAP, 4);
    {
      $output->writeMapBegin(TType::STRING, TType::I64, scalar(keys %{$self->{queryCounters}}));
      {
        while( my ($kiter111,$viter112) = each %{$self->{queryCounters}}) 
        {
          $xfer += $output->writeString($kiter111);
          $xfer += $output->writeI64($viter112);
        }
      }
      $output->writeMapEnd();
    }
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{stageGraph}) {
    $xfer += $output->writeFieldBegin('stageGraph', TType::STRUCT, 5);
    $xfer += $self->{stageGraph}->write($output);
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{stageList}) {
    $xfer += $output->writeFieldBegin('stageList', TType::LIST, 6);
    {
      $output->writeListBegin(TType::STRUCT, scalar(@{$self->{stageList}}));
      {
        foreach my $iter113 (@{$self->{stageList}}) 
        {
          $xfer += ${iter113}->write($output);
        }
      }
      $output->writeListEnd();
    }
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{done}) {
    $xfer += $output->writeFieldBegin('done', TType::BOOL, 7);
    $xfer += $output->writeBool($self->{done});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{started}) {
    $xfer += $output->writeFieldBegin('started', TType::BOOL, 8);
    $xfer += $output->writeBool($self->{started});
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package QueryPlan;
use base qw(Class::Accessor);
QueryPlan->mk_accessors( qw( queries done started ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{queries} = undef;
  $self->{done} = undef;
  $self->{started} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{queries}) {
      $self->{queries} = $vals->{queries};
    }
    if (defined $vals->{done}) {
      $self->{done} = $vals->{done};
    }
    if (defined $vals->{started}) {
      $self->{started} = $vals->{started};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'QueryPlan';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == TType::LIST) {
        {
          my $_size114 = 0;
          $self->{queries} = [];
          my $_etype117 = 0;
          $xfer += $input->readListBegin(\$_etype117, \$_size114);
          for (my $_i118 = 0; $_i118 < $_size114; ++$_i118)
          {
            my $elem119 = undef;
            $elem119 = new Query();
            $xfer += $elem119->read($input);
            push(@{$self->{queries}},$elem119);
          }
          $xfer += $input->readListEnd();
        }
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^2$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{done});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^3$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{started});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('QueryPlan');
  if (defined $self->{queries}) {
    $xfer += $output->writeFieldBegin('queries', TType::LIST, 1);
    {
      $output->writeListBegin(TType::STRUCT, scalar(@{$self->{queries}}));
      {
        foreach my $iter120 (@{$self->{queries}}) 
        {
          $xfer += ${iter120}->write($output);
        }
      }
      $output->writeListEnd();
    }
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{done}) {
    $xfer += $output->writeFieldBegin('done', TType::BOOL, 2);
    $xfer += $output->writeBool($self->{done});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{started}) {
    $xfer += $output->writeFieldBegin('started', TType::BOOL, 3);
    $xfer += $output->writeBool($self->{started});
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

1;
