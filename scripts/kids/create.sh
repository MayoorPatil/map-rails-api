# FN="Han" LN="Pat" LOC="https://cloudinary.com/console/lui/media_library#/dialog/image/upload/ihosci20eiiws3vhgg5s" TOKEN="BAhJIiVlMGQyNjZhNTAyOTdlMWI1YWE4M2RmZWM3ZWM2MWM1NgY6BkVG--07cff8813512c0d715faa418f2a157ab79e8cccf" sh scripts/kids/create.sh

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/kids"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "kid": {
      "first_name": "'"${FN}"'",
      "last_name": "'"${LN}"'",
      "image_url": ""
    }
  }'

echo
