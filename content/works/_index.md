+++
title = "lovelin::works"
description = "Blah Blah"
template = "prose.html"

[extra]
lang = "en"

title = "Works"
subtitle = "Listed my work experiences, projects, open source contributions, publications, talks here."

+++

Some of these, I am very proud of. Some of them, maybe not so much. But I have become a better engineer with every minute spent working on them...

## Experiences

{{ collection(file="experiences.toml") }}

## Projects

{{ collection(file="projects.toml") }}

## Open source contributions

{{ collection(file="oss-contributions.toml") }}
