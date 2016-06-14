# docker-deluge


Running:

~~~ sh
docker run \
  --name deluge \
  -v /etc/localtime:/etc/localtime:ro \
  -v /data/services/deluge:/deluge \
  -v /data/services/sickrage/downloads:/tv \
  b225ccc/docker-deluge:latest
~~~
