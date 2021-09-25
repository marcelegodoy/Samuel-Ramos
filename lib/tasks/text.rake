# Run it with rake sidebar_text:generate
namespace :sidebar_text do
  desc "Create Categories"
  task generate: :environment do
    p '-----------------'
    p 'Creating sidebar text'

    Text.find_or_create_by( identifier: "Samuel Ramos Arquitetura & Urbanismo",
                            content: "This typeface started as an interpretation of Albert Hollenstein’s famous «Brasilia» from 1958. A second version (G) with vertical terminals was drawn in order to let the modernistic feeling collide with a more humanistic expression. The untypical long tails of /f, /j, /r and /t are emphasized and accompanied with stylistic alternatives to give it a more contemporary feeling.")

    p '-----------------'
    p 'All set!'
    p '-----------------'
  end

  task destroy: :environment do
    p 'Deleting all existing Categories'
    Text.destroy_all
  end
end
