docker rm -f sentinel
#docker run -p 127.0.0.1:5432:5432 --name sinbad-pg -d sinbadtravel/sinbad-pg
docker run --net="host" \
-v $PWD/docker/rails/default:/etc/apache2/sites-available/default:ro \
-v $PWD:/home/ubuntu/webapp-dev \
--add-host *.lvh.me:127.0.0.1 \
--name sentinel -d lambdait/sentinel
#-v $PWD/docker/rails/sinbad.cl.conf:/etc/apache2/sites-enabled/sinbad.cl:ro \
#-v $PWD/docker/rails/plataformadeviajes.com:/etc/apache2/sites-enabled/plataformadeviajes.com:ro \
#--add-host sinbad.cl:127.0.0.1 \
#--add-host www.sinbad.cl:127.0.0.1 \
#--add-host plataformadeviajes.com:127.0.0.1 \
#--add-host www.plataformadeviajes.com:127.0.0.1 \
#-v $PWD:/home/ubuntu/webapp \
#-v $PWD:/home/ubuntu/webapp-staging \