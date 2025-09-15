# TTYD

- Init

```bash
git init
git add .
git commit -m "ttyd"
git branch -M main
git remote add origin https://github.com/linjixing/ttyd.git
git push -u origin main
```

- Clone

```bash
git clone https://github.com/linjixing/ttyd.git
```

## Docker

### Variables

```bash
USER="linjixing"
PASSWD="password"
CONTAINER="ttyd"
SSH_PORT="0.0.0.0:22022:22"
TTYD_PORT="0.0.0.0:7681:7681"
```

### Build

```bash
docker build -t $CONTAINER .
```

### Run as root

- Local

```bash
docker run -dit --name $CONTAINER -h $CONTAINER \
  -e PASSWD=$PASSWD \
  -p $SSH_PORT -p $TTYD_PORT \
  $CONTAINER
```

- Docker Hub

```bash
docker run -dit --name $CONTAINER -h $CONTAINER \
  -e PASSWD=$PASSWD \
  -p $SSH_PORT -p $TTYD_PORT \
  linjixing/$CONTAINER
```

- GitHub Container Registry

```bash
docker run -dit --name $CONTAINER -h $CONTAINER \
  -e PASSWD=$PASSWD \
  -p $SSH_PORT -p $TTYD_PORT \
  ghcr.io/linjixing/$CONTAINER
```

### Run as $USER

- Local

```bash
docker run -dit --name $CONTAINER -h $CONTAINER \
  -e USER=$USER -e PASSWD=$PASSWD \
  -p $SSH_PORT -p $TTYD_PORT \
  $CONTAINER
```

- Docker Hub

```bash
docker run -dit --name $CONTAINER -h $CONTAINER \
  -e USER=$USER -e PASSWD=$PASSWD \
  -p $SSH_PORT -p $TTYD_PORT \
  linjixing/$CONTAINER
```

- GitHub Container Registry

```bash
docker run -dit --name $CONTAINER -h $CONTAINER \
  -e USER=$USER -e PASSWD=$PASSWD \
  -p $SSH_PORT -p $TTYD_PORT \
  ghcr.io/linjixing/$CONTAINER
```

## Web SSH Service [TTYD](http://localhost:7681)

> - Run as root
>
>   - user: **root**
>   - password: **$PASSWD**
>
> - Run as USER
>
>   - user: **$USER**
>   - password: **$PASSWD**
