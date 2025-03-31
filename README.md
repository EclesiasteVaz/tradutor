# README - Tradutor Multilíngue com Flutter

## 🌍 Tradutor Inteligente Multilíngue

**Desenvolvido por Eclesiaste Vaz**  

Um aplicativo de tradução multiplataforma (Web e Mobile) com suporte para voz, integrando a inteligência do Gemini e síntese de fala.

![Demo do Tradutor](https://via.placeholder.com/800x400?text=Demo+Tradutor+Multilíngue)

## ✨ Funcionalidades Principais

- **Tradução entre 5 idiomas**:
  - Inglês 🇬🇧
  - Francês 🇫🇷
  - Alemão 🇩🇪
  - Espanhol 🇪🇸
  - Português 🇧🇷
  
- **Tecnologias integradas**:
  - 🤖 **Gemini AI** para traduções contextuais (via `flutter_gemini`)
  - 🎙️ **Síntese de voz** (via `flutter_tts`)
  - 📱 **Multiplataforma** (Web e Mobile)

- **Recursos extras**:
  - Pronúncia automática dos textos traduzidos
  - Interface intuitiva e responsiva

## 🚀 Como Executar o Projeto

### Pré-requisitos

- Flutter SDK (versão 3.24.3 ou superior)
- Dart (versão 3.5.3 ou superior)
- Conta no Google AI Studio (para chave API do Gemini)

### Instalação

1. Clone o repositório:

   ```bash
   git clone https://github.com/EclesiasteVaz/tradutor.git
   cd tradutor
   ```

2. Instale as dependências:

   ```bash
   flutter pub get
   ```

3. Configure sua chave API do Gemini:
   - no arquivo lib/core/config.dart
   - Adicione sua chave

4. Execute o app:

   ```bash
   flutter run -d chrome  # Para web
   # ou
   flutter run # Para dispositivo móvel
   ```

## 📚 Dependências Principais

| Pacote | Função |
|--------|--------|
| `flutter_gemini` | Integração com a API do Gemini AI |
| `flutter_tts` | Síntese de texto para voz |

## 🌐 Suporte a Idiomas

O app suporta tradução entre os seguintes idiomas:

| Idioma | Código | Exemplo |
|--------|--------|---------|
| Inglês | `en` | "Hello" |
| Francês | `fr` | "Bonjour" |
| Alemão | `de` | "Hallo" |
| Espanhol | `es` | "Hola" |
| Português | `pt` | "Olá" |


## 🤝 Como Contribuir

1. Faça um fork do projeto
2. Crie uma branch (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request


---
**Desenvolvido com ❤️ por Eclesiaste Vaz**  
🔗 LinkedIn: [linkedin.com/in/eclesiaste-vaz](https://www.linkedin.com/in/eclesiaste-vaz)
