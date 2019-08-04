#!/bin/sh
#=================HEADER=============================================|
#AUTOR
# Jefferson 'slackjeff' Rocha <root@slackjeff.com.br>
#
# Create template archives
#
#====================================================================|


_GENERATE()
{
    program="$1"
    program=$(echo "$program" | tr A-Z a-z)

    for create in 'slack-desc' "${program}.SlackBuild" "${program}.info" "README" 'doinst.sh'; do
        if [ "$create" = "slack-desc" ]; then
            cat << EOF > "slack-desc"
# HOW TO EDIT THIS FILE:
# The "handy ruler" below makes it easier to edit a package description.  Line
# up the first '|' above the ':' following the base package name, and the '|' on
# the right side marks the last column you can put a character in.  You must make
# exactly 11 lines for the formatting to be correct.  It's also customary to
# leave one space after the ':'.

        |-----handy-ruler------------------------------------------------------|
$program: $program (Short description of the application)
$program:
$program:
$program:
$program:
$program:
$program:
$program:
$program:
$program:
$program:
EOF
		elif [ "$create" = ${program}.info ]; then
		    cat <<EOF > "$create"
PRGNAM=""
VERSION=""
HOMEPAGE=""
DOWNLOAD=""
MD5SUM=""
DOWNLOAD_x86_64=""
MD5SUM_x86_64=""
REQUIRES=""
MAINTAINER="Jefferson Rocha"
EMAIL="root@slackjeff.com.br"
EOF
        else
            > "$create"
        fi
    done
}


#===========================START
case $1 in
    -b|build)
        shift
        [ -z "$1" ] && { echo "name of application?"; exit 1 ;}
        _GENERATE "$1"
    ;;
    *) echo "-b or build + name of application."
       echo "Example: sbotemplate.sh -b mozilla-firefox"
    ;;
esac
