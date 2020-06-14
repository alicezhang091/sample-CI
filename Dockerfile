FROM nginx:1.17.10
ARG CI_ENV=noci
ARG GIT_COMMIT=git_commit_undefined
ARG GIT_BRANCH=git_branch_undefined
ARG VERSION=not_versioned
COPY index.html /usr/share/nginx/html/
RUN echo "version=$VERSION" > /usr/share/nginx/html/version.html && echo "commit=$GIT_COMMIT" >> /usr/share/nginx/html/version.html && echo "branch=$GIT_BRANCH" >> /usr/share/nginx/html/version.html
RUN chmod 0644 -R /usr/share/nginx/html/*
LABEL git_commit $GIT_COMMIT
LABEL git_branch $GIT_BRANCH
LABEL ci_environment $CI_ENV
LABEL version $VERSION