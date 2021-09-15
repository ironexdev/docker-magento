FROM erikdubbelboer/phpredisadmin:v1.13.2

RUN chown www-data:www-data -R /src

RUN chmod 770 /src

USER www-data

EXPOSE 8080

ENTRYPOINT ["tini","--","php","-S","0.0.0.0:8080"]