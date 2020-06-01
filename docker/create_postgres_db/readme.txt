Docker Official Images
https://hub.docker.com/_/postgres?tab=description
https://hub.docker.com/r/dpage/pgadmin4/

# copy the images
docker pull postgres
docker pull dpage/pgadmin4

# create folder to bind volume
mkdir pg_data
# create network
docker network create --driver bridge pg_network

# run the PostgreSQL container
docker run -d \
    --name my-postgres \
    -e POSTGRES_PASSWORD=mysecretpassword \
    -p 5432:5432 \
    --net pg_network \
    -v $PWD/pg_data:/var/lib/postgresql/data \
    postgres
#default user will be postgres

# run PGAdmin container
docker run -d \
    --name my-pgadmin \
    -e PGADMIN_DEFAULT_EMAIL=user@domain.com \
    -e PGADMIN_DEFAULT_PASSWORD=mysecretpassword \
    -p 80:80 \
    --net pg_network \
    dpage/pgadmin4



# Create all above using docker-compose
docker-compose up --build -d
# check
docker-compose ps