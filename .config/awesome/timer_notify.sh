#/bin/sh

sleep $(expr $1 \* 60)
echo "naughty.notify({title='TIMES UP', text='IT HAS BEEN $1 minutes', width=9999, height=9999, position='top_left', timeout=5})" | awesome-client -



