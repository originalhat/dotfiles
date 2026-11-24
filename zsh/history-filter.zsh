# Keep secrets out of ~/.zsh_history. Returning 1 tells zsh not to save the line.
zshaddhistory() {
  emulate -L zsh
  local line="${(L)1%%$'\n'}"

  [[ "$line" == ' '* ]] && return 1

  local secret_assignment='[a-z0-9_]*(api_?key|token|secret|passw(or)?d|private_?key|access_?key)[a-z0-9_]*=[^ $]'
  local token_format='sk-ant-|sk-[a-z0-9_-]{20}|github_pat_|gh[pousr]_[a-z0-9]{20}|glpat-|xox[abprs]-|bearer [a-z0-9._~+/=-]{16}'
  [[ "$line" =~ "$secret_assignment" || "$line" =~ "$token_format" ]] && return 1

  return 0
}
