# ID=2 TOKEN="BAhJIiVlMGQyNjZhNTAyOTdlMWI1YWE4M2RmZWM3ZWM2MWM1NgY6BkVG--07cff8813512c0d715faa418f2a157ab79e8cccf" sh scripts/kids/destroy.sh

curl --include --request DELETE "http://localhost:4741/kids/${ID}" \
--header "Content-Type: application/json" \
--header "Authorization: Token token=${TOKEN}"
