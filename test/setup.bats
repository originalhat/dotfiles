setup() {
  REPO="$BATS_TEST_TMPDIR/dotfiles"
  export HOME="$BATS_TEST_TMPDIR/home"
  export DOTFILES_SKIP_PACKAGES=1
  mkdir -p "$REPO/bin" "$REPO/zsh" "$REPO/ghostty" "$HOME"
  cp "$BATS_TEST_DIRNAME/../bin/setup" "$REPO/bin/setup"
  echo "zshrc" > "$REPO/zsh/.zshrc"
  echo "ghostty" > "$REPO/ghostty/config"
  cat > "$REPO/links" <<'EOF'
# source              target
zsh/.zshrc            .zshrc
ghostty/config        .config/ghostty/config
EOF
}

@test "links every manifest entry into the home directory" {
  run "$REPO/bin/setup"

  [ "$status" -eq 0 ]
  [ "$(readlink "$HOME/.zshrc")" = "$REPO/zsh/.zshrc" ]
  [ "$(readlink "$HOME/.config/ghostty/config")" = "$REPO/ghostty/config" ]
}

@test "backs up an existing regular file instead of losing it" {
  echo "hand edited" > "$HOME/.zshrc"

  run "$REPO/bin/setup"

  [ "$status" -eq 0 ]
  [ "$(cat "$HOME/.zshrc.pre-dotfiles")" = "hand edited" ]
  [ "$(readlink "$HOME/.zshrc")" = "$REPO/zsh/.zshrc" ]
  [[ "$output" == *"backed up"*".zshrc"* ]]
}

@test "repoints a symlink that targets somewhere else" {
  ln -s /nowhere "$HOME/.zshrc"

  run "$REPO/bin/setup"

  [ "$(readlink "$HOME/.zshrc")" = "$REPO/zsh/.zshrc" ]
}

@test "a second run changes nothing" {
  "$REPO/bin/setup"

  run "$REPO/bin/setup"

  [ "$status" -eq 0 ]
  [[ "$output" != *"linked"* ]]
  [ ! -e "$HOME/.zshrc.pre-dotfiles" ]
}

@test "check reports drift without touching anything" {
  echo "hand edited" > "$HOME/.zshrc"

  run "$REPO/bin/setup" --check

  [ "$status" -eq 1 ]
  [[ "$output" == *".zshrc"*"regular file"* ]]
  [[ "$output" == *".config/ghostty/config"*"missing"* ]]
  [ "$(cat "$HOME/.zshrc")" = "hand edited" ]
  [ ! -e "$HOME/.config/ghostty/config" ]
}

@test "check passes once everything is linked" {
  "$REPO/bin/setup"

  run "$REPO/bin/setup" --check

  [ "$status" -eq 0 ]
}

@test "fails loudly when a manifest source does not exist" {
  echo "nope/missing .missing" >> "$REPO/links"

  run "$REPO/bin/setup"

  [ "$status" -ne 0 ]
  [[ "$output" == *"nope/missing"* ]]
}
