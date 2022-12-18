#bin/sh


url="http://localhost:9200"
index_name="test_index"

# register a snapshot repository
curl -XPUT -H 'Content-Type: application/json' ${url}/_snapshot/fs_backup -d @- <<EOS
{
  "type": "fs",
  "settings": {
    "location": "/usr/share/elasticsearch/backup"
  }
}
EOS

# init index & data
curl -XDELETE ${url}/${index_name}
curl -XPUT ${url}/${index_name}

curl -XPOST -H 'Content-Type: application/json' ${url}/${index_name}/_doc/1 -d '{"name": "宇宙兄弟"}'
curl -XPOST -H 'Content-Type: application/json' ${url}/${index_name}/_doc/2 -d '{"name": "カオスゲーム"}'
curl -XPOST -H 'Content-Type: application/json' ${url}/${index_name}/_doc/3 -d '{"name": "ダンジョンの中の人"}'
curl -XPOST -H 'Content-Type: application/json' ${url}/${index_name}/_doc/4 -d '{"name": "ガクサン"}'
curl -XPOST -H 'Content-Type: application/json' ${url}/${index_name}/_doc/5 -d '{"name": "トリリオンゲーム"}'
curl -XPOST -H 'Content-Type: application/json' ${url}/${index_name}/_doc/6 -d '{"name": "ワールドトリガー"}'
curl -XPOST -H 'Content-Type: application/json' ${url}/${index_name}/_doc/7 -d '{"name": "暗殺教室"}'
