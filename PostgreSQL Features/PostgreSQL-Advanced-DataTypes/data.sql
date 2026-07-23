INSERT INTO employees
(full_name,department,salary,skills,profile)

VALUES

(
'Aarav Sharma',
'AI & ML',
95000,

ARRAY[
'Python',
'SQL',
'TensorFlow'
],

'{
"email":"aarav@gmail.com",
"city":"Pune",
"experience":3,
"certified":true
}'
),

(
'Priya Patel',
'Data Science',
105000,

ARRAY[
'Python',
'Power BI',
'PostgreSQL'
],

'{
"email":"priya@gmail.com",
"city":"Mumbai",
"experience":5,
"certified":true
}'
),

(
'Rahul Singh',
'Backend',

85000,

ARRAY[
'Java',
'Spring',
'PostgreSQL'
],

'{
"email":"rahul@gmail.com",
"city":"Nagpur",
"experience":2,
"certified":false
}'
),

(
'Sneha Joshi',
'AI & ML',

120000,

ARRAY[
'Python',
'PyTorch',
'SQL'
],

'{
"email":"sneha@gmail.com",
"city":"Delhi",
"experience":6,
"certified":true
}'
),

(
'Vivek Patil',
'DevOps',

90000,

ARRAY[
'Docker',
'Linux',
'AWS'
],

'{
"email":"vivek@gmail.com",
"city":"Hyderabad",
"experience":4,
"certified":false
}'
);