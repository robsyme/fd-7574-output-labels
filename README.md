# fd-7574-output-labels

Minimal Nextflow workflow that exercises **workflow output labels** and their
appearance in **data lineage** / Seqera Platform (ticket FD-7574).

Two published outputs carry labels via the `label` directive in the `output {}`
block:

| Output | Labels |
|--------|--------|
| `multiqc_report` | `qc`, `summary` |
| `alignments`     | `alignment`    |

Labels on outputs require Nextflow **25.05.0+** (this repo is tested with
`26.04.3`) and are stored in the `labels` field of `FileOutput` lineage records.

## Run locally (with lineage)

```bash
NXF_VER=26.04.3 nextflow run main.nf -c local.config -output-dir results
# Inspect the published FileOutput records:
grep -rl FileOutput .lineage | xargs grep -l '"labels":\[' | xargs cat
```

## Run on Seqera Platform

Lineage must be enabled at the workspace level (the workspace provides the
lineage store). Pin the Nextflow version with a pre-run script:

```bash
export NXF_VER=26.04.3
```
