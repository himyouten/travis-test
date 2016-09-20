deploy:
	export SOMEVAR=$(expr "$VICE_APP_BRANCH" : '[^_]\+_\([a-zA-Z-]\+\)') && /bin/bash deploy.sh -v
