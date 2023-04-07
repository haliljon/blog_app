# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all

User.create!([{
               name: 'John Doe',
               photo: 'https://images.unsplash.com/photo-1616161610001-8b1b5b2b5f1f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
               bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nisl vitae ultricies lacinia, nisl nisl aliquet nisl, eget aliquet nisl nisl eu nunc. Sed euismod, nisl vitae ultricies lacinia, nisl nisl aliquet nisl, eget aliquet nisl nisl eu nunc.',
               posts_counter: 0
             },
              {
                name: 'Jane Doe',
                photo: 'https://images.unsplash.com/photo-1616161610001-8b1b5b2b5f1f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
                bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nisl vitae ultricies lacinia, nisl nisl aliquet nisl, eget aliquet nisl nisl eu nunc. Sed euismod, nisl vitae ultricies lacinia, nisl nisl aliquet nisl, eget aliquet nisl nisl eu nunc.',
                posts_counter: 0
              }])

p "Created #{User.count} users"
