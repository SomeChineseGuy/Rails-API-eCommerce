class ApiCalls
  def products_data
      data = RestClient.get 'http://localhost:3000/api/v1/products.json'
      puts JSON.parse(data.body)
      puts '=========================================='
      if data
        data
      else
        false
    end
  end

    def categories_data
      data2 = RestClient.get 'http://localhost:3000/api/v1/categories.json'
      puts JSON.parse(data2.body)
      puts '=========================================='
      if data2
        data2
      else
        false
    end
  end
end