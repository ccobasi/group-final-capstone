require 'swagger_helper'

RSpec.describe 'api/cars', type: :request do
    path '/api/v1/cars_controller'do

        post 'Creates a Car' do
          tags 'Cars'
          consumes 'application/json'
          parameter name: :car, in: :body, schema: {
            type: :object,
            properties: {
                id: { type: :integer },
                created_at: { type: :string },,
                updated_at: { type: :string },
                name: { type: :string },
                image_data: { type: :string }
            },
            required: [ 'id', 'name', 'image_data' ]
          }
    
          response '201', 'car created' do
            let(:car) { { title: 'foo', content: 'bar' } }
            run_test!
          end
    
          response '422', 'invalid request' do
            let(:blog) { { title: 'foo' } }
            run_test!
          end
        end
      end
    
      path '/blogs/{id}' do
    
        get 'Retrieves a car' do
          tags 'Cars', 'Another Tag'
          produces 'application/json', 'application/xml'
          parameter name: :id, in: :path, type: :string
    
          response '200', 'car found' do
            schema type: :object,
              properties: {
                id: { type: :integer },
                name: { type: :string },
                created_at: { type: :string },,
                updated_at: { type: :string },
                image_data: { type: :string }
              },
              required: [ 'id', 'name', 'image_data' ]
    
            let(:id) { Car.create(id: '1', name: 'bar', image_data: 'wnjedjdj').id }
            run_test!
          end
    
          response '404', 'car not found' do
            let(:id) { 'invalid' }
            run_test!
          end
    
          response '406', 'unsupported accept header' do
            let(:'Accept') { 'application/foo' }
            run_test!
          end
        end
      end
end
