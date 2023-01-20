
### Observações

#### Projeto desenvolvido em Flutter (Android e IOS) utilizando:
	
- Clean Architecture como padrão de arquitetura .
- GetIT para injeção de dependência.
- ValueNotifier para gerenciamento de estado. Propria gerencia de estados do flutter.
- Dio para chamadas GET.

#### Feature:

1 - Tela de Splash
2 - Tela com o botão para apresentação da tabela com variação do preço dos ativos nos últimos 30 pregões.
3 - Ao clicado o botão "Alterar" ele chama o MethodChannel, invocando o nativo em ambas plataformas (Android e IOS), abrindo um AlertDialog Nativo, ao selecionar ele muda o estado da tela.
