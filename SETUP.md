# Instalação

## Requisitos

* ruby 2.3.1
* rails 4.2.5.1
* sqlite

## Clone do projeto

```
    $ git clone https://github.com/w-osilva/vehicles-in-web.git
```

## Dependências

```
    $ bundle install
```

## Banco de dados

```
    $ rake db:setup
```

## Tasks

###### Importa os dados das montadoras
```
 $ rake webmototors:importers:car[makers]
```

###### Importa os dados dos veículos
```
 $ rake webmototors:importers:car[vehicles]
```

## Aplicação
```
 $ rails s -b 0.0.0.0 -p 3000
```

Para visualizar acesse http://localhost:3000
