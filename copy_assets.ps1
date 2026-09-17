# Create images directory if not exists
New-Item -ItemType Directory -Force -Path "images" | Out-Null

# Source brain folder
$brain = "C:\Users\nasir\.gemini\antigravity-ide\brain\87aba70b-19c7-4618-b39d-0b5c48fd42af"

# Copy images
Copy-Item "$brain\virtual_classroom_video_1789616430018.jpg" -Destination "images\virtual-class.jpg" -Force
Copy-Item "$brain\pakistani_student_learning_1789613687858.jpg" -Destination "images\hero-student.jpg" -Force
Copy-Item "$brain\pakistani_mother_homeschooling_1789613708742.jpg" -Destination "images\parent-mentorship.jpg" -Force
Copy-Item "$brain\early_years_learning_1789613732993.jpg" -Destination "images\early-years.jpg" -Force
Copy-Item "$brain\student_cutout_model_1789615662277.jpg" -Destination "images\student-cutout.jpg" -Force

Write-Host "All high-resolution assets (including virtual classroom video frame) copied to images/ successfully!" -ForegroundColor Green
