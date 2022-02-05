ENDPOINT=localhost:4567
GAME_ID=qca7g8pwrx6z

# curl -X 'POST' \
#   "$ENDPOINT/games" \
#   -H 'accept: application/json' \
#   -H 'Content-Type: application/json' \
#   -d '{
#   "players": [
#     "neo",
#     "morpheus"
#   ]
# }'

curl -X 'GET' \
  "$ENDPOINT/games/$GAME_ID/players/neo" \
  -H 'accept: application/json'
