#!/bin/bash

print_usage(){
    printf "Please enter an integer: "
}

read -p "please input your number:" firstnum

if [ -n "`echo ${firstnum}|sed 's/[0...9]//g'`" ]
   then
        print_usage

fi

read -p "Please input your operator:" operator

if [ "${operator}" != "+" ] && [ "${operator}" != "-" ] && [ "${operator}" != "*" ] && [ "${operator}" != "/" ]
  then
        echo "Only can input +-*/"
fi


read -p "please input the second number:" secondnum

if [ -n "`echo $secondnum|sed 's/[0-9]//g'`" ]
   then
        print_usage

fi

echo "${firstnum}${operator}${secondnum} THE RESULT IS: $((${firstnum}${operator}${secondnum}))"