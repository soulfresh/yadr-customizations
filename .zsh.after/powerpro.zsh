# Add Google Cloud SDK and MySQL to PATH
PATH=$PATH:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk:/usr/local/opt/mysql@5.7/bin

# Proxy to connect to MySQL on the dev environment.
# Run `powerpro-proxy-dev` to setup the proxy that allows connecting to the DB remotely.
# Run `powerpro-mysql-dev` to connect to the dev environment DB.
alias powerpro-proxy-dev='cloud_sql_proxy -verbose=false -instances=power-pro-dev:us-central1:powerpro-dev-5-7=tcp:3309 -credential_file=$HOME/.ssh/power-pro-dev-8831b256c650.json &'
alias powerpro-mysql-dev="mysql -h127.0.0.1 -P3309 -p -umarc_rw"
