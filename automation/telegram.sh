#!/bin/bash
BOT_URL="https://api.telegram.org/bot1950741119:AAHu7wWyllaAimxgufGF7t8Idb-rgyb8CGM/sendMessage"
TELEGRAM_CHAT_ID="-4530453506"
# Set formatting
PARSE_MODE="Markdown"
COMMIT=$(git log -1 --pretty=format:"%s")
BUILD_STATUS="SUCCESS"
REPOSITORY="demo"
BRANCH_NAME="develop"
VERSION="1.0.0"

# Send message function
send_msg () {
    curl -s -X POST ${BOT_URL} -d chat_id=$TELEGRAM_CHAT_ID \
        -d text="$1" -d parse_mode=${PARSE_MODE}
}


# Call send message with the message
send_msg "
\`-----------------------------------------------------------\`
Deploy 🚀*${BUILD_STATUS}!*
\`Repository 📦:  ${REPOSITORY}\`
\`Branch 🏷:      ${BRANCH_NAME}\`
\`Version ✅:      ${VERSION}\`
*Commit Msg 💭:*
_${COMMIT}_
[Job Log view here 🤟](${BUILD_URL})
\`-----------------------------------------------------------\`
"
