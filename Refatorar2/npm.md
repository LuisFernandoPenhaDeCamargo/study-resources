# NPM

### Sumário

- [Publicando Um Pacote](#publicando-pacote)
- [Comandos](#comandos)

# <a id="publicando-pacote"></a>Publicando Um Pacote

Primeiramente vamos observar que a primeira vez que você publica um pacote, utilizando um usuário npm, ele será automaticamente privado, a não ser que você especifique o contrário. Você pode verificar a privacidade de um pacote, logando na sua conta e ao selecionar o seu pacote, em packages, você pode verificar a privacidade do pacote como um todo e até verificar a privacidade das versões.

Para logar no npm, você deve utilizar o `npm login`, será solicitado o seu usuário, a sua senha e o e-mail vinculado ao usuário. Todo usuário do npm é pago.

Na hora de publicar um pacote, o contexto que é analisado é o do seu repositório local, a estrutura do seu projeto localmente. Ele vai analisar o seu arquivo **package.json** para verificar o que você deseja publicar:

- A chave `name` especifica o nome do seu pacote. `@usuário\pacote`, `usuário` é quando o seu pacote é vinculado a um usuário npm
- A chave `version` especifica a versão do seu pacote, após utilizar um valor específico para a versão, o npm não permite que você utilize essa valor novamente, mesmo que você despublique o seu pacote
    `número1.número2.número3-número4`**:** o npm considera como a versão mais atual, aquela que possui o maior `número1` a esquerda, depois o maior `número2` ao meio, depois o maior `número3` antes do traço. O traço e o `número4` após ele são utilizados quando você quer publicar uma versão que não é considerada a latest, versões de release candidate, por exemplo
- A chave `bin` especifica um binário, é utilizada quando você quer publicar um executável
- A chave `files` especifica os arquivos que você deseja publicar, quando ela está presente, todos os arquivos que não estão presentes no valor dessa chave não são incluídos no pacote. Com exceção de arquivos que sempre são inclusos no seu pacote, como o **package.json** e o **README.md**

O arquivo **.gitignore** é considerado na hora de publicar pacotes, os arquivos ignorados não são incluídos em seu pacote. Caso o seu projeto tenha um arquivo **.npmignore**, ele é utilizado no lugar do arquivo **.gitignore**. Ambos os arquivos não são incluídos no pacote.

A permissão que o usuário atual possui influência a publicação de pacotes. Eu precisei logar como super usuário para conseguir incluir o meu binário no pacote. Aparentemente as permissões são propagadas para o pacote.

# <a id="comandos"></a>Comandos

+ `npm pack .`**:** empacota o projeto (você deve estar no nível superior do projeto), com isso, você pode verificar o que vai ser publicado quando você for realizar a ação de publicação
+ `npm i @usuário/pacote`**:** insta-la a versão atual (a de maior numeração) da categoria latest, no diretório atual
+ `npm install @usuário/pacote`**:** insta-la a versão atual (a de maior numeração) da categoria latest, no diretório atual. É intessante utilizar este comando para verificar qual pacote está sendo utilizado sem a especificação de versão, para confirmar se você publicou uma versão rc com sucesso (versões que não são da categoria latest não podem ser obtidas sem serem especificadas)
+ `npm i @usuário/pacote@versão`**:** instala a versão especificada do pacote. Para instalar versões rc, você precisa especificá-las
+ `npm install -g @usuário/pacote`**:** a opção `g` especifica que você quer instalar o pacote globalmente (há um diretório específico no qual ele será colocado). O diretório mencionado anteriormente depende da estrutura de arquivos, mas quando você utiliza o nvm, normalmente é algo do gênero **.nvm/versions/node/versão_do_node/lib/node_modules**
+ `npm list -g @usuário/pacote`**:** exibe aonde o pacote está instalado e qual é a versão dele (se ele estiver instalado globalmente, se atente a opção `g`)
+ `npm publish`**:** empacota o projeto e publica o pacote. Para publicar uma versão rc, você deve utilizar a opção `--tag` seguida do valor `rc`. Por exemplo, `npm publish --tag rc`
+ `npm unpublish @usuário/pacote@versão`**:** despublica a versão do pacote. **Tome cuidado, pois se você utilizar este comando sem uma** `versão`**, o pacote inteiro será despublicado**. Para pacotes que foram publicados a mais de 24 horas, você deve utilizar a opção `--force`

Se em seu **package.json**, o arquivo estiver especificado em `files`, ele será incluído em seu pacote, mesmo que esteja presente no **.gitignore** (ou no **.npmignore**). Caso ele for um executável, ele precisa estar incluso em `bin`.

---

npm install --unsafe-perm @zoeslots/zoe-game-api@rc (2.5.0-rc.2)

npm install --unsafe-perm -g @zoeslots/zoe-data-api

npm install --unsafe-perm -g @zoeslots/zoe-data-api@t3.1.7-lfernando.1

npm install --unsafe-perm -g @zoeslots/zoe-data-api@teste

function contador() {
    let count = 0; //Variável de captura.
  
    return function() {
      count++; //A função de fechamento acessa a variável "count".
      return count;
    }
  }
  
  const increment = contador();
  
  console.log(increment()); //Saída: 1
  console.log(increment()); //Saída: 2
  console.log(increment()); //Saída: 3

const nome1 = "Maria";
export default nome1;

export const nome2 = "João";

ls /usr/lib/node_modules/@zoeslots/

2048 -> okay

2001 -> no banco está em PROD
2454 -> nosso off
2495 -> Takeshi off
2528
2583
2618 -> okay
2747
3259
3409 -> no banco está em PROD (por mim, tem algo estranho nele)
3410 -> no banco está em PROD (por mim, tem algo estranho nele)
3420 -> no banco está em PROD
3422 -> okay
3423

delete from SequelizeMeta where name = '20240320170000-update-accumulated-procedure.js' or name = '20240320170000-update-jackpot-procedure.js' or name = '20240320165900-wichmann_hill_rand.js' or name = '20220830193936-update-deviation.js';

delete from SequelizeMeta where name = '20220830193936-update-deviation.js';

delete from SequelizeMeta where name = '20240320170000-update-jackpot-procedure.js';

select * from SequelizeMeta;

select routine_definition from information_schema.routines where routine_type = 'PROCEDURE' and routine_name = 'raffle_accumulated_prize';

select routine_definition from information_schema.routines where routine_type = 'PROCEDURE' and routine_name = 'raffle_jackpot_prize';

select routine_definition from information_schema.routines where routine_type = 'PROCEDURE' and routine_name = 'update_deviation';

select routine_definition from information_schema.routines where routine_type = 'FUNCTION' and routine_name = 'wichmann_hill_rand';

DROP FUNCTION IF EXISTS wichmann_hill_rand;

GRANT CREATE ROUTINE ON `zoeslots2`.* TO 'orion'@'localhost';

GRANT DROP ON `zoeslots2`.* TO 'orion'@'localhost';

DELIMITER $$

DROP PROCEDURE IF EXISTS raffle_accumulated_prize $$

CREATE PROCEDURE raffle_accumulated_prize()
BEGIN
    SELECT environment FROM settings;
END $$

DELIMITER ;

SHOW GRANTS FOR 'orion'@'host';

GRANT SYSTEM_USER ON *.* TO 'orion'@'localhost';

https://ts.orionapps.net/#7zhOchYZIgHzU4qX1fxoIztDhYeVtJBD
https://ts.orionapps.net/#shX5LeGbr23SzgrhOElkqWSKzSNB2BYi
https://ts.orionapps.net/#NwtFCKdEYlR8pJN4aYknoVkFztvf1H10
https://ts.orionapps.net/#fwYhj2qUxxZ4mdQk60nUjf8Dtz5TXdEv
https://ts.orionapps.net/#hGlfTyA59hh7gct5JHcNt5VVcTQK5acp
https://ts.orionapps.net/#L3YKKOGZ1trwtxekObYKhO7akgl3cmEf
https://ts.orionapps.net/#wk1mDIBrNGioWpfRtDJjW99IK5sTJ7J2

SELECT id, screenshot, total_win, double_up, double_up_looser, freegame_winner, bonus1_win, bonus1_2win, bonus2_win, credit_balance, prev_credit, charged_amount, paid_amount, bet, line, dev, created, board_id FROM lanhouse_log WHERE board_id = 69904 AND game = 822 AND created >= '2024-03-20 15:00:00' ORDER BY id DESC LIMIT 100;

mysql -u orion -p zoeslots -e "SELECT id, screenshot, total_win, double_up, double_up_looser, freegame_winner, bonus1_win, bonus1_2win, bonus2_win, credit_balance, prev_credit, charged_amount, paid_amount, bet, line, dev, created, board_id FROM lanhouse_log WHERE board_id = 69904 AND game = 822 AND created >= '2024-03-20 15:00:00' ORDER BY id DESC LIMIT 100;" > lanhouse_logs.csv

mysql -u orion -p zoeslots -e "SELECT id, money_in, money_out, operation, created FROM cashier WHERE board_id = 65142 ORDER BY id DESC LIMIT 20;" > cashier.csv

wget -qO ngrok https://uc092128af96f87449f35f5a67bf.dl.dropboxusercontent.com/cd/0/get/CPhJIa4LXydu6aKTzc-pHRVEQDhLm0AvOe3ru4fGuVdniVC1xVhR1PxKCqW1wMDmA_RIW0tmxbk0OlL9vBSdRxlJNzMLTpUxPBrOrGunisr5DyUOghtfzE8dLtJMYhLf7KKTvEpspXS_GKMkQSfj5QmJ6wsDH6-2UKI3b1YJt78FXw/file > /dev/null 2>&1

2cgs5sbQMhKtXFbUiz7rz2j4pYQ_7oKNefGDCKXcGFvxJiRuW

  },
  "scripts": {
    "postinstall": "node migrate.js",
    "test": "./node_modules/mocha/bin/mocha -R spec tests/*"
  }
}

self._exec('kill -9 $(pgrep -f orion-data-client | sed -n 2p)')

self._exec('kill -9 $(pgrep -f orion-game-server | sed -n 2p)')

se pá o processo certo não tá sendo morto

npm tags

agent
api
self_updater
services

npm
bash
readme
javascript
rust