# Voila dashboards for Docker by luismi

FROM ubuntu

# Get apt packages
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y tzdata
RUN apt-get update && apt-get install -y \
build-essential zlib1g-dev libncurses5-dev \
libgdbm-dev libnss3-dev libssl-dev libreadline-dev \
libffi-dev wget python3.7 python-dev \
gdebi libopenmpi-dev python3-pip


# Get pip packages
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN python3 --version
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy all app files
COPY . .

CMD ["voila", "VortexApp.ipynb"]
