namespace :ceimport do
  desc "Imports accounts from a local database called clientexec"

  task accounts: :environment do
    client = Mysql2::Client.new(:host => "localhost", :database => "clientexec", :socket => ENV['BOXEN_MYSQL_SOCKET'], :username => "root")
    results = client.query("SELECT * FROM users WHERE active = 1")
    Account.destroy_all
    count = 0
    results.each do |row|
      invoices = client.query("SELECT id FROM invoice WHERE customerid = #{row['id']}")
      if invoices.count > 0
        count += 1
        if row['is_organization'] == 1
          name = row['organization']
          is_individual = false
        else
          f = row['firstname'].titleize.strip
          l = row['lastname'].titleize.strip
          name = "#{f} #{l}"
          is_individual = true
          lorg = row['organization'].downcase
          lorg.strip!
          match = ['ds106', 'ds 106', 'washington', 'umw'].any? { |w| lorg =~ /#{w}/ }
          if !row['organization'].blank? && !match && lorg != "school"
            name = row['organization']
            is_individual = false
          end
        end
        coder = HTMLEntities.new
        name.strip!
        name = coder.decode(name)
        account = Account.find_or_create_by(:name => name, :is_individual => is_individual, :created_at => row['dateActivated']) if !name.blank?
        puts "created #{if is_individual then "individual" else "organization" end} account for #{account.name}"
      end
    end
    puts "Created #{count} accounts."
  end

end
