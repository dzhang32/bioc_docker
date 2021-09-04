FROM bioconductor/bioconductor_docker:RELEASE_3_13

LABEL authors="dyzhang32@gmail.com" \
      maintainer="dyzhang32@gmail.com"

COPY --chown=rstudio:rstudio . /home/rstudio/bioc_docker

# install R packages
RUN Rscript /home/rstudio/bioc_docker/setup_r_packages.R

USER rstudio

# setup R and git configuration files
RUN Rscript -e "rutils::setup_r_git()"
