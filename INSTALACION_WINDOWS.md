# Guía de Instalación y Ejecución en Windows

Esta guía te ayudará a configurar y ejecutar el proyecto Flask en Windows.

## Requisitos Previos

1. **Python 3.8 o superior**
   - Descarga desde: https://www.python.org/downloads/
   - Durante la instalación, marca la opción "Add Python to PATH"

2. **Git** (opcional, si clonaste el repositorio)
   - Descarga desde: https://git-scm.com/download/win

## Pasos de Instalación

### 1. Verificar Python

Abre PowerShell o CMD y verifica que Python esté instalado:

```powershell
python --version
```

Deberías ver algo como: `Python 3.11.x`

### 2. Navegar al directorio del proyecto

```powershell
cd D:\GIT\BigDataApp_2025_s2
```

### 3. Crear entorno virtual (recomendado)

```powershell
python -m venv venv
```

### 4. Activar el entorno virtual

```powershell
venv\Scripts\activate
```

Verás que el prompt cambia a `(venv)`.

### 5. Instalar dependencias

```powershell
pip install -r requirements.txt
```

### 6. Configurar variables de entorno

Crea un archivo `.env` en la raíz del proyecto (copia `.env.example` y renómbralo):

```powershell
copy .env.example .env
```

Edita el archivo `.env` con tus credenciales:

```
SECRET_KEY=tu_clave_secreta_aqui
MONGO_URI=mongodb+srv://usuario:password@cluster.mongodb.net/?retryWrites=true&w=majority
MONGO_DB=nombre_de_tu_base_de_datos
MONGO_COLECCION=usuario_roles
ELASTIC_CLOUD_URL=https://tu-cluster.es.region.cloud.es.io:9243
ELASTIC_API_KEY=tu_api_key_de_elasticsearch
```

## Ejecutar la Aplicación

### Opción 1: Usando el script .bat (Recomendado)

Simplemente haz doble clic en `ejecutar.bat` o ejecuta:

```powershell
.\ejecutar.bat
```

### Opción 2: Manualmente

1. Activa el entorno virtual:
```powershell
venv\Scripts\activate
```

2. Ejecuta la aplicación:
```powershell
python app.py
```

### Opción 3: Con Flask directamente

```powershell
flask run
```

## Acceder a la Aplicación

Una vez iniciada, abre tu navegador y ve a:

```
http://localhost:5000
```

O

```
http://127.0.0.1:5000
```

## Rutas Disponibles

- `/` - Página de inicio (Landing page)
- `/about` - Página Acerca de
- `/login` - Página de inicio de sesión
- `/admin` - Área de administración (requiere login)
- `/listar-usuarios` - API para listar usuarios (JSON)

## Solución de Problemas

### Error: "python no se reconoce como comando"

- Asegúrate de que Python esté en el PATH
- Reinstala Python marcando "Add Python to PATH"
- O usa `py` en lugar de `python`:

```powershell
py -m venv venv
py app.py
```

### Error: "ModuleNotFoundError"

- Asegúrate de tener el entorno virtual activado
- Reinstala las dependencias: `pip install -r requirements.txt`

### Error de conexión a MongoDB o ElasticSearch

- Verifica que las credenciales en `.env` sean correctas
- Verifica tu conexión a internet
- Revisa que los servicios en la nube estén activos

### Puerto 5000 ya está en uso

Puedes cambiar el puerto en `app.py`:

```python
app.run(debug=True, host='0.0.0.0', port=5001)
```

## Desactivar el Entorno Virtual

Cuando termines de trabajar:

```powershell
deactivate
```

## Estructura del Proyecto

```
BigDataApp_2025_s2/
├── app.py                 # Aplicación principal Flask
├── requirements.txt       # Dependencias del proyecto
├── .env                  # Variables de entorno (crear manualmente)
├── .env.example          # Ejemplo de variables de entorno
├── ejecutar.bat          # Script para ejecutar en Windows
├── Helpers/              # Módulos auxiliares
│   ├── mongoDB.py       # Conexión y operaciones MongoDB
│   ├── elastic.py       # Conexión y operaciones ElasticSearch
│   └── funciones.py     # Funciones auxiliares
├── templates/            # Plantillas HTML
│   ├── login.html
│   ├── admin.html
│   └── ...
└── static/              # Archivos estáticos (CSS, JS, imágenes)
```

## Notas Adicionales

- El modo debug está activado por defecto (útil para desarrollo)
- Las sesiones se guardan en memoria (se pierden al reiniciar el servidor)
- Asegúrate de no subir el archivo `.env` a Git (debe estar en `.gitignore`)

