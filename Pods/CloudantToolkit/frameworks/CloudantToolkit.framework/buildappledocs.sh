#!/bin/bash

if [ -z "${PROJECT_DIR}" ]; then
PROJECT_DIR=$(pwd)
fi

if [ -z "${PROJECT_NAME}" ]; then
PROJECT_NAME="IMFData"
fi

if [ -z "$1" ]; then
OUTPUT_DIR="./doc"
else
OUTPUT_DIR=$1
fi

/usr/local/bin/appledoc \
--project-name "${PROJECT_NAME}" \
--project-company "IBM Mobile First - Data Service" \
--company-id "IBM" \
--output  "${OUTPUT_DIR}" \
--install-docset \
--logformat xcode \
--keep-undocumented-objects \
--keep-undocumented-members \
--keep-intermediate-files \
--no-repeat-first-par \
--no-warn-invalid-crossref \
--merge-categories \
--exit-threshold 2 \
--docset-platform-family iphoneos \
--include "${PROJECT_DIR}/${PROJECT_NAME}/Documentation/Images" \
--ignore "*.m" \
--ignore "LoadableCategory.h" \
--ignore "*Internal.h" \
--ignore "CDTRemoteStore.h" \
--ignore "CDTLocalStore.h" \
--ignore "CDTErrorUtil.h" \
--ignore "IMFDataErrorUtil.h" \
--ignore "CDTHttpHelper.h" \
--ignore "IMFClassNameIndexer.h" \
--ignore "IMFClassNameIndexer.h" \
--ignore "CDTCloudantQuery.h" \
--ignore "CDTCDTQuery.h" \
--ignore "CDTSearchQuery.h" \
--ignore "CDTViewQuery.h" \
--ignore "CDTOperation.h" \
--ignore "CDTStoreOperation.h" \
--ignore "CDTQueryCursor.h" \
--ignore "CDTQueryOperation.h" \
--ignore "CDTCloudantQueryOperation.h" \
--ignore "CDTViewQueryOperation.h" \
--ignore "CDTSearchQueryOperation.h" \
--ignore "CDTCDTQueryOperation.h" \
--ignore "IMFSubscription.h" \
--ignore "IMFDataProtocol.h" \
--ignore "CDTStore+IMFData.h" \
--index-desc "${PROJECT_DIR}/readme.markdown" \
"${PROJECT_DIR}/${PROJECT_NAME}"
