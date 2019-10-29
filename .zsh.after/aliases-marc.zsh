# GIT
alias gst='git status'
alias gstsh='git stash'

# PATH HELPER
alias path='echo -e ${PATH//:/\\n}'

# Audio
# Must be in directory
alias mp32wav='for mp3 in ./*.mp3; do ffmpeg -i "$mp3" -acodec pcm_s16le -ac 1 -ar 16000 "${$(basename $mp3)}".wav; done'
alias m4a2wav='for mp3 in ./*.m4a; do ffmpeg -i "$mp3" -acodec pcm_s16le -ac 1 -ar 16000 "${$(basename $mp3)}".wav; done'
alias wav2mp3='for wav in ./*.wav; do ffmpeg -i "$wav" -q:a 0 "${$(basename $wav)}".mp3; done'
alias aif2mp3='for wav in ./*.aif; do ffmpeg -i "$wav" -q:a 0 "${$(basename $wav)}".mp3; done'
alias wav2m4a='for wav in ./*.wav; do ffmpeg -i "$wav" -codec:a aac "${$(basename $wav)}".m4a; done'

# POWER PRO
## Google Cloud Services
### Start the proxy server to connect to prod
alias proxy-prod='cloud_sql_proxy -instances=power-pro:us-central1:powerpro-5-7-replica=tcp:3307 -credential_file=$HOME/.ssh/PowerPro\ Production-b402787bc6ad.json &'
### Startup mysql to use the proxy server to connect to prod
alias mysql-replica="mysql -hcloudsql-replica -P3307 -p -umarc_ro"

# Import Communities
alias ci="~/Development/powerpro/breach/scripts/community-import --source-host 127.0.0.1 --source-port 3307 --source-user marc_ro --source-pass Ira12_lookup"
alias cid="ci -gc -d"
