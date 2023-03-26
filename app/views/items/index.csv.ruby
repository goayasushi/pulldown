require 'csv'

CSV.generate do |csv|
  csv_column_names = ["製品名","仕入先"]
  csv << csv_column_names
  @items.each do |item|
    csv_column_values = [
      item.product,
      item.client.name,
    ]
    csv << csv_column_values
  end
end