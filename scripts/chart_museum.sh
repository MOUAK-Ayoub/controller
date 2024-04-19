#!/bin/bash

sudo curl https://raw.githubusercontent.com/helm/chartmuseum/main/scripts/get-chartmuseum | bash
mkdir -p  ~/helm/repo
chartmuseum --storage="local" --storage-local-rootdir="~/helm/repo/"