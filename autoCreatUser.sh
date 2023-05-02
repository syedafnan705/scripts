
#!/bin/bash
read -p " please enter a valid user name :" USER_NAME
echo $USER_NAME
if [ -z "$USER_NAME" ]; then
    echo "Its not a valid user name"
else
    echo " the username is $USER_NAME"
    EX_USER=$(cat /etc/passwd | cut -d ":" -f1 | grep -w $USER_NAME)
    if [ "$USER_NAME" = "EX_USER" ]; then
        echo "user $USER_NAME already exist please select a different username"
    else
        AUTO_GENERATE_PASSWD=$(echo '!@#$%^&*()~' | fold -w1 | shuf | head -1)
        PASSWORD="${RANDOM}${AUTO_GENERATE_PASSWD}"
        echo $PASSWORD
        useradd -m $USER_NAME
        echo "$USER_NAME:$PASSWORD" | sudo chpasswd
        passwd -e "${USER_NAME}"
    fi
fi

