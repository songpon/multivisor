FROM digitalorganic/ubuntu-python:2004.2718

ENV MULTIVISOR_SECRET_KEY=change-me-my-secret

# node and vim for debug
RUN apt update \
 && apt install -y \
    curl \
    gnupg \
    gcc \
    g++ \
    make \
    vim \
 && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
 && apt install -y nodejs \
 && rm -rf /var/lib/apt/lists/*

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip
RUN pip install -e . 

RUN npm i && npm run build


EXPOSE 22000

CMD [ "bash","start.sh" ]
