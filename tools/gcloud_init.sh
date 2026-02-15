
export TOOL_GCLOUD_VERSION="385.0.0"
export TOOL_GCLOUD_PATH="${HOME}/Downloads/cloud-${TOOL_GCLOUD_VERSION}"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${TOOL_GCLOUD_PATH}/google-cloud-sdk/path.zsh.inc" ]; then . "${TOOL_GCLOUD_PATH}/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${TOOL_GCLOUD_PATH}/google-cloud-sdk/completion.zsh.inc" ]; then . "${TOOL_GCLOUD_PATH}/google-cloud-sdk/completion.zsh.inc"; fi