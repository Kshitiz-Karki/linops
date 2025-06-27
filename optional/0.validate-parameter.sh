RC='\033[0m'
YELLOW='\033[33m'

validateInputParameter() {
  if [ -z "$1" ]; then
    {
      printf "%b\n" "${YELLOW}❌ --install / --uninstall parameter required.${RC}"
      printf "%b\n" "${YELLOW}Usage: $0 --install / --uninstall${RC}"
      exit 1
    }
  fi
}
