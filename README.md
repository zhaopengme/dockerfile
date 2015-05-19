

    docker rm -f wordpress wordpress-data  

    docker rmi -f ubermuda/docker-wordpress ubermuda/docker-wordpress-data


docker build -t ubermuda/docker-wordpress-data wordpress-data/
docker run \
    -v /c/Users/Code/User/Go/docker/dockerfile/wp/www:/var/www/wordpress/wp-content \
    --name wordpress-data \
    ubermuda/docker-wordpress-data

docker build -t ubermuda/docker-wordpress ./wordpress

docker run -d -P \
    --name wordpress \
    --volumes-from wordpress-data \
    ubermuda/docker-wordpress



    docker exec -it wordpress bash



     cd /var/www/wordpress/wp-content/