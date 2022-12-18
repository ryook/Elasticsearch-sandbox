#bin/sh


url="http://localhost:9200"
index_name="test_index"

curl -XPUT -H 'Content-Type: application/json' ${url}/_snapshot/fs_backup/snapshot -d @- <<EOS
{
    "indices": "${index_name}"
}
EOS

curl -XPUT -H 'Content-Type: application/json' ${url}/_snapshot/fs_backup/snapshot2 -d @- <<EOS
{
    "indices": "${index_name}",
    "include_global_state": false
}
EOS
