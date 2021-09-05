FROM bioconductor/bioconductor_docker:RELEASE_3_13

LABEL authors="dyzhang32@gmail.com" \
      maintainer="dyzhang32@gmail.com"

COPY --chown=rstudio:rstudio . /home/rstudio/bioc_docker

# install R packages
RUN Rscript /home/rstudio/bioc_docker/setup_r_packages.R

# Switch user to rstudio to initialise config files
USER rstudio

# setup R and git configuration files
RUN mkdir -p /home/rstudio/.config/rstudio/ \
    && Rscript -e "rutils::setup_r_git()"

# Switch user back to root, otherwise connection to RStudio Server fails
USER root
