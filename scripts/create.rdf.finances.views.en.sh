#!/bin/bash

saxonb-xslt -s /var/www/lib/worldbank-linkeddata/data/finances/finance/wc6g-9zmq.xml -xsl /var/www/lib/worldbank-linkeddata/scripts/xsl/finances-meta.xsl wbapi_lang=en pathToCountries=/var/www/lib/worldbank-linkeddata/data/indicators/en/countries.xml pathToLendingTypes=/var/www/lib/worldbank-linkeddata/data/indicators/en/lendingTypes.rdf pathToRegionsExtra=/var/www/lib/worldbank-linkeddata/data/regions-extra.rdf pathToMeta=/var/www/lib/worldbank-linkeddata/data/meta.rdf pathToCurrencies=/var/www/lib/worldbank-linkeddata/data/currencies.rdf > /var/www/lib/worldbank-linkeddata/data/finances/finance/wc6g-9zmq.rdf
echo "Created /var/www/lib/worldbank-linkeddata/data/finances/finance/wc6g-9zmq.rdf"

cat /var/www/lib/worldbank-linkeddata/data/finances/finances.datasets.txt | while read i ; do saxonb-xslt -s "/var/www/lib/worldbank-linkeddata/data/finances/finance/$i.xml" -xsl /var/www/lib/worldbank-linkeddata/scripts/xsl/financesObservations.xsl wbapi_lang=en pathToCountries=/var/www/lib/worldbank-linkeddata/data/indicators/en/countries.xml pathToLendingTypes=/var/www/lib/worldbank-linkeddata/data/indicators/en/lendingTypes.rdf pathToRegionsExtra=/var/www/lib/worldbank-linkeddata/data/regions-extra.rdf pathToMeta=/var/www/lib/worldbank-linkeddata/data/meta.rdf pathToCurrencies=/var/www/lib/worldbank-linkeddata/data/currencies.rdf > /var/www/lib/worldbank-linkeddata/data/finances/finance/$i.rdf ; echo "Created /var/www/lib/worldbank-linkeddata/data/finances/finance/$i.rdf" ; done
