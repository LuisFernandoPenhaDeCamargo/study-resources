betking.usuarios_login
$ ./BlackBox <user_id> 11 1 0 0

---
---

database.py
Tem alterações minhas
self_updater.py
Tem alterações minhas
services.py
Tem alterações minhas

---

response: {'status': 'OK', 'games_allowed': ['arn:aws:s3:::orion-games/version', 'arn:aws:s3:::orion-games/finish-update.sh', 'arn:aws:s3:::orion-games/finish-update-mexico.sh', 'arn:aws:s3:::orion-games/pt/lobby.tar', 'arn:aws:s3:::orion-games/pt/lobby-mexico.tar', 'arn:aws:s3:::orion-games/pt/version', 'arn:aws:s3:::orion-games/utils/*', 'arn:aws:s3:::orion-games/pt/network-setup.tar', 'arn:aws:s3:::orion-games/pt/alpha-dragon-w000.tar', 'arn:aws:s3:::orion-games/pt/alpha-buffalo-w000.tar', 'arn:aws:s3:::orion-games/pt/lion.tar', 'arn:aws:s3:::orion-games/pt/alpha-royal-tiger-w000.tar', 'arn:aws:s3:::orion-games/pt/alpha-wacamole-w000.tar', 'arn:aws:s3:::orion-games/pt/alpha-dragon-s000.tar', 'arn:aws:s3:::orion-games/pt/alpha-royal-dragon-w000.tar'], 'logos_allowed': 'arn:aws:s3:::orion-games/logos/10/2276/*', 'videos_allowed': 'arn:aws:s3:::orion-games/videos/10/2276/*'}

signed_url: arn:aws:s3:::orion-games/logos/10/2276/*

request: {'status': 'OK', 'games_allowed': ['arn:aws:s3:::orion-games/version', 'arn:aws:s3:::orion-games/finish-update.sh', 'arn:aws:s3:::orion-games/finish-update-mexico.sh', 'arn:aws:s3:::orion-games/pt/lobby.tar', 'arn:aws:s3:::orion-games/pt/lobby-mexico.tar', 'arn:aws:s3:::orion-games/pt/version', 'arn:aws:s3:::orion-games/utils/*', 'arn:aws:s3:::orion-games/pt/network-setup.tar', 'arn:aws:s3:::orion-games/pt/alpha-dragon-w000.tar', 'arn:aws:s3:::orion-games/pt/alpha-buffalo-w000.tar', 'arn:aws:s3:::orion-games/pt/lion.tar', 'arn:aws:s3:::orion-games/pt/alpha-royal-tiger-w000.tar', 'arn:aws:s3:::orion-games/pt/alpha-wacamole-w000.tar', 'arn:aws:s3:::orion-games/pt/alpha-dragon-s000.tar', 'arn:aws:s3:::orion-games/pt/alpha-royal-dragon-w000.tar'], 'logos_allowed': 'arn:aws:s3:::orion-games/logos/10/2276/*', 'videos_allowed': 'arn:aws:s3:::orion-games/videos/10/2276/*'}

---

request: {'status': 'OK', 'games_allowed': ['arn:aws:s3:::orion-games/version', 'arn:aws:s3:::orion-games/finish-update.sh', 'arn:aws:s3:::orion-games/finish-update-mexico.sh', 'arn:aws:s3:::orion-games/pt/lobby.tar', 'arn:aws:s3:::orion-games/pt/lobby-mexico.tar', 'arn:aws:s3:::orion-games/pt/version', 'arn:aws:s3:::orion-games/utils/*', 'arn:aws:s3:::orion-games/pt/network-setup.tar', 'arn:aws:s3:::orion-games/pt/alpha-dragon-w000.tar', 'arn:aws:s3:::orion-games/pt/alpha-buffalo-w000.tar', 'arn:aws:s3:::orion-games/pt/lion.tar', 'arn:aws:s3:::orion-games/pt/alpha-royal-tiger-w000.tar', 'arn:aws:s3:::orion-games/pt/alpha-wacamole-w000.tar', 'arn:aws:s3:::orion-games/pt/alpha-dragon-s000.tar', 'arn:aws:s3:::orion-games/pt/alpha-royal-dragon-w000.tar'], 'logos_allowed': 'arn:aws:s3:::orion-games/logos/10/2276/*', 'videos_allowed': 'arn:aws:s3:::orion-games/videos/10/2276/*'}

game: ['arn:aws:s3:::orion-games', 'version']

game_len: 2

folder: version

Origem: ['arn:aws:s3', 'orion-games'] Objeto: version

cmd = ['aws', 's3', 'sync', f's3://{bucket}/', self.sync_logos_folder, '--delete', '--exclude', '*', '--include', f'{self.logos_path}']
https://us-east-2.console.aws.amazon.com/s3/buckets/orion-games?region=us-east-2&bucketType=general&prefix=logos%2F10%2F2276%2F&showversions=false&tab=objects
https://manager.gerencia.games/logos/10

---
---

zoe-updater
git clone <URL>
mariadb -u root -p<senha> -e 'CREATE DATABASE IF NOT EXISTS zoeslots;'
Obter o dump
mariadb -u root -p<senha> zoeslots < <dump>.sql
mariadb -u root -p<senha> -e "CREATE USER 'orion'@'localhost' IDENTIFIED BY 'Bl4ckBox1337';"
mariadb -u root -p<senha> -e "GRANT ALL PRIVILEGES ON zoeslots.* TO 'orion'@'localhost';" <- Confirmar os privilégios
mariadb -u root -p<senha> -e 'FLUSH PRIVILEGES;' <- É necessário?
Consigo emender as queries?
mkdir ~/data/
mkdir ~/data/games
mkdir ~/data/games-sync
mkdir ~/data/logos-sync
api.py: comentar da linha 49 a linha 54 e adicionar a seguinte linha `token =  fee5d4acdd915f9032b7d6a850f262deedef8532debf24a8cfbb836d3836c52323033d426437df25191a2e6192e330aa41c1a69772575362b7e7201277ae367d`
Caso vocẽ não tenha a zoe-game-api, orion-data-api, caixa (não lembro o nome), watchdog (não lembro o nome) e o zoe-updater instalados globalmente
agent.py: comente a linha 362 e 363

sudo apt install mariadb-server -y
mariadb --version
sudo snap install dbeaver-ce
dbeaver --version
sudo apt install meld
meld --version

git pull
git clone <URL>
git branch -a
git switch -c <nome_da_branch>
git push -u origin <nome-da-branch>

sudo mariadb -> Não configurei uma senha root
ALTER USER 'root'@'localhost' IDENTIFIED BY '260490Ab!';
FLUSH PRIVILEGES;
mariadb -u root -p<senha> -e '<query>'

.partition x .split

npm publish
npm unpublish @zoeslots/zoe-updater@0.1.0-alpha.1

aws s3 sync s3://orion-games/logos/126/2113/ /data/logos-sync --delete --dryrun

---
---

betking
b3tk1ng2014

ssh orion-data-server@137.184.204.192

---
---

Buckets -> documentar

2025/03/11 16:04:55 INFO   : sync aws logos                                                                                                                                                                                            
2025/03/11 16:04:56 INFO   : ---- GET ALLOWED GAMES: SUCCESSFULLY!! ----                                                                                                                                                               
2025/03/11 16:04:56 INFO   : Logos Origem: orion-games/logos/126/2113/                                                                                                                                                                 
2025/03/11 16:04:58 ERROR  : Logos error [Errno 2] No such file or directory: '/data/games/logos'                                                                                                                                      
Traceback (most recent call last):                                                                                                                                                                                                     
  File "/usr/lib/node_modules/@zoeslots/zoe-updater/logos.py", line 37, in run                                                                                                                                                         
    self._check()                                                                                                                                                                                                                      
  File "/usr/lib/node_modules/@zoeslots/zoe-updater/logos.py", line 63, in _check                                                                                                                                                      
    self._copyToGames()                                                                                                                                                                                                                
  File "/usr/lib/node_modules/@zoeslots/zoe-updater/logos.py", line 90, in _copyToGames                                                                                                                                                
    destination_files = set(os.listdir(destination_folder))                                                                                                                                                                            
FileNotFoundError: [Errno 2] No such file or directory: '/data/games/logos'

Quem deveria criar o diretório acima?

credenciais aws ligadas somente ao root?