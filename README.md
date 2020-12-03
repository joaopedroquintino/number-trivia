# Number Trivia
![Flutter 2.22.3](https://img.shields.io/badge/flutter-2.22.3-blue) ![Dart >= 2.6.0 < 3.0.0](https://img.shields.io/badge/dart-%3E=2.6.0%20%3C3.0.0-blue)

Este é um app de fatos interessantes sobre números. Nele, o usuário insere um número e tem como resposta um fato curioso sobre aquele número. Também é possível buscar por um fato de um número aleatório.

## Considerações
Este app foi desenvolvido seguindo este [curso de TDD e Clean Architecture](https://resocoder.com/flutter-clean-architecture-tdd/) do Reso Coder.<br>
O desenvolvimento deste app utiliza os princípios de TDD e Clean Architecture.

## Stack

A stack de ferramentas utilizadas no desenvolvimento deste app é:

### API
- [http](https://pub.dev/packages/http)
### Injeção de dependências
- [GetIt](https://pub.dev/packages/get_it)
### Gerenciamento de estados
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
### Armazenamento local (Cache)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
### Outras ferramentas utilizadas
- [dartz](https://pub.dev/packages/dartz)
- [equatable](https://pub.dev/packages/equatable)
- [data_connection_checker](https://pub.dev/packages/data_connection_checker)
## Estrutura de pastas
Para manter a organização do projeto foi utilizada uma estrutura de pastas baseada na estrutura do Clean Architecture. Abaixo é possível ver um exemplo:

- lib/
  - features/
    - number_trivia/
      - data/
        - datasources/
        - repositories/
        - models/
      - domain/
        - entities/
        - repositories/
        - usecases/
      - presentation/
        - bloc/
        - pages/
        - widgets/
