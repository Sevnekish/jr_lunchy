ActiveAdmin.register Organization do
config.per_page = 20

permit_params :name
end
