#!/bin/bash

# Setup VIAME Paths (set path if script moved to another directory)
export VIAME_INSTALL="$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)"

source ${VIAME_INSTALL}/setup_viame.sh || exit $?

# Launch the GUI
exec sealtk --pipeline-directory ${VIAME_INSTALL}/configs/pipelines/embedded_dual_stream

