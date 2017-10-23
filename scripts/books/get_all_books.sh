curl --include --request GET "http://localhost:4741/books" \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "book": {
      "kid_id": "'"${KID_ID}"'"
    }
  }'
