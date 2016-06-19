namespace :seeds do
  # time bin/rake seeds:create
  task create: :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['seeds:data'].invoke
  end

  # time bin/rake seeds:data
  task data: :environment do
    puts 'Users'
    10.times do |i|
      User.create!(
        login: FFaker::InternetSE.user_name,
        name:  FFaker::Name.name,
        about: FFaker::DizzleIpsum.paragraph
      )
      print '.'
    end

    users = User.all

    puts
    puts 'Posts for the Users'

    users.each do |user|
      rand(10).times do |i|
        user.posts.create!(
          title:   FFaker::DizzleIpsum.sentence[0..200],
          content: FFaker::DizzleIpsum.paragraphs(5)
        )
        print '.'
      end
    end

    posts = Post.all

    puts
    puts 'Comments for the Posts'

    posts.each do |post|
      rand(10).times do |i|
        post.comments.create!(
          user:     post.user,
          contacts: FFaker::Internet.email,
          content:  FFaker::DizzleIpsum.paragraphs(5)
        )
        print '.'
      end
    end
  end
end