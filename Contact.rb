gem 'activerecord' , '=4.2.10'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: "Contacts.sqlite3") 

class Contact < ActiveRecord::Base

    field :first_name, as: :string
    field :last_name, as: :string
    field :number, as: :integer, limit: 10
    field :email, as: :string
    

end

Contact.auto_upgrade!

at_exit do
    ActiveRecord::Base.connection.close
end