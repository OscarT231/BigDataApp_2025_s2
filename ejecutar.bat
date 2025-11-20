@echo off
echo ========================================
echo   Iniciando aplicacion Flask
echo ========================================
echo.

REM Verificar si existe el archivo .env
if not exist .env (
    echo [ADVERTENCIA] No se encontro el archivo .env
    echo Por favor, crea un archivo .env basado en .env.example
    echo.
    pause
    exit /b 1
)

REM Verificar si existe el entorno virtual
if not exist venv (
    echo Creando entorno virtual...
    python -m venv venv
    echo.
)

REM Activar entorno virtual
echo Activando entorno virtual...
call venv\Scripts\activate.bat

REM Verificar si las dependencias estan instaladas
echo Verificando dependencias...
pip show flask >nul 2>&1
if errorlevel 1 (
    echo Instalando dependencias...
    pip install -r requirements.txt
    echo.
)

REM Ejecutar la aplicacion
echo Iniciando servidor Flask...
echo.
python app.py

pause

