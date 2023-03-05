shards install
crystal build src/main.cr

docker build --tag=scraper .
docker run --name scraper scraper
docker remove scraper > /dev/null 2>&1

rm -f main