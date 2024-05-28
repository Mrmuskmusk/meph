modify the location parameter in your nginx conf by:

1. ```sudo vim  /etc/nginx/sites-available/default```


2. replace the location ... variable content with:

```
 location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
```

run:

```sudo bash setup.sh```


