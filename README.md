# [CM_analysis]
 [working on this]
What does your project do?

## config instruction

How does the user access your project? (E.g. download, or clone with git clone…)

How does the user call the main script(s) that should be executed?
## installation instructions

## operating instructions

## Project organization
- PG = project-generated
- HW = human-writable
- RO = read only
```
.
├── .gitignore
├── CITATION.md
├── LICENSE.md
├── README.md
├── requirements.txt
├── bin                <- Compiled and external code, ignored by git (PG)
│   └── external       <- Any external source code, ignored by git (RO)
├── config             <- Configuration files (HW)
├── data               <- All project data, ignored by git
│   ├── processed      <- The final, canonical data sets for modeling. (PG)
│   ├── raw            <- The original, immutable data dump. (RO)
│   └── temp           <- Intermediate data that has been transformed. (PG)
├── docs               <- Documentation notebook for users (HW)
│   ├── manuscript     <- Manuscript source, e.g., LaTeX, Markdown, etc. (HW)
│   └── reports        <- Other project reports and notebooks (e.g. Jupyter, .Rmd) (HW)
├── results
│   ├── figures        <- Figures for the manuscript or reports (PG)
│   └── output         <- Other output for the manuscript or reports (PG)
└── src                <- Source code for this project (HW)

## file manifest (files included)





## Copy right & License

This project is licensed under the terms of the [GPL-3.0 License](/LICENSE.md)

## Contact info
Femke van Esch: F.a.w.j.vanEsch@uu.nl

## Known bugs
The function calc_degrees_goW.R does not return what it is supposed to

## Troubleshooting

## Credits and acknowledgements

## Citation info
