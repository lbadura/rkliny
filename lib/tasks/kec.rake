namespace :kec do
  desc 'Fetches KEC groups'
  task groups: :environment do
    client = KecClient.new
    # save groups
    client.groups.each do |json_data|
      group = Group.where(id: json_data['groupId']).first_or_initialize.tap do |g|
        #g.id = json_data['groupId']
        g.name = json_data['name']
        g.book = json_data['book']
        g.branch_office_id = json_data['branchOffice']['branchOfficeId']
        g.save!
      end

      # save students
      json_data['students'].each do |student_data|
        Student.where(id: student_data['studentId']).first_or_initialize.tap do |student|
          #student.id = student_data['studentId']
          student.group_id = json_data['groupId']
          student.first_name = student_data['user']['firstName']
          student.last_name = student_data['user']['lastName']
          student.office_id = student_data['branchOfficeName']
          student.save!
        end
      end

      # save teachers
      [json_data['firstTeacher'], json_data['secondTeacher']].each do |teacher_data|
        next if teacher_data.nil?
        teacher = Teacher.where(id: teacher_data['teacherId']).first_or_initialize.tap do |teacher|
          teacher.id = teacher_data['teacherId']
          teacher.first_name = teacher_data['user']['firstName']
          teacher.last_name = teacher_data['user']['lastName']
          teacher.office_id = teacher_data['branchOfficeName']
          teacher.save!
        end
        teacher.groups << group
        teacher.save!
      end
    end
  end

  task marks: :environment do
    client = KecClient.new
    ActiveRecord::Base.connection.execute("TRUNCATE #{Mark.table_name}")
    Group.all.each do |group|
      marks = client.marks(group.id)
      puts "Found #{marks.size} marks for #{group.name}"
      marks.each do |json_data|
        Mark.new.tap do |m|
          m.id = json_data['markId']
          m.group_id = json_data['group']['groupId']
          m.lesson_id = json_data['lesson']['lessonId']
          m.teacher_id = json_data['teacher']['teacherId']
          m.student_id = json_data['student']['studentId']
          m.test = json_data['lesson']['test']
          m.date = Time.at(json_data['lesson']['date'].to_i / 1000).to_date
          m.value = json_data['value'].to_i
          m.topic = json_data['topic']
          m.save!
        end
      end
    end
  end

  task lessons: :environment do
    client = KecClient.new
    ActiveRecord::Base.connection.execute("TRUNCATE #{Mark.table_name}")
    Group.all.each do |group|
      lessons = client.lessons(group.id)
      puts "Found #{lessons.size} lessons for #{group.name}"
      lessons.each do |json_data|
        Lesson.where(id: json_data['lessonId']).first_or_initialize.tap do |l|
          l.id = json_data['lessonId']
          l.date = Time.at(json_data['date'].to_i / 1000).to_date
          l.group_id = json_data['group']['groupId']
          l.teacher_id = json_data['teacher']['teacherId']
          l.test = json_data['test']
          l.topic = json_data['topic']
          l.homework = json_data['homework']
          l.save!
        end
      end
    end
  end
end
