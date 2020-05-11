#! /bin/bash
echo '开始验证'
pod spec lint NPNavigationBar.podspec --use-libraries --allow-warnings --verbose
echo '开始推送'
pod trunk push NPNavigationBar.podspec --allow-warnings --use-libraries --verbose

