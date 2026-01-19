SELECT ?city ?cityLabel ?population ?regionLabel ?inception ?coord ?image
WHERE {
  ?city wdt:P31 wd:Q515 ;
        wdt:P17 wd:Q142 ;
        wdt:P1082 ?population ;
        wdt:P131 ?region ;
        wdt:P571 ?inception ;
        wdt:P625 ?coord .
  OPTIONAL { ?city wdt:P18 ?image }

  SERVICE wikibase:label {
    bd:serviceParam wikibase:language "fr"
  }
}
ORDER BY DESC(?population)
LIMIT 20
