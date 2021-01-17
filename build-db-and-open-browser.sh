#!/bin/bash

# generate DB from sql-script
sqlite3 Web\ Data < TestWebData.sql

# cleanup profiles folder
rm -rf ./profiles/

# re-create profile folder and copy db
mkdir -p ./profiles/ad-hoc-profile/
cp Web\ Data ./profiles/ad-hoc-profile/

# open chromium to test new profile
chromium --user-data-dir=./profiles/ --profile-directory=ad-hoc-profile https://docs.adyen.com/development-resources/test-cards/test-card-numbers