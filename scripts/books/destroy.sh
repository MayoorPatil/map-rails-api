curl --include --request DELETE "http://localhost:4741/books/${ID}" \
--header "Content-Type: application/json" \
--header "Authorization: Token token=${TOKEN}" \
--data '{
  "book": {
    "kid_id": "'"${KID_ID}"'"
  }
}'
