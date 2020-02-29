nbaezc@outlook.com

Para hacer lookup

Necesito conocer la estructura de los dos

1. Documento izquierdo (Posicionado) A
	id
	idB

2. Documento derecho B
id
nombre

bd.coleccion.filter
bd.coleccion.sort
bd.coleccion.lookup { }

from: B
localfield: idB
foreignfield: id
as: 'resultados'

Coleccion A

{id: 1, idB: 2}
{id: 2, idB: 2}
{id: 3, idB: 3}

Coleccion B

{id: 1, idB: 'Fulano'}
{id: 2, idB: 'Sutano'}
{id: 3, idB: 'Perengano'}

Lookup

{ id: 1 ,idB2:2 , resultado:[{id:2 , nombre:'Sutano'} ]}
