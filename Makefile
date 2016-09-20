deploy:
	export SOMEVAR=`expr "$TRAVIS_BRANCH" : '[^_]\+_\([a-zA-Z-]\+\)'` && /bin/bash deploy.sh -v
