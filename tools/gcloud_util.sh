#!/bin/zsh -e

info() {
	gcloudPath=`which gcloud`
    # gcloud version --format=json
	if [ -f ${gcloudPath} ]; then
		gcloud version
	else
		echo "not installed"
	fi
}

whoami() {
	gcloudPath=`which gcloud`

	if [ -f ${gcloudPath} ]; then
		gcloud config get-value account
	else
		echo "not installed"
	fi	
}

# https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-385.0.0-darwin-x86_64.tar.gz
install() {
	if [ "$(uname)" = "Darwin" ]; then
		file="google-cloud-cli-${gc_version}-darwin-x86_64.tar.gz"
		link="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/"

		install_script="${TOOL_GCLOUD_PATH}/google-cloud-sdk/install.sh"
		echo "${install_script}"

		if [ ! -f "${install_script}" ]; then 
			rm -rf "${TOOL_GCLOUD_PATH}"
			echo "Downloading to ${TOOL_GCLOUD_PATH} ..."
			mkdir -p "${TOOL_GCLOUD_PATH}"
			pushd "${TOOL_GCLOUD_PATH}"
			curl -L "$link""$file" | tar xz 
		else
			pushd "${TOOL_GCLOUD_PATH}" 
			echo "${install_script} exists.  Skipping download"
		fi

		CLOUDSDK_CORE_DISABLE_PROMPTS=1 ./google-cloud-sdk/install.sh

	elif [ "$(uname)" = "Linux" ]; then
		return 
	fi 
}

"$@"
