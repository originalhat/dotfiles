@test "every source in the links manifest exists in the repo" {
  root="$BATS_TEST_DIRNAME/.."
  while read -r source target; do
    [[ -z "$source" || "$source" == \#* ]] && continue
    [ -e "$root/$source" ] || { echo "missing: $source"; return 1; }
  done < "$root/links"
}
