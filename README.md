# themealdb

### Objetivo de la aplicación
Crear una app de recetas en Flutter que permita buscar una receta por nombre, ver detalles de cada receta, e incluir una imagen y lista de ingredientes.

## Features

1. Pantalla de inicio con una barra de búsqueda.
- Entrada para el nombre de la receta.
- Botón para iniciar la búsqueda.
2. Lista de recetas basada en los resultados de la búsqueda.
- Cada resultado muestra el nombre y la imagen de la receta.
3. Detalle de la receta al hacer clic en un resultado.
- Mostrar la imagen de la receta, ingredientes y pasos.

## Estructura del proyecto
<img width="599" alt="image" src="https://github.com/user-attachments/assets/377999f6-37a9-494b-a965-754bc108d48f">

## API Reference

#### Get meals

```http
  GET themealdb.com/api/json/v1/1/search.php?s=
```

| Parametro | Tipo     | Descripción                       |
| :-------- | :------- | :-------------------------------- |
| `s`      | `string` | **Required**. Nombre de la comida a buscar |



## Tech Stack

**Client:** Flutter, Packages: http, linkfy_text, url_launcher.

**API:** API Rest

## Screens
![themealdb](https://github.com/user-attachments/assets/b130afc5-f1d0-4867-abba-18634fe4e5fa)

