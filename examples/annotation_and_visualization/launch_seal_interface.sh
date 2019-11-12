#!/bin/sh

# Setup VIAME Paths (set path if script moved to another directory)

export VIAME_INSTALL=./../..

source ${VIAME_INSTALL}/setup_viame.sh

# Launch the GUI
sealtk --pipeline-directory ${VIAME_INSTALL}/configs/pipelines/embedded_dual_stream

