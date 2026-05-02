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
   - **Uso
