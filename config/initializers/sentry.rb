Sentry.init do |config|
    config.dsn = 'https://8ea77f10b55570a4577dc110059e6bf1@o4506562142339072.ingest.sentry.io/4506562143715328'
    config.breadcrumbs_logger = [:active_support_logger, :http_logger]
  
    # Set traces_sample_rate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production.
    config.traces_sample_rate = 1.0
    # or
    config.traces_sampler = lambda do |context|
      true
    end
  end