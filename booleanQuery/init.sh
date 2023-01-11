#bin/sh


url="http://localhost:9200"
index_name="test_index"

# init index & data
curl -XDELETE ${url}/${index_name}
curl -XPUT -H 'Content-Type: application/json' ${url}/${index_name} -d @- <<EOS
{
  "settings": {
    "analysis": {
      "tokenizer": {
        "bigram_tokenizer": {
          "type": "ngram",
          "min_gram": 2,
          "max_gram": 2
        }
      },
      "analyzer": {
        "bigram_analyzer": {
          "tokenizer": "bigram_tokenizer"
        }
      }
    }
  },
  "mappings": {
    "properties": {
      "title": {
        "type": "text",
        "analyzer": "bigram_analyzer"
      },
      "title_en": {
        "type": "text",
        "analyzer": "bigram_analyzer"
      }
    }
  }
}
EOS


curl -XPOST -H 'Content-Type: application/json' ${url}/${index_name}/_doc/1 -d '{"title": "宇宙兄弟"}'
curl -XPOST -H 'Content-Type: application/json' ${url}/${index_name}/_doc/2 -d '{"title": "ワールドトリガー"}'
