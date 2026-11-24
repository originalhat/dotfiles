setup() {
  export HOME="$BATS_TEST_TMPDIR/home"
  mkdir -p "$HOME/.claude" "$BATS_TEST_TMPDIR/bin"
  echo '{"model":"opus"}' > "$HOME/.claude/settings.json"
  export PATH="$BATS_TEST_TMPDIR/bin:$PATH"
  OVERRIDE="$BATS_TEST_DIRNAME/../bin/claude-api-override"
}

fake_op() {
  cat > "$BATS_TEST_TMPDIR/bin/op" <<EOF
#!/usr/bin/env bash
echo "\$*" >> "$BATS_TEST_TMPDIR/op-calls"
$1
EOF
  chmod +x "$BATS_TEST_TMPDIR/bin/op"
}

settings_key() {
  jq -r '.env.ANTHROPIC_API_KEY // empty' "$HOME/.claude/settings.json"
}

@test "on reads the key from 1Password and applies it" {
  fake_op 'echo fake-key-from-1password'

  run "$OVERRIDE" on 1s

  [ "$status" -eq 0 ]
  [ "$(settings_key)" = "fake-key-from-1password" ]
  [ "$(jq -r .model "$HOME/.claude/settings.json")" = "opus" ]
  [[ "$(cat "$BATS_TEST_TMPDIR/op-calls")" == "read op://"* ]]
}

@test "the 1Password reference can be overridden" {
  fake_op 'echo fake-key'
  export CLAUDE_API_KEY_OP_REF="op://Work/Claude/credential"

  run "$OVERRIDE" on 1s

  [ "$(cat "$BATS_TEST_TMPDIR/op-calls")" = "read op://Work/Claude/credential" ]
}

@test "leaves settings untouched when 1Password can't provide the key" {
  fake_op 'echo "item not found" >&2; exit 1'

  run "$OVERRIDE" on 1s

  [ "$status" -ne 0 ]
  [ -z "$(settings_key)" ]
  [[ "$output" == *"1Password"* ]]
}

@test "never reads a plaintext key file" {
  fake_op 'echo "locked" >&2; exit 1'
  mkdir -p "$HOME/.claude/secrets"
  echo "ANTHROPIC_API_KEY=plaintext-key" > "$HOME/.claude/secrets/api-override.env"

  run "$OVERRIDE" on 1s

  [ "$status" -ne 0 ]
  [ -z "$(settings_key)" ]
}

@test "a symlinked settings file never gets the key and is relinked afterwards" {
  fake_op 'echo fake-key'
  source_file="$BATS_TEST_TMPDIR/tracked-settings.json"
  echo '{"model":"opus"}' > "$source_file"
  ln -sfn "$source_file" "$HOME/.claude/settings.json"

  "$OVERRIDE" on 1s
  [ "$(settings_key)" = "fake-key" ]
  [ -z "$(jq -r '.env.ANTHROPIC_API_KEY // empty' "$source_file")" ]

  run "$OVERRIDE" off

  [ "$(readlink "$HOME/.claude/settings.json")" = "$source_file" ]
  [ -z "$(settings_key)" ]
}

@test "off removes the key" {
  fake_op 'echo fake-key'
  "$OVERRIDE" on 1s

  run "$OVERRIDE" off

  [ "$status" -eq 0 ]
  [ -z "$(settings_key)" ]
}

@test "status reports an active override" {
  fake_op 'echo fake-key'
  "$OVERRIDE" on 10m

  run "$OVERRIDE" status
  "$OVERRIDE" off

  [[ "$output" == *"ACTIVE until"*"remaining"* ]]
}
