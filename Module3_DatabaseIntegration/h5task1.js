use college_nosql

db.createCollection("feedback")

db.feedback.insertMany([
{
  student_id: 1,
  course_code: "CS101",
  semester: "2022-ODD",
  rating: 5,
  comments: "Excellent teaching and practical examples.",
  tags: ["well-structured", "good-examples"],
  submitted_at: ISODate("2022-11-30T10:15:00Z"),
  attachments: [
    { filename: "notes.pdf", size_kb: 240 }
  ]
},
{
  student_id: 2,
  course_code: "CS101",
  semester: "2022-ODD",
  rating: 4,
  comments: "Very informative course.",
  tags: ["challenging", "interesting"],
  submitted_at: ISODate("2022-11-28T09:30:00Z"),
  attachments: [
    { filename: "assignment.pdf", size_kb: 180 }
  ]
},
{
  student_id: 3,
  course_code: "CS101",
  semester: "2023-EVEN",
  rating: 3,
  comments: "Course was good but assignments were tough.",
  tags: ["challenging", "difficult"],
  submitted_at: ISODate("2023-04-15T12:00:00Z"),
  attachments: [
    { filename: "review.docx", size_kb: 120 }
  ]
},
{
  student_id: 4,
  course_code: "CS102",
  semester: "2022-ODD",
  rating: 5,
  comments: "Excellent faculty support.",
  tags: ["supportive", "interactive"],
  submitted_at: ISODate("2022-12-01T08:00:00Z"),
  attachments: [
    { filename: "feedback.pdf", size_kb: 100 }
  ]
},
{
  student_id: 5,
  course_code: "CS102",
  semester: "2023-EVEN",
  rating: 2,
  comments: "Too much theory and less practical work.",
  tags: ["theory", "needs-improvement"],
  submitted_at: ISODate("2023-05-01T15:30:00Z"),
  attachments: [
    { filename: "suggestions.pdf", size_kb: 210 }
  ]
},
{
  student_id: 6,
  course_code: "CS201",
  semester: "2023-ODD",
  rating: 4,
  comments: "Interesting topics and good examples.",
  tags: ["good-examples", "interesting"],
  submitted_at: ISODate("2023-11-10T11:00:00Z"),
  attachments: [
    { filename: "labnotes.pdf", size_kb: 300 }
  ]
},
{
  student_id: 7,
  course_code: "CS202",
  semester: "2023-ODD",
  rating: 1,
  comments: "Course material needs improvement.",
  tags: ["difficult", "poor-material"],
  submitted_at: ISODate("2023-11-12T13:45:00Z"),
  attachments: [
    { filename: "report.pdf", size_kb: 95 }
  ]
},
{
  student_id: 8,
  course_code: "CS301",
  semester: "2024-EVEN",
  rating: 5,
  comments: "One of the best courses in the curriculum.",
  tags: ["excellent", "recommended"],
  submitted_at: ISODate("2024-04-20T10:20:00Z"),
  attachments: [
    { filename: "certificate.pdf", size_kb: 250 }
  ]
},
{
  student_id: 9,
  course_code: "CS302",
  semester: "2024-EVEN",
  rating: 4,
  comments: "Good teaching methodology.",
  tags: ["good-examples", "well-structured"],
  submitted_at: ISODate("2024-04-22T09:10:00Z")
},
{
  student_id: 10,
  course_code: "CS303",
  semester: "2024-EVEN",
  rating: 3,
  comments: "Average course with decent content.",
  tags: ["average"],
  submitted_at: ISODate("2024-04-25T14:30:00Z"),
  attachments: [
    { filename: "feedback.docx", size_kb: 140 }
  ]
}
])

db.feedback.countDocuments()

db.feedback.find().pretty()