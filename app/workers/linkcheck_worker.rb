class LinkcheckWorker
  include Sidekiq::Worker

  def perform(linkcheck_id)
    # linkcheck = Linkcheck.find(linkcheck_id)


  end
end

