function receive_file {
	if [ "$HAS_JQ" = false ]; then
		echo "You need to have jq installed in order to be able to download files."
		exit 1
	fi
	
	result=`curl $CURL_OPTIONS $URL$TOKEN/getUpdates?allowed_updates=message`
	log "$result"
	# {"ok":true,"result":[
	#   {
	#     "update_id":441727866,
	#     "message":{
	#       "message_id":8339,
	#       "from":{"id":15773,"is_bot":false,"first_name":"Fabian","last_name":"Schlenz","username":"fabianonline","language_code":"de"},
	#       "chat":{"id":15773,"first_name":"Fabian","last_name":"Schlenz","username":"fabianonline","type":"private"},
	#       "date":1526564127,
	#       "document":{"file_name":"desktop.ini","file_id":"BQAav-HkXugI","file_size":282}}}]}
	file_id=`jq -r '.result[-1].message.document.file_id' <<< "$result"`
	log "file_id: $file_id"
	if [ "$file_id" == "null" ]; then
		echo "Last message received apparently didn't contain a file. Aborting."
		exit 1
	fi
	file_name=`jq -r '.result[-1].message.document.file_name' <<< "$result"`
	log "file_name: $file_name"
	result=`curl $CURL_OPTIONS $URL$TOKEN/getFile?file_id=$file_id`
	log $result
	# {"ok":true,"result":{"file_id":"BQAav-HkXugI","file_size":282,"file_path":"documents/file_271.ini"}}
	path=`jq -r '.result.file_path' <<< "$result"`
	log "path: $path"
	if [ "$path" == "null" ]; then
		echo "Could not parse telegram's response to getFile. Aborting."
		exit 1
	fi
	file_name="`date +%s`_$file_name"
	log "file_name: $file_name"
	if [ -e "$file_name" ]; then
		echo "File $file_name already exists. This is unexpected, so I'm quitting now."
		exit 1
	fi
	curl $FILE_URL$TOKEN/$path --output "$file_name"
	echo "File downloaded as $file_name"
}
