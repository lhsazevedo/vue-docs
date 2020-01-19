# !/bin/bash
cd docs/
# git init

function print_error() {
    echo -e "\e[31mERROR: ${1}\e[m"
}
# # 配置仓库地址
# if [ -n "${EXTERNAL_REPOSITORY}" ]; then
#     PUBLISH_REPOSITORY=${EXTERNAL_REPOSITORY}
# else
#     PUBLISH_REPOSITORY=${GITHUB_REPOSITORY}
# fi
# # 配置ssh
# if [ -n "${DEPLOY_ACCESS_TOKEN}"]; then
#     echo "设置 DEPLOY_ACCESS_TOKEN"
#     SSH_DIR="/root/.ssh"
#     mkdir "${SSH_DIR}"
#     ssh-keyscan -t rsa github.com >"${SSH_DIR}/known_hosts"
#     echo "${DEPLOY_ACCESS_TOKEN}" >"${SSH_DIR}/id_rsa"
#     chmod 400 "${SSH_DIR}/id_rsa"

#     remote_repo="git@github.com:${PUBLISH_REPOSITORY}.git"
# fi
# # 检查要发布的脚本
# if [ -z "${PUBLISH_BRANCH}"]; then
#     print_error "致命错误：没有发现 PUBLISH_BRANCH"
#     exit 1
# fi
# # 跳过配置personal_token 和 github_token
# remote_branch="${PUBLISH_BRANCH}"

# # 配置git
# git config user.name "${GITHUB_ACTOR}"
# git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
# git remote rm origin || true

# # git提交
# git add .
# git commit -m "[Deploy sucess]：$(date)"

if [ -n ${ACTIONS_DEPLOY_KEY}]; then
    print_error "11-ACTIONS_DEPLOY_KEY"
    echo "设置 DEPLOY_ACCESS_TOKEN"
    SSH_DIR="/root/.ssh"
    mkdir "${SSH_DIR}"
    ssh-keyscan -t rsa github.com >"${SSH_DIR}/known_hosts"
    echo "${DEPLOY_ACCESS_TOKEN}" >"${SSH_DIR}/id_rsa"
    chmod 400 "${SSH_DIR}/id_rsa"

    remote_repo="git@github.com:${PUBLISH_REPOSITORY}.git"
elif [ -n "${PERSONAL_TOKEN}"]; then
    print_error "22-PERSONAL_TOKEN"
elif [ -n "${GITHUB_TOKEN}"]; then
    print_error "GITHUB_TOKEN"
else
    print_error "啥都没有，将终止 "
    exit 1
fi
# 抛出错误
set -e

# 用echo 拼装，否则会无效！！测试了上百次的结果,access token 会被过滤

echo $(git push -f https://veaba:${ACCESS_TOKEN_PUSH}@github.com/veaba/vue-docs.git master:gh-pages)

echo $(ls)

echo $(pwd)

echo $(export)

echo "漂亮！部署成功： $(date)"
