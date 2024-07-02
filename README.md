# GeoSpatial-Point-Pattern-Analysis
My R Scripts for Point Pattern Analysis: Statistics & Visuals.

This repository contains scripts for analyzing cell spatial attachment distributions using point pattern analysis. The main steps include:
- Conducting microscopic imaging to obtain image panels showing cell locations. Multiple panels are stitched together to view the overall surface of interest.
- Transferring cell locations into coordinates relative to the stitched image frame.
- Analyzing point distributions to determine whether the attachment distribution forms aggregation using statistical analysis.
- Providing scripts with loops to generate outputs for a series of images taken over time.
- Individual image data loading and analysis scripts without loops are available in the [folder for individual panels](/Individual_Panel), the [folder for initial practice](/Initial_Practice), and the [folder for individual replicates over time](/Individual_Reps_AcrossTimePoints).

## Types of Analysis Include:
- **Point Intensity Probability Heatmaps**: [script](/All_Plots_Quardrant_methylcell_Aggregates.R)
  - Sample plot:
  ![Point Intensity](/Sample_Plots/SamplePlot_Point_Intensity_Probability.jpg)
- **Image Quadrant Cell Counting and Chi-Square Test for Aggregated Patterns**:
  - Sample plot:
  ![Quadrant Counting](/Sample_Plots/Plots_Quadrant_Aggregates.jpg)
- **Comparison with Manually Created Patterns**: Creating random and regular point patterns to compare with the sample point distribution.
  - Sample plot:
  ![Comparison with Manually Created Patterns](/Sample_Plots/sample_random_regular.jpg)
- **Fitting Point Patterns into Distribution Functions**: Comparing with the Poisson distribution.
  - Sample plot:
  ![Distribution Function Fitting](/Sample_Plots/point_distribution_functions_fitting_vs_Prois.jpg)

## Data Formatting
- All R scripts require data in Excel or CSV formats.
- Data should include coordinates for the points on an image.
- Point coordinates for each stitched panel image should occupy one data sheet:
  - Two columns: one for x-axis coordinates and one for y-axis coordinates.
  - An additional set of data is needed for the four coordinates to define the rectangular map surface.

## Data Visualization
Scripts for visualization are designed to be color-blindness proof and publication-ready.

## Mapping Steps
The transformation from point coordinates to plots with points on a polygon shape involves the following steps:
- Creating the polygon shape.
- Converting the shape and point coordinates into ppp objects.
- Mapping the point ppp objects to their corresponding polygon shape ppp objects.

## Statistical Analysis
- **Point Intensity Probability Heatmaps**: [script](/All_Plots_Quardrant_methylcell_Aggregates.R)
- **Image Quadrant Cell Counting and Chi-Square Test for Aggregated Patterns**: [script](/Quadrant_Aggregates.R)
- **Creation of Random and Regular Point Patterns for Comparison**.
- **Box Whisker Plots for Chi-Square Test Values**: [script](/box_whisker_plot.R)


