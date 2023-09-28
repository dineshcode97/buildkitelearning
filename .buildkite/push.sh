if [ $$(buildkite-agent meta-data get approval) == "yes" ]; then
         cat <<- YAML | buildkite-agent pipeline upload
         steps:
           - label: "docker: Push Docker Imag"
             command: 
             - 'docker login -u dineshcode97 -p $PASS'
             - 'docker push $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG'
      YAML
fi
