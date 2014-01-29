json.array!(@tasktops) do |tasktop|
  json.extract! tasktop, :id, :name, :weight, :owner
  json.url tasktop_url(tasktop, format: :json)
end
