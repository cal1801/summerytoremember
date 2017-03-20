class SitemapController < ApplicationController
  layout nil

  def index
    headers['Content-Type'] = 'application/xml'
    last_post = Camp.last
    if stale?(:etag => last_post, :last_modified => last_post.updated_at.utc)
      debugger;
      respond_to do |format|
        format.xml { @camps = Camp.all }
      end
    end
  end
end
