kept() {
  zsh -f -c 'source "$1"; zshaddhistory "$2"' _ "$BATS_TEST_DIRNAME/../zsh/history-filter.zsh" "$1"$'\n'
}

@test "keeps ordinary commands" {
  kept "git status"
  kept "bundle exec rspec spec/models/token_spec.rb"
  kept 'echo $GITHUB_TOKEN'
  kept "export EDITOR=nvim"
}

@test "drops commands that assign a secret-looking variable" {
  ! kept "export ANTHROPIC_API_KEY=abc123def456" # gitleaks:allow
  ! kept "GITHUB_TOKEN=abc123 gh pr list"
  ! kept "export db_password=hunter2"
}

@test "drops commands containing known token formats" {
  ! kept "curl -H 'x-api-key: sk-ant-api03-abcdefghijklmnopqrstuvwxyz'"
  ! kept "gh auth login --with-token ghp_abcdefghijklmnopqrstuvwxyz0123"
  ! kept "curl -H 'Authorization: Bearer abcdefghijklmnop1234'" # gitleaks:allow
}

@test "drops commands that start with a space" {
  ! kept " export SAFE=1"
}
