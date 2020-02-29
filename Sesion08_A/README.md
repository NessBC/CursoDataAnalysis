###Conectandose a MongoDB Atlas.

#####El archivo .csv contiene una muestra de la información del estado de Aguascalientes, se han elegido solo algunso campos y un total de 100 registros.

 1. Se carga el archivo con un total de 101 registros, por lo que hay que eliminar el registro "null" que se carga.
   SORT  {_id:-1}

   Al registro null:
   Delete Document 

2. 	Sobre los 100 registros, encontrar la distribucion de la posblacion por genero de cada area geoestadisticas basicas (ageb) donde la poblacion sea mayor o igual a 50, solo de la manzana 1:
   FILTER		```{mza:"1",pobtot:{$gte:"50"} }```
   PROJECT		```{ageb:1,nom_ent:1, mza:1, pobtot:1, pobmas:1, pobfem:1 }```
   SORT		```{_id:-1}```


3. En Agregacion, encontrar el porcentaje de la relacion de hombres y mujeres. Tomar en cuenta que solo hay datos de Aguascalientes
    a. ```$match
 		{
  			nom_mun: /Total/,
  			nom_loc: /Total/
		}```

   b. ```$project
		{
		  nom_ent:1,
		  pobtot:1,
		  pobmas:1,
		  pobfem:1
		}```
   c. ```$addFields
		{
		   porcentajemas: {
		    $multiply:[ 
		      {$divide:[ 
		        {$toDecimal: "$pobmas"}, 
		        {$toDecimal: "$pobtot"}]
		    },100]},
		  porcentajefem: {
		    $multiply:[ 
		      {$divide:[ 
		        {$toDecimal: "$pobfem"}, 
		        {$toDecimal: "$pobtot"}]
		    },100]}
		  }```
	
Resultado:
   porcentajemas:48.66159885771766318198542442337358
   porcentajefem:51.33840114228233681801457557662642
