class AdminForm < Reform::Form
  EMAIL_REGEX = /@/

  property :email
  property :first_name
  property :last_name

  validation do
    required(:email).filled(format?: EMAIL_REGEX)
    required(:first_name).filled
    required(:last_name).filled
  end
end
