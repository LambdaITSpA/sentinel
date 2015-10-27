docker rm -f sentinel
docker run --net="bridge" \
-v $PWD/docker/rails/default:/etc/apache2/sites-available/default:ro \
-v $PWD/docker/rails/clientsentinel.cl:/etc/apache2/sites-enabled/clientsentinel.cl:ro \
--add-host clientsentinel.cl:127.0.0.1 \
--add-host *.clientsentinel.cl:127.0.0.1 \
-v $PWD/../../master/sentinel:/home/ubuntu/webapp \
--name sentinel -d lambdait/sentinel
#-v $PWD/docker/rails/sinbad.cl.conf:/etc/apache2/sites-enabled/sinbad.cl:ro \
#--add-host sinbad.cl:127.0.0.1 \
#--add-host www.sinbad.cl:127.0.0.1 \