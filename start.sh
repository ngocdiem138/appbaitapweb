#!/usr/bin/env bash

cat << EOF > context.xml
<Resource name="jdbc/d37tfeuqn9sfbb" auth="Container"
              driverClassName="org.postgresql.Driver"
              url="jdbc:postgresql://ec2-54-159-35-35.compute-1.amazonaws.com:5432/d37tfeuqn9sfbb?ssl=true&amp;sslmode=require"
              username="ukffckmjxuwehs" password="37b320e7be9f32ee6edd7d88a59fe3009bb9b0814e2512e8ab98f54faf687ccc"
              partitionCount="1"
              maxConnectionsPerPartition="20"
              minConnectionsPerPartition="2"
              acquireIncrement="1"
              acquireRetryAttempts="3"
              acquireRetryDelay="30 seconds"
              connectionTimeout="30 seconds"
              idleMaxAge="5 minutes"
              idleConnectionTestPeriod="0"
              maxConnectionAge="15 minutes"
              initSQL="SELECT 1"
              releaseHelperThreads="0"
              maxTotal="5"
              maxIdle="5"
              maxWaitMillis="10000"
              removeAbandonedTimeout="300"
              defaultAutoCommit="true"
              initialSize="5"
              maxActive="5" maxWait="100000"
              logAbandoned="true" removeAbandoned="true"
              type="javax.sql.DataSource"/>
EOF
java -jar target/dependency/webapp-runner.jar --port $PORT target/*.war
