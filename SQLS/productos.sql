SELECT COUNT(*) FROM tiendarobert_bd_poblado.productos;

USE tiendarobert_bd_poblado;
UPDATE productos
SET updated_at = '2024-01-04 15:10:21', nombreProducto = 'Arroz blanco Del Campo 1kg NUEVO_n'
WHERE id = 4694;

INSERT INTO productos (
  id,
  codebar1,
  codebar2,
  codebar3,
  codealternativo,
  nombreProducto,
  categoria,
  familia,
  medida,
  proveedor1,
  proveedor2,
  proveedor3,
  activo,
  exento,
  caja,
  fraccionario,
  medidamh,
  contenedor,
  maximo,
  minimo,
  created_at
) VALUES (
  4698,
  '9099603082460',
  '1948219935180',
  NULL,
  NULL,
  'tt',
  '1',
  '1',
  '8',
  'Suministros Usulután Ltd.',
  NULL,
  'tt',
  'SI',
  'SI',
  'NO',
  'NO',
  '40',
  '20',
  '120',
  '40',
  '2024-01-04 10:15:30'
);
