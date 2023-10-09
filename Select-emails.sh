#!/usr/bin/env bash

students_file="students-list_0923.txt"
output_file="student-emails.txt"

awk -F ', ' '{print $1}' "$students_file" > "$output_file"

echo "Student emails extracted and saved in $output_file."

