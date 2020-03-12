require 'csv'

csv_text = CSV.read('scripts/thinkindia_member_info.csv', headers: true)

csv_text.each do |row|
  User.create( 
    email: row["Username"],
    password: 'donotbreakit',
    password_confirmation: 'donotbreakit',
    name: row["Name"],
    roll_no: row["Roll Number"],
    batch_and_year: row["Batch and Year"],
    aim_and_future_plan: row["Aim/Future Plan"],
    other_details: row["Anything else you want to share.."],
    hometown: row["Hometown"],
    interest_area: row["Interested in"],
    hobbies: row["Hobbies"]
  )
end
