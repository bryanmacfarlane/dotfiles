# Download gcloud to Downloads, extract and then run
#  mv ~/Downloads/google-cloud-sdk /usr/local/bin/
# after opening a new shell, run to login:
# gcloud init

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/bin/google-cloud-sdk/completion.zsh.inc'; fi

gcloudPath=`which gcloud`
function dot_gcloud_version() {
    # gcloud version --format=json
	if [ -f ${gcloudPath} ]; then
		printToolInfo 'gcloud core' $( gcloud version --format="value(core)")
        printToolInfo 'gcloud sdk' $(gcloud version --format='value("Google Cloud SDK")')
	fi
}

function dot_gcloud_whoami() {
	if [ -f ${gcloudPath} ]; then
		whoami=$(gcloud config get-value account)
		printToolInfo 'gcloud' "$whoami"
	fi	
}