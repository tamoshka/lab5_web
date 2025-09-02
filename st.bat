@echo off
echo Starting Gunicorn server...
start /B gunicorn --bind 127.0.0.1:5000 wsgi:app

timeout /t 5 /nobreak

echo start client
python client.py

timeout /t 5 /nobreak

echo Killing Gunicorn process...
taskkill /f /im gunicorn.exe
taskkill /f /im python.exe

exit /b 0
