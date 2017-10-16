json.extract! page, :id, :title, :slug, :content, :status, :metadescription, :metatitle, :created_at, :updated_at
json.api api_v1_site_page_url(page, format: :json, id: page.id, api_key: @api_key)
