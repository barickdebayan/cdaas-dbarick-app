# Notes
1. This deployment is tested in an environment behind a proxy server http://172.30.180.23:8080
2. To change proxy settings , please modify the files .mvn/jvm.config & .gitlab-ci.yml
3. Two branch is created : 'develop' for development' -> 'main' for production
4. The following variables need to be defined as environment variable in gitlab project to use custom container registry : $MY_CI_REGISTRY , $MY_CI_REGISTRY_USER , $MY_CI_REGISTRY_PASSWORD , $MY_CI_REGISTRY_IMAGE ( to use standard gitlab CI variables :  CI_REGISTRY , CI_REGISTRY_IMAGE , CI_REGISTRY_USER , CI_REGISTRY_PASSWORD )
