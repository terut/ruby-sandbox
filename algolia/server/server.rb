require 'webrick'
require 'forwardable'
require 'ostruct'
require 'yaml'

class ViewContext
  extend Forwardable

  def initialize(context)
    @context = context
    (class << self; self; end).class_eval { def_delegators :@context, *context.to_h.keys }
  end

  def erb_binding
    binding
  end
end

project_root = File.expand_path("../", File.dirname(__FILE__))
users = YAML.load_file(File.join(project_root, "users.yaml"))

root = File.join(project_root, 'server/public')
server = WEBrick::HTTPServer.new Port: 8080, DocumentRoot: root

trap 'INT' do server.shutdown end

server.mount_proc '/' do |req, res|
  username = (req.query["username"] || users.keys.first).to_sym
  context = ViewContext.new(OpenStruct.new(
    current_username: username,
    organization: users[username][:organization],
    groups: users[username][:groups],
    users: users.keys,
    app_id: ENV["APP_ID"],
    secured_api_key: users[username.to_sym][:secured_api_key]
  ))
  view = ERB.new(File.read(File.join(project_root, "server/index.html.erb")))
  res.body = view.result(context.erb_binding)
end

server.mount("/app.js", WEBrick::HTTPServlet::FileHandler, File.join(root, "app.js"))

server.start
