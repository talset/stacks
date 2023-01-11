#!/usr/bin/env python

import yaml
import re

with open("pipeline/aws/variables.sample.yml", 'r') as stream:
    ppvars = yaml.safe_load(stream)

with open("pipeline/aws/pipeline.yml", "r") as f:
    pipeline = f.read()

for key,val  in ppvars.items():
    m = re.search(r'\(\(%s\)\)' % key, pipeline)
    if m is None:
        print("Variable: %s is not used" % key)
