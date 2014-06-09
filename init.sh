#!/bin/bash
if (echo $node_version); then
	echo "node version defined - we are good to build..."
	/bin/bash -c ". /.nvm/nvm.sh && nvm install $node_version"
else
	echo "node_version is undefined."
    exit
fi

pushd src
npm install
npm install -g mocha 
npm install chai
npm install should
mocha -R xunit | grep "<" > mocha.xml