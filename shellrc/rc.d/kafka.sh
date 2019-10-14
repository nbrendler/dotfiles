alias k_cgroups="kafka-consumer-groups.sh --bootstrap-server $KAFKA_HOST --list"
alias k_cgroupmembers="kafka-consumer-groups.sh --bootstrap-server $KAFKA_HOST --list"
alias k_deletetopic="kafka-topics.sh --zookeeper $ZOOKEEPER_HOST --delete --topic"
alias k_showmessages="kafka-console-consumer.sh --bootstrap-server $KAFKA_HOST --topic"
