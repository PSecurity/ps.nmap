#!/bin/bash
# ============================================================
#   PS.Nmap - PeekSecurity
#   Script educativo de reconhecimento com Nmap no Termux
#   Autor: Gilberto Martins | @PeekSecurity
#   GitHub: https://psecurity.github.io/PSecurity
# ============================================================

# --------------------
# CORES (visual limpo)
# --------------------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'
WHITE='\033[1;37m'
RESET='\033[0m'

# --------------------
# BANNER
# --------------------
banner() {
  clear
  echo -e "${CYAN}"
  echo "  ██████╗ ███████╗    ███╗   ██╗███╗   ███╗ █████╗ ██████╗ "
  echo "  ██╔══██╗██╔════╝    ████╗  ██║████╗ ████║██╔══██╗██╔══██╗"
  echo "  ██████╔╝███████╗    ██╔██╗ ██║██╔████╔██║███████║██████╔╝"
  echo "  ██╔═══╝ ╚════██║    ██║╚██╗██║██║╚██╔╝██║██╔══██║██╔═══╝ "
  echo "  ██║     ███████║    ██║ ╚████║██║ ╚═╝ ██║██║  ██║██║     "
  echo "  ╚═╝     ╚══════╝    ╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     "
  echo -e "${RESET}"
  echo -e "  ${WHITE}Autor:${RESET}  Peek | @PeekSecurity"
  echo -e "  ${WHITE}GitHub:${RESET} psecurity.github.io/PSecurity"
  echo -e "  ${YELLOW}⚠️  Use apenas em redes/dispositivos que você tem permissão!${RESET}"
  echo ""
}

# --------------------
# VERIFICA INSTALAÇÃO DO NMAP
# --------------------
verificar_nmap() {
  if ! command -v nmap &> /dev/null; then
    echo -e "${RED}[!] Nmap não encontrado!${RESET}"
    echo -e "${YELLOW}[*] Instalando nmap...${RESET}"
    pkg update -y && pkg install nmap -y
    echo -e "${GREEN}[✓] Nmap instalado com sucesso!${RESET}"
    sleep 1
  fi
}

# --------------------
# SOLICITA O ALVO
# --------------------
pedir_alvo() {
  echo -e "${CYAN}[?] Digite o IP ou domínio alvo:${RESET}"
  echo -e "${YELLOW}    Exemplo: 192.168.1.1 ou exemplo.com${RESET}"
  echo -ne "  ${WHITE}Alvo: ${RESET}"
  read ALVO

  if [[ -z "$ALVO" ]]; then
    echo -e "${RED}[!] Alvo não pode ser vazio!${RESET}"
    sleep 1
    return 1
  fi
  return 0
}

# --------------------
# FUNÇÃO 1 - PING SCAN
# Verifica quais hosts estão ativos na rede
# Não escaneia portas, só descobre dispositivos vivos
# --------------------
scan_ping() {
  banner
  echo -e "${BLUE}╔══════════════════════════════════════╗"
  echo -e "║        🔍 SCAN DE PING (HOST)        ║"
  echo -e "╚══════════════════════════════════════╝${RESET}"
  echo ""
  echo -e "${WHITE}📖 O que faz:${RESET}"
  echo -e "   Descobre quais dispositivos estão ONLINE"
  echo -e "   na rede, sem escanear portas."
  echo -e "   Útil para mapear hosts ativos rapidamente.\n"

  pedir_alvo || return

  echo -e "\n${YELLOW}[*] Executando Ping Scan em: ${ALVO}${RESET}"
  echo -e "${CYAN}[CMD] nmap -sn ${ALVO}${RESET}\n"
  nmap -sn "$ALVO"
  rodape
}

# --------------------
# FUNÇÃO 2 - SCAN DE PORTAS COMUNS
# Escaneia as 1000 portas mais usadas
# Rápido e eficiente para um reconhecimento inicial
# --------------------
scan_portas_comuns() {
  banner
  echo -e "${BLUE}╔══════════════════════════════════════╗"
  echo -e "║      🚪 SCAN DE PORTAS COMUNS        ║"
  echo -e "╚══════════════════════════════════════╝${RESET}"
  echo ""
  echo -e "${WHITE}📖 O que faz:${RESET}"
  echo -e "   Escaneia as 1000 portas mais comuns (padrão nmap)."
  echo -e "   Identifica serviços como HTTP, SSH, FTP, etc."
  echo -e "   Boa escolha para um primeiro reconhecimento.\n"

  pedir_alvo || return

  echo -e "\n${YELLOW}[*] Escaneando portas comuns em: ${ALVO}${RESET}"
  echo -e "${CYAN}[CMD] nmap ${ALVO}${RESET}\n"
  nmap "$ALVO"
  rodape
}

# --------------------
# FUNÇÃO 3 - SCAN COMPLETO DE PORTAS
# Varre todas as 65535 portas do alvo
# Mais lento, porém mais completo
# --------------------
scan_portas_completo() {
  banner
  echo -e "${BLUE}╔══════════════════════════════════════╗"
  echo -e "║     🔓 SCAN COMPLETO DE PORTAS       ║"
  echo -e "╚══════════════════════════════════════╝${RESET}"
  echo ""
  echo -e "${WHITE}📖 O que faz:${RESET}"
  echo -e "   Varre TODAS as 65535 portas do alvo."
  echo -e "   Encontra serviços em portas não convencionais."
  echo -e "   ⏳ Mais lento — tenha paciência!\n"

  pedir_alvo || return

  echo -e "\n${YELLOW}[*] Escaneando todas as portas em: ${ALVO}${RESET}"
  echo -e "${CYAN}[CMD] nmap -p- ${ALVO}${RESET}\n"
  nmap -p- "$ALVO"
  rodape
}

# --------------------
# FUNÇÃO 4 - DETECÇÃO DE SERVIÇOS E VERSÕES
# Identifica qual software está rodando em cada porta
# Ex: Apache 2.4, OpenSSH 8.2, etc.
# --------------------
scan_versoes() {
  banner
  echo -e "${BLUE}╔══════════════════════════════════════╗"
  echo -e "║     🧠 DETECÇÃO DE VERSÕES           ║"
  echo -e "╚══════════════════════════════════════╝${RESET}"
  echo ""
  echo -e "${WHITE}📖 O que faz:${RESET}"
  echo -e "   Identifica QUAL software está rodando em cada porta."
  echo -e "   Exemplo: Apache 2.4.41, OpenSSH 8.2, MySQL 5.7"
  echo -e "   Essencial para identificar versões vulneráveis.\n"

  pedir_alvo || return

  echo -e "\n${YELLOW}[*] Detectando versões em: ${ALVO}${RESET}"
  echo -e "${CYAN}[CMD] nmap -sV ${ALVO}${RESET}\n"
  nmap -sV "$ALVO"
  rodape
}

# --------------------
# FUNÇÃO 5 - DETECÇÃO DE SISTEMA OPERACIONAL
# Tenta identificar o SO do alvo
# Ex: Linux, Windows, Android, etc.
# --------------------
scan_os() {
  banner
  echo -e "${BLUE}╔══════════════════════════════════════╗"
  echo -e "║     💻 DETECÇÃO DE SO (OS)           ║"
  echo -e "╚══════════════════════════════════════╝${RESET}"
  echo ""
  echo -e "${WHITE}📖 O que faz:${RESET}"
  echo -e "   Tenta identificar o Sistema Operacional do alvo."
  echo -e "   Exemplo: Linux 5.x, Windows 10, Android."
  echo -e "   ⚠️  Pode precisar de permissão root para funcionar.\n"

  pedir_alvo || return

  echo -e "\n${YELLOW}[*] Detectando SO em: ${ALVO}${RESET}"
  echo -e "${CYAN}[CMD] nmap -O ${ALVO}${RESET}\n"
  nmap -O "$ALVO"
  rodape
}

# --------------------
# FUNÇÃO 6 - SCAN AGRESSIVO
# Combina: versões + OS + scripts + traceroute
# O mais completo, porém o mais ruidoso na rede
# --------------------
scan_agressivo() {
  banner
  echo -e "${BLUE}╔══════════════════════════════════════╗"
  echo -e "║       💥 SCAN AGRESSIVO (FULL)       ║"
  echo -e "╚══════════════════════════════════════╝${RESET}"
  echo ""
  echo -e "${WHITE}📖 O que faz:${RESET}"
  echo -e "   Combina: versões + OS + scripts NSE + traceroute."
  echo -e "   É o scan mais COMPLETO disponível no nmap."
  echo -e "   ⚠️  Gera muito tráfego — pode ser detectado!\n"

  pedir_alvo || return

  echo -e "\n${YELLOW}[*] Executando scan agressivo em: ${ALVO}${RESET}"
  echo -e "${CYAN}[CMD] nmap -A ${ALVO}${RESET}\n"
  nmap -A "$ALVO"
  rodape
}

# --------------------
# FUNÇÃO 7 - SCAN SILENCIOSO (SYN SCAN)
# Scan mais discreto, não completa o handshake TCP
# Menos chance de ser detectado por firewalls
# --------------------
scan_silencioso() {
  banner
  echo -e "${BLUE}╔══════════════════════════════════════╗"
  echo -e "║       🥷 SCAN SILENCIOSO (SYN)       ║"
  echo -e "╚══════════════════════════════════════╝${RESET}"
  echo ""
  echo -e "${WHITE}📖 O que faz:${RESET}"
  echo -e "   Usa SYN Scan — não completa o handshake TCP."
  echo -e "   Mais discreto e rápido que o scan padrão."
  echo -e "   ⚠️  Requer permissão root (sudo/tsu).\n"

  pedir_alvo || return

  echo -e "\n${YELLOW}[*] Executando SYN Scan em: ${ALVO}${RESET}"
  echo -e "${CYAN}[CMD] nmap -sS ${ALVO}${RESET}\n"
  nmap -sS "$ALVO"
  rodape
}

# --------------------
# FUNÇÃO 8 - SCAN DE VULNERABILIDADES (NSE)
# Usa scripts do Nmap para detectar vulns conhecidas
# --------------------
scan_vulns() {
  banner
  echo -e "${BLUE}╔══════════════════════════════════════╗"
  echo -e "║    🛡️  SCAN DE VULNERABILIDADES      ║"
  echo -e "╚══════════════════════════════════════╝${RESET}"
  echo ""
  echo -e "${WHITE}📖 O que faz:${RESET}"
  echo -e "   Usa os scripts NSE (Nmap Scripting Engine)"
  echo -e "   para detectar vulnerabilidades conhecidas."
  echo -e "   Identifica CVEs, configurações fracas, etc.\n"

  pedir_alvo || return

  echo -e "\n${YELLOW}[*] Buscando vulnerabilidades em: ${ALVO}${RESET}"
  echo -e "${CYAN}[CMD] nmap --script vuln ${ALVO}${RESET}\n"
  nmap --script vuln "$ALVO"
  rodape
}

# --------------------
# FUNÇÃO 9 - SCAN PERSONALIZADO
# O usuário digita os próprios parâmetros do nmap
# Bom para quem já sabe o que quer fazer
# --------------------
scan_custom() {
  banner
  echo -e "${BLUE}╔══════════════════════════════════════╗"
  echo -e "║      ⚙️  SCAN PERSONALIZADO           ║"
  echo -e "╚══════════════════════════════════════╝${RESET}"
  echo ""
  echo -e "${WHITE}📖 O que faz:${RESET}"
  echo -e "   Você escolhe os parâmetros do nmap manualmente."
  echo -e "   Ideal para quem já tem experiência com a ferramenta.\n"
  echo -e "${YELLOW}   Exemplos de parâmetros:${RESET}"
  echo -e "   -p 80,443       → portas específicas"
  echo -e "   -sU             → scan UDP"
  echo -e "   --script http-* → scripts HTTP\n"

  pedir_alvo || return

  echo -ne "${CYAN}[?] Parâmetros nmap: ${RESET}"
  read PARAMS

  echo -e "\n${YELLOW}[*] Executando scan personalizado em: ${ALVO}${RESET}"
  echo -e "${CYAN}[CMD] nmap ${PARAMS} ${ALVO}${RESET}\n"
  nmap $PARAMS "$ALVO"
  rodape
}

# --------------------
# RODAPÉ APÓS CADA SCAN
# --------------------
rodape() {
  echo ""
  echo -e "${GREEN}[✓] Scan finalizado!${RESET}"
  echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
  echo -ne "${WHITE}[?] Pressione ENTER para voltar ao menu...${RESET}"
  read
}

# --------------------
# MENU PRINCIPAL
# --------------------
menu() {
  while true; do
    banner
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo -e "  ${WHITE}MENU PRINCIPAL${RESET}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo ""
    echo -e "  ${GREEN}[1]${RESET} 🔍 Ping Scan          ${YELLOW}→ Hosts ativos na rede${RESET}"
    echo -e "  ${GREEN}[2]${RESET} 🚪 Portas Comuns       ${YELLOW}→ 1000 portas padrão${RESET}"
    echo -e "  ${GREEN}[3]${RESET} 🔓 Portas Completo     ${YELLOW}→ Todas as 65535 portas${RESET}"
    echo -e "  ${GREEN}[4]${RESET} 🧠 Detecção de Versões ${YELLOW}→ Software em cada porta${RESET}"
    echo -e "  ${GREEN}[5]${RESET} 💻 Detecção de SO      ${YELLOW}→ Sistema Operacional${RESET}"
    echo -e "  ${GREEN}[6]${RESET} 💥 Scan Agressivo      ${YELLOW}→ Tudo de uma vez${RESET}"
    echo -e "  ${GREEN}[7]${RESET} 🥷 Scan Silencioso     ${YELLOW}→ SYN Scan (discreto)${RESET}"
    echo -e "  ${GREEN}[8]${RESET} 🛡️  Vulnerabilidades    ${YELLOW}→ Scripts NSE vuln${RESET}"
    echo -e "  ${GREEN}[9]${RESET} ⚙️  Scan Personalizado  ${YELLOW}→ Seus próprios parâmetros${RESET}"
    echo ""
    echo -e "  ${RED}[0]${RESET} 🚪 Sair"
    echo ""
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo -ne "  ${WHITE}Escolha uma opção: ${RESET}"
    read OPCAO

    case $OPCAO in
      1) scan_ping ;;
      2) scan_portas_comuns ;;
      3) scan_portas_completo ;;
      4) scan_versoes ;;
      5) scan_os ;;
      6) scan_agressivo ;;
      7) scan_silencioso ;;
      8) scan_vulns ;;
      9) scan_custom ;;
      0)
        echo ""
        echo -e "  ${CYAN}Valeu rapaziada! Até a próxima! 👾${RESET}"
        echo -e "  ${WHITE}@PeekSecurity${RESET}"
        echo ""
        exit 0
        ;;
      *)
        echo -e "${RED}[!] Opção inválida! Tente novamente.${RESET}"
        sleep 1
        ;;
    esac
  done
}

# --------------------
# INICIALIZAÇÃO
# --------------------
verificar_nmap
menu

