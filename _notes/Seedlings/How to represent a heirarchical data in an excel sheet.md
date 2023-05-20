---
layout: note
aliases: [How to represent a hierarchical data in an excel sheet]
title:
tags: 
source:
compiler:
category:
linter-yaml-title-alias: How to represent a hierarchical data in an excel sheet
---

# How to represent a hierarchical data in an excel sheet

I recently encountered an intriguing challenge: representing hierarchical data in an Excel sheet. The data consisted of an indented list with multiple levels of nesting, up to eight levels. My goal was to prepare a CSV file that could be imported into Kumu, a platform known for its non-hierarchical nature. I hypothesized that by connecting each node to its parent, I could achieve the desired representation in Kumu.

This presented me with Challenge 1: transforming the indented list into a CSV file while preserving the attributes of each node, such as its depth and path within the hierarchy.

During my search for a solution, I came across Treeline, a tool that caught my attention due to its ability to organize data using vocabularies in a compact manner. Interestingly, Treeline accepted tab-indented text files as input, which aligned perfectly with my requirements. Using Treeline, I successfully converted the data into an HTML file and achieved the desired outcome.

In summary, the challenge involved converting an indented list with hierarchical data into a CSV file, while preserving important attributes. Through the use of tools like Treeline, I was able to overcome this challenge and generate a suitable representation for further analysis in Kumu.

[Treeline](https://treeline.bellz.org)