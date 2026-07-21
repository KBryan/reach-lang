# Validation Baseline

**Date**: 2026-07-21 (updated after full build + test runs)
**Maturity Level**: 1 (see .agent/maturity.md)

## Test Results
- `cd hs && make hs-build`: **PASS** — full stack build on lts-19.7/GHC 9.0.2, 186 actions, reachc/reach/reach-test installed.
- `cd hs && make hs-test` (run 1, no `goal` on PATH): **464/806 FAIL** — 452 failures were `goal: createProcess` (missing Algorand `goal` binary; reachc shells out to `goal clerk compile` to assemble TEAL, see hs/src/Reach/Connector/ALGO.hs:3466). Fixed via a Docker-backed `goal` shim (requires Docker daemon + `reachsh/devnet-algo` image; the stock `scripts/goal-devnet` mounts only `$PWD`, which breaks reachc's absolute paths — the shim mounts the repo and TMPDIR at identical container paths).
- Remaining ~12 failures: z3 model-value drift — `t/n` golden outputs embed verification counterexample witness values, and local z3 4.12.5 picks different (semantically equivalent) models than the pinned 4.8.17. Resolved by `hs-test-accept` as part of the z3 version bump.
- Run 2 (with goal shim): **14/806 FAIL (2137s)** — all benign version drift, no functional regressions:
  - 12 × `t/n` goldens: z3 4.12.5 picks different (semantically equivalent) counterexample witness values than 4.8.17.
  - 2 × `t/y` goldens (`gh-1183`, `tooBig`): goldens embed bytecode sizes in "exceeds the maximum limit" warnings; solc 0.8.26 produces *smaller* bytecode in every case (e.g. 45328→41952, 49068→48445).
- Phase 2+3 landed: `DEPS` pinned to SOLC_VERSION=0.8.26 / Z3_VERSION=4.12.5; `Version.hs` regenerated via `make expand`; the 14 drifted goldens accepted via `make hs-test-accept` (12 `t/n` + `t/y/gh-1183.txt` + `t/y/tooBig.txt`); confirmation run: **806/806 PASS (2051s)** — no `t/n` flapping observed, so z3 4.12.5 counterexample models appear stable across runs on this machine. Phase 2+3 complete, uncommitted.
- **Accept-run hazard (learned the hard way)**: if Docker (goal) is down, `make hs-test-accept` silently **corrupts `t/n` goldens** — those tests expect reachc to fail, so the "TEAL compiler failed / docker API" crash counts as failure and tasty-golden accepts the Docker error text as the new expected output (5 goldens corrupted, reverted via `git checkout`). Always `docker info` before any accept run, and `git diff hs/t | grep docker` after.
- Local env gotcha: `/usr/local/bin/mo` crashes under macOS bash 3.2 (`MO_FUNCTION_CACHE_HIT[@]: unbound variable` — empty-array expansion under `set -u`, fixed in bash 4.4). A failed `mo` run leaves the target file EMPTY (shell `>` truncates before mo crashes), and make then considers it up to date — `rm` the target before retrying. Workaround: patched mo copy in the session scratchpad `bin/` (guards the two unguarded `"${MO_FUNCTION_CACHE_*[@]}"` loops); durable fix is `brew install bash` or upgrading mo.
- Quick sanity check `cd hs && make expand`: **PASS** — generated `hs/package.yaml`, `hs/src/Reach/Version.hs`, and `hs/sol/stdlib.sol` (including OpenZeppelin expansion) with exit code 0.
- solc 0.8.26 compatibility probe: **PASS** — Reach's exact standard-json settings (viaIR, optimizer, revertStrings strip, bytecodeHash none) accepted by solc 0.8.26; the custom Yul optimizer step sequence in ETH_solc.hs is dead code (opSpecialSeq=False in all active policies).

## Lint Results
- `make sh-lint`: **SKIPPED** — `shellcheck` not installed.
- `make docker-lint`: **SKIPPED** — `hadolint` not installed.
- `make check`: **SKIPPED** — `ag` (the_silver_searcher) not installed.

## Build Results
- `cd hs && make hs-build`: **SKIPPED** — long stack build; deferred.
- `cd js && make build`: **SKIPPED** — Docker daemon not running.
- `cd docs && make build`: **SKIPPED** — Docker daemon not running.

## Toolchain Audit (2026-07-21)
| Tool | Status | Pinned (DEPS) | Local |
|---|---|---|---|
| stack | present | v2.7.5 (README) | 3.3.1 |
| z3 | present | 4.8.17 | 4.12.5 |
| solc | present | 0.8.17 | 0.8.26 |
| mo | present | — | ok |
| node | present | 16.14 (images) | 24.11.1 |
| docker | installed, daemon NOT running | — | — |
| shellcheck | MISSING | — | — |
| hadolint | MISSING | — | — |
| ag | MISSING | — | — |
| goal | MISSING (symlink scripts/goal-devnet) | — | — |

## Action Items
- Install shellcheck, hadolint, ag: `brew install shellcheck hadolint the_silver_searcher`
- Symlink `scripts/goal-devnet` as `goal` on PATH (or install go-algorand)
- Reconcile solc/z3 versions with `DEPS` pins (relevant to the active `feat/solidity-update` branch)
- Start Docker daemon before js/docs/image builds
- Run `cd hs && make hs-build && make hs-test` once and update this baseline with pass/fail counts
