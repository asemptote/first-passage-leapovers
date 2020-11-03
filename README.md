# First passage leapovers of Lévy flights and the proper formulation of absorbing boundary conditions

This repository houses the code used to produce the figures in the article [_First passage leapovers of Lévy flights and the proper formulation of absorbing boundary conditions_](https://doi.org/10.1088/1751-8121/ab8b37). 

## Requirements

Wolfram Language 11.3 onwards

## Usage

The notebook `first_passage_leapovers.nb` contains a timestamped record of the raw computations used to produce the figures. Each raw result has been iconised in the notebook with shortened names, e.g. *empirical FPLD*. These computations were run in parallel on a cluster of ~200 cores.

The packages in `wlPackages/` contain helper functions used to streamline the presentation in the notebook when computing its results. In particular, `InverseLaplace.wl` contains an optimised rewriting of [an implementation](https://github.com/ghorvath78/iltcme/blob/master/mathematica_ilt.nb) of the [CME algorithm](inverselaplace.org/) for computing the inverse Laplace transform.
