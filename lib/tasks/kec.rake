namespace :kec do
  desc 'Fetches KEC groups'
  task groups: :environment do
    client = KecClient.new
    ActiveRecord::Base.connection.execute("TRUNCATE #{Group.table_name}")
    client.groups.each do |json_data|
      Group.new.tap do |g|
        g.id = json_data['groupId']
        g.name = json_data['name']
        g.book = json_data['book']
        g.branch_office_id = json_data['branchOffice']['branchOfficeId']
        g.save!
      end
    end
  end

  task marks: :environment do
    client = KecClient.new
    ActiveRecord::Base.connection.execute("TRUNCATE #{Mark.table_name}")
    Group.limit(20).each do |group|
      marks = client.marks(group.id)
      puts "Found #{marks.size} marks for #{group.name}"
      marks.each do |json_data|
        Mark.new.tap do |m|
          m.id = json_data['markId']
          m.group_id = json_data['group']['groupId']
          m.lesson_id = json_data['lesson']['lessonId']
          m.teacher_id = json_data['teacher']['teacherId']
          m.test = json_data['lesson']['test']
          m.date = Time.at(json_data['lesson']['date'].to_i / 1000).to_date
          m.value = json_data['value'].to_i
          m.save!
        end
      end
    end
  end
end
