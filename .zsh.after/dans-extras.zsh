#!/user/bin/env bash

# # shellcheck source=/dev/null
# source "$HOME/.bin/jdk7ramdisk.sh"
# # shellcheck source=/dev/null
# source "$HOME/.bin/jdkramdisk.sh"
#
# GOPATH=$(go env GOPATH)
# PATH=$PATH:$(go env GOPATH)/bin
# export GOPATH
#
# JAVA_OPTS=""
# JAVA_OPTS="$JAVA_OPTS -Xmx2g"
# JAVA_OPTS="$JAVA_OPTS -Dlog4j.debug"
# JAVA_OPTS="$JAVA_OPTS -Dlog4j.configuration=file:/Users/dan/Documents/workspace/log4j.xml"
# export JAVA_OPTS="$JAVA_OPTS -Djava.util.logging.config.file=/Users/dan/Documents/workspace/logging.properties"
# export MAVEN_OPTS="$JAVA_OPTS"
# DBG="$JAVA_OPTS -Xdebug -Xrunjdwp:transport=dt_socket,address=4000,server=y,suspend=n -agentpath:$HOME/.jrebel/lib/libjrebel64.dylib"
#
# #export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
# M2_HOME=$(brew --prefix maven)/libexec
# M2=$(brew --prefix maven)/libexec/bin
# export JAVA_HOME=$JDK_HOME
# export M2_HOME M2
#
# export PATH="$JAVA_HOME/bin:$PATH:$M2:$HOME/.gem/ruby/2.4.0/bin"
#
# # Google Cloud Tools
# # shellcheck source=/dev/null
# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
# # shellcheck source=/dev/null
# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'
#
# # iTerm2 Integration - https://iterm2.com/documentation-shell-integration.html
# # shellcheck source=/dev/null
# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
#
# # Maven
# alias mvn="mw"
# alias mwd="MAVEN_OPTS='$DBG' mw"
#
# # MySQL
# alias mytop-dev="mytop -hcloudsql-dev -udan_ro -P3308 --prompt --noidle"
# alias mytop-prod="mytop -hcloudsql-prod -udan_ro -P3307 --prompt --noidle"
# alias innotop-dev="innotop -hcloudsql-dev -P3308 --askpass"
# alias innotop-prod="innotop -hcloudsql-prod -P3307 --askpass"
#
# # CloudSQL
# alias proxy-dev='cloud_sql_proxy -instances=power-pro-dev:us-central1:powerpro-dev-5-7=tcp:3308 -credential_file=$HOME/.ssh/PowerProDevelopment-69b821f9d0fe.json &'
# alias mysql-dev="mysql -hcloudsql-dev -P3308 -p"
# alias proxy-prod='cloud_sql_proxy -instances=power-pro:us-central1:powerpro-5-7=tcp:3307 -credential_file=$HOME/.ssh/PowerProProduction-f403fb7f522c.json &'
# alias mysql-prod="mysql -hcloudsql-prod -P3307 -p"
# alias mysql-replica="mysql -hcloudsql-replica -P3307 -p"
#
# # Java process heap dump
# alias jdump="jmap -dump:format=b,file=dump.hprof"
#
# # Delete backup files left over from merge conficts
# alias dlorig="find . -name '*.orig' | xargs dl"
#
# alias ci="~/dev/powerpro/breach/scripts/community-import -sh 127.0.0.1 -sP 3307"
# alias cid="ci -gc -d"
# alias changelog='~/dev/powerpro/breach/scripts/changelog -t$HUB_GITHUB_API_TOKEN'
# alias hp="http-prompt"
#
# # execute trang.jar (create XSD from XMLs)
# alias xml2xsd='java -jar ~/dev/trang-20091111/trang.jar'
#
# # Utils (because I'm lazy)
# PP="powerpro"
# function fly() {
#   cd persistence || exit
#   goals=""
#   for g in "$@"; do
#     goals="$goals flyway:$g"
#   done
#   mw $goals
#   cd ..
# }
# # reset the db to given version
# function dbr() {
#     dbm "$1"
#     dbi "$1"
#     dbs
# }
# function dbm() {
#   cd "$HOME/dev/powerpro/breach/persistence" || exit
#   target=""
#   if [[ -n $1 ]]; then
#     target="-Dflyway.target=$1"
#   fi
#   mw flyway:clean flyway:migrate "$target"
#   cd ..
# }
# function flym() {
#   fly migrate
# }
# function dbi() {
#   for f in ~/dev/$PP/dumps/$1/*.sql; do
#     echo "Executing community import file: $f"
#     mysql -uroot "$PP" < "$f";
#   done
# }
# function dbs() { #Make the data safe for testing
#   for f in ~/dev/$PP/dumps/special/*.sql; do
#     echo "Executing special file: $f"
#     mysql -uroot "$PP" < "$f"
#   done
# }
# function tbak() {
#   host="cloudsql-replica"
#   db=$PP
#   port=3307
#   for table in "$@"; do
#     ts=$(date +"%Y-%m-%d_%H:%M:%S")
#     dumpFile="$ts-${table}.sql"
#     mysqldump -h$host -P$port -p $db "$table" --set-gtid-purged=OFF --single-transaction --replace > "$dumpFile"
#     #gzip $dumpFile
#   done
# }
# function gsbak() {
#   gsutil cp "$@" gs://powerpro-backups
# }
# function gce() { # Eclipse history cleanup
#   workspace="workspace-neon"
#   du -hs ~/Documents/$workspace/.metadata/.plugins/org.eclipse.core.resources/.history
#   du -hs ~/Documents/$workspace/.metadata/.plugins/org.eclipse.jdt.core
# }
# function community-info() {
# read -r -d '' SQL <<"EOF"
# SELECT
# c.community_id,
# c.name,
# p.name AS property_manager_name,
# p.backend_integration_type AS backend_integration_type,
# c.username,
# c.password,
# hu.username AS house_username,
# hu.user_id AS house_user_id,
# c.group_primary_community_id,
# c.is_active,
# c.is_synced,
# c.is_floor_plan_sync_disabled,
# c.is_variable_rent_enabled,
# c.variable_rent_type,
# c.time_zone,
# c.last_synced_availability,
# c.created,
# c.updated
# FROM community c
# JOIN property_manager p USING (property_manager_id)
# LEFT JOIN (
#   SELECT
#     cu.community_id,
#     u.username,
#     u.user_id
#   FROM community_user cu
#   JOIN user u USING (user_id)
#   WHERE
#     u.is_house = 'Y'
#   ORDER BY cu.user_id
# ) AS hu ON (hu.community_id = c.community_id)
# WHERE
# EOF
#
#   mysql-replica $PP -e "$SQL c.community_id='$1' OR c.name LIKE '%$1%' OR p.name LIKE '%$1%' LIMIT 10\G"
# }
# function cnf() {
#   for id in "$@"; do
#     community-info "$id"
#   done;
# }
# function xit() {
#   mw integration-test -Dfailsafe.argLine="$JAVA_OPTS" -Dskip.unit.tests=true -Dit.test=*"$1"*
# }
# function xt() {
#   mw test -Dsurefire.argLine="$JAVA_OPTS" -Dtest=*"$1"*
# }
#
# #================================
# # https://github.com/junegunn/fzf
# #================================
# export FZF_DEFAULT_COMMAND='ag -g ""'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# # shellcheck source=/dev/null
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
# # Github issues autocomplete
# # shellcheck source=/dev/null
# source "$HOME/ghi_fzf_autocomplete.sh"
#
# #====================================
# # https://github.com/stephencelis/ghi
# #====================================
# export GHI_EDITOR="vim -c 'set ft=markdown'"
# # Actions
# alias comment="ghi comment"
# alias comments="ghi comment -l"
# alias close="ghi comment --close"
# alias pulls="ghi list -p"
#
# # Lists
# alias mine="ghi list --mine -S updated"
# alias icebox="ghi list -S updated"
# alias backlog="ghi list -L backlog -S updated"
# alias todo="ghi list -L ready -S updated"
# alias inprogress="ghi list -L in-progress -S updated"
# alias codereview="ghi list -L dev-complete -S updated"
