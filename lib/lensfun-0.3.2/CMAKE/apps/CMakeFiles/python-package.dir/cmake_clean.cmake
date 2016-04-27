FILE(REMOVE_RECURSE
  "CMakeFiles/python-package"
  "build/timestamp"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/python-package.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
