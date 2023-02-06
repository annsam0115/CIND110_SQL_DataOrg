db.Section.insert({ID: 'YJ5', C_Code: 'CIND123', Term: 'Spring', Year: 2020, Instructor: 'Sally'});
db.Section.insert({ID: 'KJ2', C_Code: 'CCPS305', Term: 'Fall', Year: 2021, Instructor: 'King'});
db.Section.insert({ID: 'YJ2', C_Code: 'CIND110', Term: 'Winter', Year: 2019, Instructor: 'Larry'});
db.Section.insert({ID: 'YJ3', C_Code: 'CIND110', Term: 'Fall', Year: 2020, Instructor: 'Sandy'});
db.Section.insert({ID: 'KJ3', C_Code: 'CIND110', Term: 'Winter', Year: 2019, Instructor: 'King'});
db.Section.insert({ID: 'DK0', C_Code: 'CIND123', Term: 'Winter', Year: 2022, Instructor: 'Sally'});
db.Section.insert({ID: 'DN0', C_Code: 'CIND119', Term: 'Fall', Year: 2021, Instructor: 'King'});
db.Section.insert({ID: 'DS0', C_Code: 'CIND110', Term: 'Winter', Year: 2022, Instructor: 'Larry'});
db.Section.insert({ID: 'DM0', C_Code: 'CCPS719', Term: 'Fall', Year: 2021, Instructor: 'Sandy'});
db.Section.insert({ID: 'KJ3', C_Code: 'CIND642', Term: 'Winter', Year: 2020, Instructor: 'Sally'});

db.Section.find({})

// Find the course codes that instructor King taught in each term //
db.Section.find({Instructor: 'King'}, {C_Code: 1, Term: 1, Instructor: 1} );

// Find out the courses and their instrutors after year 2020 onward //
db.Section.find({Year: {$gt:2020}}, {C_Code:1, Instructor:1} );

//Find out the courses taught in 2021 Fall Term //
db.Section.find({Term: 'Fall', Year: 2021}, {C_Code: 1, Term: 1, Year:1} );

// Find out distinct instructors of the course: //
db.Section.distinct("Instructor");

//Find distinct courses taught in the program by grouping them as per their codes //
db.Section.distinct("C_Code").sort(); 