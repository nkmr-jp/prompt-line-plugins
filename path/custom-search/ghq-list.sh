#!/bin/bash
ghq list | while IFS= read -r line; do
  name=$(basename "$line")
  printf '{"path":"%s","name":"%s"}\n' "$line" "$name"
done
