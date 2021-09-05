FROM bioconductor/bioconductor_docker:RELEASE_3_13

LABEL authors="dyzhang32@gmail.com" \
      maintainer="dyzhang32@gmail.com"

# install R packages
RUN Rscript -e 'install.packages("remotes")' \
    -e 'remotes::install_cran("BiocManager")' \
    -e 'remotes::install_github(c("dzhang32/rutils"))'

# Switch user to rstudio to initialise config files
USER rstudio

# setup R and git configuration files
RUN mkdir -p /home/rstudio/.config/rstudio/ \
    && Rscript -e "rutils::setup_r_git()"

# Switch user back to root, otherwise connection to RStudio Server fails
USER root
