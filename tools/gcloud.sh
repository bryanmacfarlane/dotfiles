#!/bin/zsh -e

gc_version="385.0.0"
gc_dlPath="${HOME}/Downloads/cloud-${gc_version}"

init() {
	# The next line updates PATH for the Google Cloud SDK.
	if [ -f "${gc_dlPath}/google-cloud-sdk/path.zsh.inc" ]; then . "${gc_dlPath}/google-cloud-sdk/path.zsh.inc"; fi

	# The next line enables shell command completion for gcloud.
	if [ -f "${gc_dlPath}/google-cloud-sdk/completion.zsh.inc" ]; then . "${gc_dlPath}/google-cloud-sdk/completion.zsh.inc"; fi
}

info() {
	init

	gcloudPath=`which gcloud`
    # gcloud version --format=json
	if [ -f ${gcloudPath} ]; then
		gcloud version
	else
		echo "not installed"
	fi
}

whoami() {
	if [ -f ${gcloudPath} ]; then
		gcloud config get-value account
	fi	
}

# https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-385.0.0-darwin-x86_64.tar.gz
install() {
	if [ "$(uname)" = "Darwin" ]; then
		file="google-cloud-cli-${gc_version}-darwin-x86_64.tar.gz"
		link="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/"

		echo "Downloading to ${gc_dlPath} ..."
		mkdir -p "${gc_dlPath}"
		pushd "${gc_dlPath}"
		curl -L "$link""$file" | tar xz 
		CLOUDSDK_CORE_DISABLE_PROMPTS=1 ./google-cloud-sdk/install.sh

	elif [ "$(uname)" = "Linux" ]; then
		return 
	fi	
}

"$@"
