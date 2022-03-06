function list_chats {
	log "$URL$TOKEN"
	response=`curl $CURL_OPTIONS $URL$TOKEN/getUpdates`
	log "$response"
	
	if [ "$HAS_JQ" = true ]; then
		echo "These are the available chats that I can find right now. The ID is the number at the front."
		echo "If there are no chats or the chat you are looking for isn't there, run this command again"
		echo "after sending a message to your bot via telegram."
		echo
		jq -r '.result | .[].message.chat | "\(.id|tostring) - \(.first_name) \(.last_name) (@\(.username))"' 2>/dev/null <<< "$response" || {
			echo "Could not parse reponse from Telegram."
			echo "Response was: $response"
			exit 1
		}
	else
		echo "You don't have jq installed. I'm afraid I can't parse the JSON from telegram without it."
		echo "So I'll have you do it. ;-)"
		echo
		echo "Please look for your chat_id in this output by yourself."
		echo 'Look for something like "chat":{"id":<CHAT_ID> and verify that first_name, last_name and'
		echo "username match your expected chat."
		echo
		echo "If there are no chats listed or the chat you are looking for isn't there, try again after"
		echo "sending a message to your bot via telegram."
		echo
		echo $response
	fi
}
