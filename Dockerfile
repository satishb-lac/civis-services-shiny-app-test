FROM civisanalytics/datascience-r:4.0.4

RUN apt-get update && apt-get install -y \
    git

COPY ./requirements.txt /requirements.txt
RUN Rscript -e "packages <- readLines('/requirements.txt'); install.packages(packages)"

COPY ./app/app.r ./app/app.r
COPY ./app/ui.r ./app/ui.r
COPY entrypoint.sh /
RUN chmod 755 /entrypoint.sh

EXPOSE 3838

ENTRYPOINT ["/entrypoint.sh"]
