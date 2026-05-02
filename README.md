# PS.Nmap - PeekSecurity

### **Script educativo de reconhecimento com Nmap no Termux**

**PS.Nmap** é uma ferramenta prática de reconhecimento de rede utilizando o **Nmap** no **Termux**, ideal para estudantes e iniciantes em segurança cibernética. Ela permite escanear dispositivos e serviços na rede de forma simples, com diversas opções de escaneamento.

**Autor:** Peek | @PeekSecurity  
**GitHub:** [https://psecurity.github.io/PSecurity](https://psecurity.github.io/PSecurity)

---

## ⚠️ **Atenção**
- **Use apenas em redes e dispositivos que você tem permissão!**
- **Este script é destinado a fins educacionais** e não deve ser utilizado para fins maliciosos.

---

## 🚀 **Instalação**

1. **Instalar o Termux**:
   Se ainda não tiver o Termux instalado, baixe na Google Play Store ou diretamente do [site oficial](https://termux.com/).

2. **Instalar o Nmap**:
   O Nmap será instalado automaticamente caso você ainda não o tenha no seu sistema. O script verifica se o Nmap está presente e instala se necessário.

---

## 💡 **Funcionalidades**

O PS.Nmap oferece as seguintes opções de escaneamento, cada uma com um propósito específico. O script apresenta uma interface simples de texto, permitindo que você escolha qual escaneamento deseja realizar:

### 1. **Ping Scan (Host Discovery)**
   - **Descrição:** Identifica quais dispositivos estão ativos na rede, sem escanear portas.
   - **Uso:** Rápido para mapear hosts ativos.
   - **Exemplo de comando:** `nmap -sn <IP ou domínio>`

### 2. **Scan de Portas Comuns**
   - **Descrição:** Escaneia as 1000 portas mais comuns (padrão do Nmap), identificando serviços como HTTP, SSH, FTP, etc.
   - **Uso:** Reconhecimento inicial rápido de portas abertas.
   - **Exemplo de comando:** `nmap <IP ou domínio>`

### 3. **Scan Completo de Portas**
   - **Descrição:** Varre todas as 65535 portas do alvo, identificando serviços em portas não convencionais.
   - **Uso:** Escaneamento mais lento, mas completo.
   - **Exemplo de comando:** `nmap -p- <IP ou domínio>`

### 4. **Detecção de Versões**
   - **Descrição:** Identifica os softwares que estão rodando em cada porta (ex.: Apache 2.4, OpenSSH 8.2).
   - **Uso:** Essencial para detectar versões vulneráveis.
   - **Exemplo de comando:** `nmap -sV <IP ou domínio>`

### 5. **Detecção de Sistema Operacional**
   - **Descrição:** Tenta identificar o sistema operacional do alvo (ex.: Linux, Windows, Android).
   - **Uso:** Pode precisar de permissões de root.
   - **Exemplo de comando:** `nmap -O <IP ou domínio>`

### 6. **Scan Agressivo (Full Scan)**
   - **Descrição:** Combina detecção de versões, sistema operacional, scripts NSE e traceroute. O escaneamento mais completo, mas gera mais tráfego.
   - **Uso:** Utilizado para uma análise profunda de um alvo.
   - **Exemplo de comando:** `nmap -A <IP ou domínio>`

### 7. **Scan Silencioso (SYN Scan)**
   - **Descrição:** Utiliza o SYN Scan, não completando o handshake TCP, o que torna o escaneamento mais discreto e difícil de ser detectado por firewalls.
   - **Uso:** Ideal para um escaneamento mais discreto.
   - **Exemplo de comando:** `nmap -sS <IP ou domínio>`

### 8. **Scan de Vulnerabilidades (NSE)**
   - **Descrição:** Usa scripts do Nmap (NSE) para detectar vulnerabilidades conhecidas (ex.: CVEs, configurações fracas).
   - **Uso:** Perfeito para descobrir vulnerabilidades em sistemas.
   - **Exemplo de comando:** `nmap --script vuln <IP ou domínio>`

### 9. **Scan Personalizado**
   - **Descrição:** Permite que o usuário insira parâmetros personalizados para o Nmap.
   - **Uso:** Ideal para usuários mais avançados que já sabem o que desejam buscar.
   - **Exemplo de comando:** `nmap -p 80,443 -sU --script http-* <IP ou domínio>`

---

## ⚙️ **Como Usar**

1. **Verificar se o Nmap está instalado**:
   - O script começa verificando se o Nmap está instalado no seu sistema. Se não estiver, ele instala automaticamente.

2. **Escolher o alvo**:
   - O script pedirá para você inserir o **IP** ou **domínio** do alvo a ser escaneado.

3. **Escolher a opção de escaneamento**:
   - Após escolher o alvo, você poderá selecionar uma das funções de escaneamento disponíveis no menu.

4. **Visualizar os resultados**:
   - O script exibirá os resultados do escaneamento na tela e pedirá para você pressionar Enter para voltar ao menu principal.

---

## 👾 **Exemplo de Execução**

Após rodar o script, você verá o seguinte menu:

``` id="gnrgwt"
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  MENU PRINCIPAL
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  [1] 🔍 Ping Scan          → Hosts ativos na rede
  [2] 🚪 Portas Comuns       → 1000 portas padrão
  [3] 🔓 Portas Completo     → Todas as 65535 portas
  [4] 🧠 Detecção de Versões → Software em cada porta
  [5] 💻 Detecção de SO      → Sistema Operacional
  [6] 💥 Scan Agressivo      → Tudo de uma vez
  [7] 🥷 Scan Silencioso     → SYN Scan (discreto)
  [8] 🛡️  Vulnerabilidades    → Scripts NSE vuln
  [9] ⚙️  Scan Personalizado  → Seus próprios parâmetros

  [0] 🚪 Sair

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Escolha a opção e veja o resultado do seu escaneamento!


---

🔧 Dependências

Nmap: Ferramenta principal de escaneamento de rede.

Termux: Ambiente de terminal no Android.



---

💬 Contribuições

Sinta-se à vontade para contribuir com melhorias no script.

Abra um issue ou envie um pull request no GitHub.


Agora é só copiar esse bloco completo e colar no seu arquivo `README.md` no GitHub! Se precisar de mais alguma coisa, estou à disposição!