# MX::InstitutionsApi

Method | HTTP request | Description
------------- | ------------- | -------------
[**list_institutions**](InstitutionsApi.md#list_institutions) | **GET** /institutions | List institutions
[**read_institution**](InstitutionsApi.md#read_institution) | **GET** /institutions/{institution_code} | Read institution
[**read_institution_credentials**](InstitutionsApi.md#read_institution_credentials) | **GET** /institutions/{institution_code}/credentials | Read institution credentials


# **list_institutions**
> Institutions list_institutions(opts)

List institutions

This endpoint allows you to see what institutions are available for connection. Information returned will include the institution_code assigned to a particular institution, URLs for the financial institution's logo, and the URL for its website.<br> This endpoint takes an optional query string, name={string}. This will list only institutions in which the appended string appears. 

### Example
```ruby
# load the gem
require 'atrium-ruby'
# setup authorization
MX.configure do |config|
  # Configure API key authorization: apiKey
  config.api_key['MX-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['MX-API-Key'] = 'Bearer'

  # Configure API key authorization: clientID
  config.api_key['MX-Client-ID'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['MX-Client-ID'] = 'Bearer'
end

api_instance = MX::InstitutionsApi.new

opts = { 
  name: 'name_example', # String | This will list only institutions in which the appended string appears.
  page: 12, # Integer | Specify current page.
  records_per_page: 12, # Integer | Specify records per page.
}

begin
  #List institutions
  result = api_instance.list_institutions(opts)
  p result
rescue MX::ApiError => e
  puts "Exception when calling InstitutionsApi->list_institutions: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| This will list only institutions in which the appended string appears. | [optional] 
 **page** | **Integer**| Specify current page. | [optional] 
 **records_per_page** | **Integer**| Specify records per page. | [optional] 

### Return type

[**Institutions**](Institutions.md)

# **read_institution**
> Institution read_institution(institution_code)

Read institution

This endpoint allows you to see information for a specific institution.

### Example
```ruby
# load the gem
require 'atrium-ruby'
# setup authorization
MX.configure do |config|
  # Configure API key authorization: apiKey
  config.api_key['MX-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['MX-API-Key'] = 'Bearer'

  # Configure API key authorization: clientID
  config.api_key['MX-Client-ID'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['MX-Client-ID'] = 'Bearer'
end

api_instance = MX::InstitutionsApi.new

institution_code = 'institution_code_example' # String | The institution_code of the institution.


begin
  #Read institution
  result = api_instance.read_institution(institution_code)
  p result
rescue MX::ApiError => e
  puts "Exception when calling InstitutionsApi->read_institution: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **institution_code** | **String**| The institution_code of the institution. | 

### Return type

[**Institution**](Institution.md)

# **read_institution_credentials**
> Credentials read_institution_credentials(institution_code)

Read institution credentials

Use this endpoint to see which credentials will be needed to create a member for a specific institution.

### Example
```ruby
# load the gem
require 'atrium-ruby'
# setup authorization
MX.configure do |config|
  # Configure API key authorization: apiKey
  config.api_key['MX-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['MX-API-Key'] = 'Bearer'

  # Configure API key authorization: clientID
  config.api_key['MX-Client-ID'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['MX-Client-ID'] = 'Bearer'
end

api_instance = MX::InstitutionsApi.new

institution_code = 'institution_code_example' # String | The institution_code of the institution.


begin
  #Read institution credentials
  result = api_instance.read_institution_credentials(institution_code)
  p result
rescue MX::ApiError => e
  puts "Exception when calling InstitutionsApi->read_institution_credentials: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **institution_code** | **String**| The institution_code of the institution. | 

### Return type

[**Credentials**](Credentials.md)
