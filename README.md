# robinh_card

Personal business card written in flutter for web.

## Live version
[robinh.xyz](https://robinh.xyz/) - running on a lightweight docker PHP container.

## Starting the web application

### Method 1 - Python Webserver
Dependencies: 
- working Python installation

Steps:
1. call ```flutter build web``` in the root folder"
2. call ```python -m http.server 8000``` in /build/web/ directory
3. open (localhost)[http://localhost:8000/] in browser

### Method 2 - Flutter run
Dependencies: 
- installation of flutter sdk in beta channel (for now) and "Flutter for web" enabled (for more information, please follow this [link](https://flutter.dev/docs/get-started/web)

Steps:
1. call ```flutter run --release``` in the root folder
   alternative: ```flutter run -d chrome --web-hostname localhost --web-port 5000```
2. open (localhost)[http://localhost:8000/] in browser