# Sinopse

RPostgreSQL fornece uma conexão com banco de dados [DBI] do [GNU R] para [Postgresql].

O pacote já está disponível na rede espelho [CRAN] e pode ser instalado via install.packages () de dentro R. A lista de email rpostgresql-dev@googlegroups.com está disponível no [Google Groups].

# Sumário de uso básico

 > 1 - Instancia o driver, exemplo:
  ```R
    drv <- dbDriver("PostgreSQL")
  ```
  
 > 2 - Cria e abre uma conexão com o banco de dados utilizando o drive 'drv' ja criado no passo anterior. Na conexão podemos especificar os parametros user, password, dbname, host, port, tty and options, exemplo:
  ```R
    con <- dbConnect(drv, dbname="test", user="postgres", pass="1234", host="localhost", port="5432")
  ```
  
 > 3 - Exibir Lista de conexão utilizando o driver criado
  ```R
    dbListConnections(drv)
  ```
 > 4 - Exbir informações sobre o dbObject com summary e dbGetInfo, exemplo:
  ```R
    dbGetInfo(drv)
    summary(con)
  ```
 > 5 - Criar um resultSet utilizando sendQuery e pegar uma quantidade especifica de resultado ou todos, exemplo:
  ```R
     rs <- dbSendQuery(con,"select * from TableName")
     fetch(rs,n=-1) ## retorna todos os resultados ao passar o n=-1
     fetch(rs,n=2) ## retorna os dois ultimos registros encontrados
   ```
 > 6 - Obter o mesmo resultado com apenas um comando em que envia, executa e extrai o resultado da query, exemplo:
   ```R
     dbGetQuery(con,"select * from TableName")
   ```
 > 7 - Retornar os resulsSets ativos na conexão, exemplo: (nota:  atual versão do pacote RPostgreSQL consegue manipular apenas um ResultSet por conexão aberta)
  ```R
    dbListResults(con)
  ```
 > 8 - Retornar todas as tabelas do banco de dados de uma conexão, exemplo:
  ```R
    dbListTables(con)
  ```
 > 9 - Verificar se uma determinada tabela existe no banco de dados, exemplo:
  ```R
    dbExistsTable(con,"TableName")
  ```
 > 10 - Deletar tabela de uma determinada conexão, exemplo:
  ```R
    dbRemoveTable(con,"TableName")
  ```
 > 11 - Retorna lista nome das colunas de uma determinada tabela, exemplo:
  ```R
    dbListFields(con,"TableName")
  ```
 > 12 - Todas as informações de colunas de um resultset, exemplo:
  ```R
    rs <- dbSendQuery(con,"select * from TableName")
    dbColumnInfo(rs)
  ```
 > 13 - Convertendo todas as informações de uma tabela em data.frame, exemplo:
  ```R
    dframe <-dbReadTable(con,"TableName") 
  ```
 > 14 - Criando tabela a partir de um data.frame, exemplo:
  ```R
    dbWriteTable(con,"newTable",dframe)
  ```
 > 15 - Retornar query de um resultSet, exemplo:
  ```R
    dbGetStatement(rs)
  ```
 > 16 - Verificar de operação do resultSet foi executada ou nao, exemplo:
  ```R
    dbHasCompleted(rs)
  ```
 > 17 - Contar quantidade de resultados de um resultSet, exemplo:
  ```R
    dbGetRowCount(rs)
  ```
 > 18 - Trabalhando com transação:
  
  ```R
    dbBeginTransaction(con)
    dbRemoveTable(con,"newTable")
    dbExistsTable(con,"newTable")
    dbRollback(con)
    dbExistsTable(con,"newTable")
    
    dbBeginTransaction(con)
    dbRemoveTable(con,"newTable")
    dbExistsTable(con,"newTable")
    dbCommit(con)
    dbExistsTable(con,"newTable")
  ```
 > 19 - Desconectar do banco de dados, exemplo:
  ```R
    dbDisconnect(con)
  ```
 > 20 - Liberar recursos utilizados pelo Driver, exemplo:
  ```R
    dbUnloadDriver(drv)
  ```
  
# EXEMPLO COMPLETO

```R
    library(RPostgreSQL)
    ## loads the PostgreSQL driver
    drv <- dbDriver("PostgreSQL")
    
    ## Open a connection
    con <- dbConnect(drv, dbname="R_Project")
    
    ## Submits a statement
    rs <- dbSendQuery(con, "select * from R_Users")
    
    ## fetch all elements from the result set
    fetch(rs,n=-1)
    
    ## Submit and execute the query
    dbGetQuery(con, "select * from R_packages")
    
    ## Closes the connection
    dbDisconnect(con)
    
    ## Frees all the resources on the driver
    dbUnloadDriver(drv)
```


> Para quaisquer dúvidas, sugestões ou bugs, por favor, entre em contato com a lista de discussão citada acima.

[Repositorio oficial]

[DBI]:http://stat.bell-labs.com/RS-DBI/index.html
[GNU R]: http://www.r-project.org/
[Postgresql]:http://www.postgresql.org/
[Google Groups]:https://groups.google.com/forum/?pli=1#!forum/rpostgresql-dev
[Repositorio oficial]:https://code.google.com/p/rpostgresql/
[CRAN]:http://cran.r-project.org/web/packages/RPostgreSQL/index.html
