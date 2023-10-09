#!/usr/bin/env bash

students_file="students-list_0923.txt"

while true; do
    echo "Welcome to the ALU Student Registration System"
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Delete student record"
    echo "4. Update student record"
    echo "5. Exit"
    read -p "Please enter your choice (1/2/3/4/5): " choice

    case $choice in
        1)
            read -p "Enter student email: " email
            read -p "Enter student age: " age
            read -p "Enter student ID: " student_id
            echo "$email, $age, $student_id" >> "$students_file"
            echo "Student record created and saved."
            ;;
        2)
            if [ -s "$students_file" ]; then
                cat "$students_file"
            else
                echo "No students found."
            fi
            ;;
        3)
            read -p "Enter student ID to delete: " delete_id
            sed -i "/, $delete_id$/d" "$students_file"
            echo "Student with ID $delete_id deleted."
            ;;
        4)
            read -p "Enter student ID to update: " update_id
            if grep -q ", $update_id$" "$students_file"; then
                read -p "Enter updated email: " new_email
                read -p "Enter updated age: " new_age
                sed -i "s/.*$update_id$/$new_email, $new_age, $update_id/" "$students_file"
                echo "Student record updated."
            else
                echo "Student with ID $update_id not found."
            fi
            ;;
        5)
            echo "Exiting the application."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a valid option (1/2/3/4/5)."
            ;;
    esac
done

