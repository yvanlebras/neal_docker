FROM rocker/shiny:4.2.0

RUN apt-get update --fix-missing -y \
    && apt-get install -y software-properties-common aptitude


RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup && \
    echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache && \
    apt-get -qq update && apt-get install --no-install-recommends -y gdal-bin proj-bin libgdal-dev libproj-dev net-tools procps libcurl4-openssl-dev libxml2-dev libssl-dev openjdk-11-jdk libgeos-dev texlive-xetex  texlive-fonts-recommended texlive-latex-recommended lmodern python3-pip python-dev && \
	R CMD javareconf
	
RUN apt-get install -y r-cran-rjava
RUN Rscript -e "install.packages('rJava')"

RUN R -e 'install.packages("ggplot2", dependencies='TRUE')'
RUN R -e 'install.packages("shiny", dependencies='TRUE')'
RUN R -e 'install.packages("shinyjs", dependencies='TRUE')'
RUN R -e 'install.packages("shinyBS", dependencies='TRUE')'
RUN R -e 'install.packages("shinyFiles", dependencies='TRUE')'
RUN R -e 'install.packages("shinythemes", dependencies='TRUE')'
RUN R -e 'install.packages("shinydashboard", dependencies='TRUE')'
RUN R -e 'install.packages("shinydashboardPlus", dependencies='TRUE')'
RUN R -e 'install.packages("shinyWidgets", dependencies='TRUE')'
RUN R -e 'install.packages("shinyThings", dependencies='TRUE')'
RUN R -e 'install.packages("devtools", dependencies='TRUE')'
RUN R -e 'install.packages("keys", dependencies='TRUE')'
RUN R -e 'install.packages("imola", dependencies='TRUE')'
RUN R -e 'install.packages("tuneR", dependencies='TRUE')'
RUN R -e 'install.packages("seewave", dependencies='TRUE')'
RUN R -e 'install.packages("soundecology", dependencies='TRUE')'
RUN R -e 'install.packages("stringr", dependencies='TRUE')'
RUN R -e 'install.packages("viridis", dependencies='TRUE')'
RUN R -e 'install.packages("profvis", dependencies='TRUE')'
RUN R -e 'install.packages("dplyr", dependencies='TRUE')'
RUN R -e 'install.packages("png", dependencies='TRUE')'
RUN R -e 'install.packages("grid", dependencies='TRUE')'
RUN R -e 'install.packages("rgeos", dependencies='TRUE')'
RUN R -e 'install.packages("maptools", dependencies='TRUE')'
RUN R -e 'devtools::install_github("gadenbuie/shinyThings")'
RUN R -e 'devtools::install_github("curso-r/auth0")'




RUN R -e 'Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS="true")'

RUN mkdir /build_zone
ADD . /build_zone
WORKDIR /build_zone

RUN wget http://ftp.debian.org/debian/pool/main/u/udunits/libudunits2-0_2.2.20-1+b1_amd64.deb -P /opt/
RUN wget http://ftp.br.debian.org/debian/pool/main/u/udunits/libudunits2-dev_2.2.20-1+b1_amd64.deb -P /opt/


RUN dpkg -i /opt/libudunits2-0_2.2.20-1+b1_amd64.deb
RUN apt-get install -f
RUN dpkg -i /opt/libudunits2-dev_2.2.20-1+b1_amd64.deb
RUN apt-get install -f


RUN R -e 'remotes::install_local("neal-master.tar.zip", upgrade="never", INSTALL_opts = "--no-staged-install", ask = FALSE)'

EXPOSE 3838

# create a neal dedicated space for shiny-server
RUN mkdir /srv/shiny-server/sample-apps/audio
COPY neal-master/ /srv/shiny-server/sample-apps/audio/.

# clean audio files folder
RUN  rm /opt/shiny-server/samples/sample-apps/audio/www/tmp/*
COPY shiny-server.sh /usr/bin/shiny-server.sh
RUN chmod 777 /usr/bin/shiny-server.sh
CMD ["/usr/bin/shiny-server.sh"]
