# darwincore
Darwin Core object class for R, and associated tools.

MW NOTE: I started this package because it's possible we will need a way to 
store whole Darwin Core Archives in memory in R at some point. This would 
provide a few features that are currently lacking:

  - loss-less transformation to/from dwca.zip within an R session (currently
    galah can import a tibble, but only from occurrences.csv, and doesn't 
    support metadata or schema importing)
  - link DwCA code in a single place, rather than separate codebases in galah
    and galaxias
  - support validation checks that require multiple files to be in memory
    simultaneously (e.g. event core)
  
Disadvantage include that it breaks the philosophical and practical benefit 
delivered by galaxias to build DwCAs through a fixed repo structure (as devtools 
does for R package); adds extra maintanence overhead; and could be slow for
large datasets.
