# PowerBI Public Dashboards

## The way to publish and share your PowerBI dashboards via public url link. A great alternative to cast dashboards to chromecast combined with [greenscreen](https://github.com/groupon/greenscreen) and [startcast CLI](https://github.com/diequeiroz/start-chromecast-CLI)

Install python2.7 and pip

Install Python dependencies:
```
pip install -r requirements.txt
```

Install NodeJS and npm

Install NodeJs dependencies: 
```
npm install
``` 

Install Frontend dependencies:
```
npm run bower_install
``` 

Register an PowerBI app at https://dev.powerbi.com/apps using the following params:
- Redirect URL: http(s)://YOUR_HOST/authorize-callback
- Home Page URL: http(s)://YOUR_HOST/

Store the given Client ID and Client Secret.

Configure and run the app to autorize it to access your data:

```
export CLIENT_ID=your_app_client_id
export CLIENT_SECRET=your_app_client_secret
uwsgi --http :5000 --wsgi-file app.py
```

Access http(s)://YOUR_HOST/authorize and complete the OAuth2 flow.

Store the hash shown in http(s)://YOUR_HOST/authorize-callback. This is your user refresh_token.

Finish the configuration and run the app:

```
export CLIENT_ID=your_app_client_id
export CLIENT_SECRET=your_app_client_secret
export REFRESH_TOKEN=your_user_refresh_token
uwsgi --http :5000 --wsgi-file app.py
```

List the available dashboards: http(s)://YOUR_HOST/list-dashboards

Access your dashboard: http(s)://YOUR_HOST/?dashboard_id=your_dashboard_id

Update credentials in DC/OS service: powerbi-dashboards
