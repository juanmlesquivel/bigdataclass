# The following command can be executed from inside the spark container to
# connect to the PostgreSQL DB, that can be loaded with db/run_image.sh
# This is a convenience in case access is needed from within the Spark
# container, mostly for troubleshooting. Remember the password assigned
# is testPassword
psql -h host.docker.internal -p 5433 -U postgres
