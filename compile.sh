#!/bin/bash
pp -p -o pre.par *.pl
pp -o pexec pre.par
rm pre.par
