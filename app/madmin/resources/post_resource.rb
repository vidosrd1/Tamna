#class UserResource < Madmin::Resource
class PostResource < Madmin::Resource
  attribute :id, form: false
  attribute :name
  attribute :title, field: CustomField
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :body, index: false

  attribute :cat

#  attribute :subtitle, index: false
#  attribute :author
#  attribute :genre
#  attribute :pages, show: false
# Uncomment this to customize the display name of records in the admin area.
# def self.display_name(record)
#   record.name
# end

# Uncomment this to customize the default sort column and direction.
# def self.default_sort_column
#   "created_at"
# end
#
# def self.default_sort_direction
#   "desc"
# end
end
