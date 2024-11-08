# PowerAnalysis

**PowerAnalysis** is a versatile toolkit for estimating sample sizes across diverse study designs. It includes methods for basic ANOVA-based power calculations, longitudinal study power estimates, and advanced calculations that adjust for covariate effects in longitudinal data. This toolkit is particularly useful for robust study planning in microbiome and biomedical research.

---

## Microbiome-Specific Power Analysis: `PowerAnalysis.ipynb`

This module includes microbiome-specific power calculations for analyzing microbial diversity and abundance differences. Key features include:

- **Power Calculation Using Means**  
  Estimates the sample size required to detect differences in continuous diversity measures (e.g., Shannon index) across groups.

- **Power Calculation Using Proportions**  
  Calculates sample sizes for comparing the prevalence or proportion of specific microbial taxa between groups, with adjustments for varying group sizes.

---

## ANOVA-Based Power Calculation: `PowerCalculation_ANOVAbased.ipynb`

This ANOVA-based module for power analysis, focusing on group-level differences and repeated measures. It provides:

- **Sample Size Estimation Using ANOVA**  
  Determines the required sample size per group for detecting differences across multiple groups, based on specified effect sizes.

---

## Key Features

1. **Type 1: Basic Power Calculation**  
   - ANOVA-based sample size estimation suitable for cross-sectional studies or group comparisons.

2. **Type 2: Longitudinal Data Power Calculation**  
   - Adjustments for ICC: Incorporates intra-class correlation (ICC) adjustments for repeated measures, ensuring accurate power estimates for clustered data (e.g., within-subject longitudinal studies).
   - Accounts for time-based dependencies and within-subject variability in repeated measures, providing robust power estimates for longitudinal studies.

4. **Type 3: Covariate-Adjusted Longitudinal Data Power Calculation**  
   - Provides sample size estimates for longitudinal studies with covariate effect adjustments, ideal for studies where confounding factors may influence power.

---

This toolkit offers essential power estimation tools, specifically designed to handle the complexities of microbiome data analysis, aiding researchers in planning rigorous studies.


## Getting Started

### Prerequisites
To use PowerAnalysis, you’ll need the following Python packages:
- **numpy** (For efficient numerical operations)
- **pandas** (For data manipulation and analysis)
- **matplotlib** (For data visualization and plotting)
- **scipy** (For scientific and statistical computations, including probability distributions, optimizations, and specialized math functions)
- **statsmodels** (for statistical modeling and power calculations)
<!--- For installation instructions, see [Installation Guide](#installation) -->

Make sure these packages are installed in your environment.

### Installation
To install the package and dependencies, run:
```bash
pip install -r requirements.txt
```
### Contact
🤚 Important
For any questions, please contact: 👉 Ashok K. Sharma; ashoks773@gmail.com
