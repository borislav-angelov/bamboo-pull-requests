
module Bamboo
  module Client
    module Http
      class Json < Abstract

        def post(uri_or_path, data = {}, cookies = nil, query = nil)
          resp = RestClient.post(uri_for(uri_or_path, query), data.to_json, :accept => :json, :content_type => :json, :cookies => cookies)
          Doc.from(resp) unless resp.empty?
        end

      end # Json
    end # Http

    class Rest < Abstract

      class Plan

        def latest_results
          @http.get File.join(SERVICE, "result/#{URI.escape key}/latest"), {}, @http.cookies
        end

        def queue(query = nil)
          @http.post File.join(SERVICE, "queue/#{URI.escape key}"), {}, @http.cookies, query
        end

      end # Rest
    end # Plan

  end # Client
end # Bamboo