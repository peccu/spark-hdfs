#!/bin/bash
jupyter lab \
        --ip=0.0.0.0 \
        --port=8888 \
        --no-browser \
        --allow-root \
        --NotebookApp.token=

        # --NotebookApp.tornado_settings='{\"headers\":{\"Content-Security-Policy\":\"frame-ancestors self *YourDomain.com*; report-uri /api/security/csp-report\"}}'"
