nginx:
  pkg:
    - installed
  service.running:
        - require:
            - pkg: nginx
        - watch:
            - pkg: nginx
            - file: /etc/nginx/nginx.conf
            - file: /etc/nginx/sites-enabled/default
            - file: /etc/nginx/sites-enabled/website


/var/www:
    file.directory:
        - user: www-data
        - require:
            - pkg: nginx


/var/www/index.html:
    file.managed:
        - user: www-data
        - mode: 644
        - source: salt://webserver/index.html
        - require:
            - pkg: nginx


/etc/nginx/nginx.conf:
    file.managed:
        - source: salt://webserver/nginx.conf
        - require:
            - pkg: nginx


/etc/nginx/sites-enabled/website:
    file.managed:
        - source: salt://webserver/website
        - require:
            - pkg: nginx


/etc/nginx/sites-enabled/default:
    file.absent:
        - require:
            - pkg: nginx


/etc/nginx/sites-available/website:
    file.symlink:
        - target: /etc/nginx/sites-available/website
        - require:
            - file: /etc/nginx/sites-enabled/website
