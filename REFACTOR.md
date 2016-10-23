# Refatoração

## Descrição

### Principios que busquei aplicar

* KISS
* DRY
* MVP
* SOLID

### Como garantir que funciona?

* Testes (Queria ter aplicado testes com Capybara mas eu estava com pouco tempo no Fim de Semana ¯\_(ツ)_/¯ )

## Meu código

Sempre busco fazer um meio termo entre código limpo e código com poucas linhas (para que qualquer desenvolvedor e em qualquer nível consiga entender).

Muitas vezes eu sei que posso reduzir linhas de código com os recursos que a linguagem de programação oferece, no entanto às vezes isso deixa o código um pouco mais complicado para leitura.

Nesse teste eu busquei separar as responsabilidades na aplicação, sendo:

* Rake task: Consome a API do Webmotors e armazena os dados
* Home page: Carrega apenas o HTML da página principal
* Angular App: Faz a consulta dos dados no backend e se vira para manipular o DOM

## Por que fiz desse jeito?

Atualmente trabalho muito com micro serviços, desenvolvendo robôzinhos (consomem APIs ou Web Scrap), desenvolvimento de APIs, desenvolvimento frontend (SPA), etc...

Devido a isso, eu procuro performar a aplicação (até onde meu conhecimento chega né.. hehehe). Também gosto de código organizado, entendo bem o que é o MVC de verdade, e não misturo as responsabilidades.

Venho seguindo a mentalidade de que o backend só serve conteúdo (API) e o front é construído em SPA (aqui no teste a home é carregada pela aplicação).





