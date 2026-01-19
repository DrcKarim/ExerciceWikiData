Visualisation de données avec Wikidata & RAWGraphs
=====================================================

**Exercice – Datavisualisation (Séance 01)****Étudiant : Karim Bouchaane**

Objectif de l'exercice
-------------------------

Cet exercice consiste à :

1.  **Créer une requête SPARQL** dans Wikidata Query Service contenant des données :
    
    *   quantitatives
        
    *   catégorielles
        
    *   temporelles
        
    *   spatiales
        
    *   visuelles
        
2.  **Visualiser les résultats** sous forme de graphique directement depuis Wikidata.
    
3.  **Exporter les mêmes données** dans l’outil **RAWGraphs** pour créer un second graphique.
    
4.  **Intégrer les deux visualisations** dans une page web unique.
    
5.  **Publier le résultat en ligne** via GitHub Pages.
    

1. Requête SPARQL utilisée
-----------------------------

La requête suivante extrait des informations sur les **villes françaises**, incluant :

*   leur nom (cityLabel)
    
*   leur population (population)
    
*   leur région (regionLabel)
    
*   leur date de création (inception)
    
*   leurs coordonnées géographiques (coord)
    
*   une image liée à la ville (image)
    
```bash
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
    bd:serviceParam wikibase:language "fr".
  }
}
ORDER BY DESC(?population)
LIMIT 20
```

### Pourquoi cette requête ?

Cette requête a été conçue pour inclure différents types de données nécessaires à une bonne datavisualisation :

Type de donnéeChamp utiliséJustification**Quantitative**populationValeur numérique permettant des graphiques (bar chart, bubble chart).**Catégorielle**regionLabelPermet la segmentation par région.**Temporelle**inceptionAjoute le contexte historique.**Spatiale**coordExploitable pour des cartes ou graphiques géo-spatiaux.**Visuelle**imageAjoute un aspect multimédia (optionnel).

  2. Visualisation via Wikidata Query Service
----------------------------------------------

Wikidata propose une visualisation intégrée via un **iframe**.Ce graphique est affiché dans la page web à l’aide de ce code intégré :

 ```bash
 style="width:100%; height:500px;"    src="https://query.wikidata.org/embed.html#...[URL abrégée]"    referrerpolicy="origin"    sandbox="allow-scripts allow-same-origin allow-popups"> 
```
  3. Visualisation via RAWGraphs
---------------------------------

Les données ont ensuite été exportées sous forme de **CSV**, puis importées dans **RAWGraphs** pour générer un **diagramme en barres** :

*   **X-axis** : cityLabel
    
*   **Size (Y)** : population
    
*   **Color** : regionLabel
    

L'image exportée (viz.png) est intégrée dans la page web.

 4. Intégration dans une page web
-----------------------------------

La page Web contient :

1.  Le graphique interactif provenant de Wikidata
    
2.  Le graphique RAWGraphs exporté en PNG
    

Le tout avec un style CSS simple et propre.

=> Voir le fichier : index.html

   5. Publication GitHub Pages
------------------------------

La page web complète est disponible ici :

=> [**https://drckarim.github.io/ExerciceWikiData/**](https://drckarim.github.io/ExerciceWikiData/)

  Structure du projet
----------------------

 ```bash
├── index.html  
├── viz.png          # Graphique RAWGraphs  
└── README.md  
 ```

 Conclusion
------------

Cet exercice montre :

*   la capacité à interroger Wikidata avec SPARQL
    
*   la capacité à manipuler et visualiser des données
    
*   l’intégration de visualisations multiples dans une page web
    
*   la publication d’un mini-projet en ligne
    