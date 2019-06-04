#!/bin/bash
#########################################################################
#
# Copyright (c) 2018 Huawei Technologies Co.,Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at:
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#########################################################################

set -x

SCRIPT_DIR=`dirname $(readlink -f $0)`

cd $SCRIPT_DIR/../stacks/vpp

git clone https://gerrit.fd.io/r/vpp
cd vpp
git fetch https://gerrit.fd.io/r/vpp refs/changes/39/18639/2 && git checkout FETCH_HEAD
cp ../adapt/* src/vcl/
git apply --ignore-space-change --ignore-whitespace ../patch/vpp.patch
make UNATTENDED=yes install-dep
make build

