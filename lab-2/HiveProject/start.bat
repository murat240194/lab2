docker cp . docker-hive-master_hive-server_1:HiveProject

docker cp hiveStart.sh docker-hive-master_hive-server_1:hiveStart.sh
docker cp 000000 docker-hive-master_hive-server_1:000000
docker cp HiveProject docker-hive-master_hive-server_1:HiveProject
docker exec -it  docker-hive-master_hive-server_1 bash

pause