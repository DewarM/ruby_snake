

exec("for file in specs/*.rb; do echo running $file; ruby $file; done")
