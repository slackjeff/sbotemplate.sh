#!/bin/sh
#=================HEADER=============================================|
#AUTOR
# Jefferson 'slackjeff' Rocha <root@slackjeff.com.br>
#
# Create template archives
#
#====================================================================|

#================================START
_GENERATE()
{
    program="$1"
    program=$(echo "$program" | tr A-Z a-z)

    for create in 'slack-desc' "${program}.SlackBuild" "${program}.info" "README" 'doinst.sh'; do
        if [ "$create" = "slack-desc" ]; then
            echo '|-----handy-ruler------------------------------------------------------|' >> "slack-desc"
            echo "$program: $program (Short description of the application)" >> "slack-desc"
            echo "$program:" >> "slack-desc"
            echo "$program:" >> "slack-desc"
            echo "$program:" >> "slack-desc"
            echo "$program:" >> "slack-desc"
            echo "$program:" >> "slack-desc"
            echo "$program:" >> "slack-desc"
            echo "$program:" >> "slack-desc"
            echo "$program:" >> "slack-desc"
            echo "$program:" >> "slack-desc"
            echo "$program:" >> "slack-desc"
        elif [ "$create" = ${program}.info ]; then
            echo 'PRGNAM=""'                     >> "$create"
            echo 'VERSION=""'                    >> "$create"
            echo 'HOMEPAGE=""'                   >> "$create"
            echo 'DOWNLOAD=""'                   >> "$create"
            echo 'MD5SUM=""'                     >> "$create"
            echo 'DOWNLOAD_x86_64=""'            >> "$create"
            echo 'MD5SUM_x86_64=""'              >> "$create"
            echo 'REQUIRES=""'                   >> "$create"
            echo 'MAINTAINER="Jefferson Rocha"'  >> "$create"
            echo 'EMAIL="root@slackjeff.com.br"' >> "$create"
        else
            > "$create"
        fi
    done
}


#===========================START
case $1 in
    -b|build)
        shift
        [ -z "$1" ] && { echo 'name of application?'; exit 1 ;}
        _GENERATE "$1"
    ;;
    *) echo "-b or build + name of application."
       echo "Example: sbotemplate.sh -b mozilla-firefox"
    ;;
esac
